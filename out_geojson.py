import json
import sqlite3

conn = sqlite3.connect("asr.sqlite3")
conn.row_factory = sqlite3.Row

cur = conn.cursor()
count = 0

coords = {
    row["unique_system_identifier"]: row
    for row in cur.execute("SELECT * FROM application_coordinates")
    if row["longitude_total_seconds"] and row["latitude_total_seconds"]
}

print("loaded", len(coords), "coords")

entities = {
    row["unique_system_identifier"]: row
    for row in cur.execute("SELECT * FROM registration_entities")
}

print("loaded", len(entities), "registration entities")

features = []

for row in cur.execute("SELECT * FROM registration_data"):
    if row["date_dismantled"] or not row["date_constructed"]:
        continue

    if row["unique_system_identifier"] not in coords:
        continue

    co = coords[row["unique_system_identifier"]]

    lon = (float(co["longitude_total_seconds"]) / 3600) * (
        -1 if co["longitude_direction"] == "W" else 1
    )
    lat = (float(co["latitude_total_seconds"]) / 3600) * (
        -1 if co["latitude_direction"] == "S" else 1
    )

    properties = {}
    properties.update({f"reg_{key}": value for key, value in dict(row).items()})
    properties.update(
        {
            f"entity_{key}": value
            for key, value in dict(entities[row["unique_system_identifier"]]).items()
        }
    )

    features.append(
        {
            "type": "Feature",
            "geometry": {
                "type": "Point",
                "coordinates": [lon, lat],
            },
            "properties": properties,
        }
    )

print("writing", len(features), "features")

geojson_data = {
    "type": "FeatureCollection",
    "crs": {"type": "name", "properties": {"name": "urn:ogc:def:crs:OGC:1.3:CRS84"}},
    "features": features,
}

with open("asr.geojson", "w") as f:
    json.dump(geojson_data, f)

print("all set!")
