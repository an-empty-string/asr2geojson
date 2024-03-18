# asr2geojson

tools for grabbing the FCC's Antenna Structure Registration database and converting it to a normal format (geojson, geopackage, or spatialite)

most useful for answering the question "who owns that antenna over there?" or finding cool antenna sites near you

## dependencies

* some `make` implementation
* curl
* Python 3.7 or better
* [GDAL](https://gdal.org/index.html) (`gdal-bin` in Debian-alikes should be enough, we just need `ogr2ogr`)

## usage

if you want spatialite, just run make! you'll get `asr-spatial.sqlite3` as output; the result is suitable for loading in QGIS or your favorite tool

if you want geopackage, you'll need `make asr.gpkg`

the geojson file (`make asr.geojson`) is consumable too, but it's not spatially indexed, so for interactive usage you should prefer one of the other formats

## license

this tool is licensed under the Friends and Lovers License; see [LICENSE](./LICENSE)
