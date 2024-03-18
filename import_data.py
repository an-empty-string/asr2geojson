import csv
import sqlite3
import traceback


def get_import_map():
    import_map = []

    with open("schema.sql") as f:
        for line in f:
            line = line.strip()

            if not line.startswith("CREATE TABLE IF NOT EXISTS"):
                continue

            line = line.split()
            table_name, pubacc_name = line[5], line[7]

            import_map.append((pubacc_name[-2:], table_name))

    return import_map


def import_file(conn, pubacc_name, table_name):
    cur = conn.cursor()
    placeholders = {}

    with open(f"{pubacc_name}.dat.fixed", encoding="charmap", newline="") as f:
        for idx, row in enumerate(csv.reader(f, delimiter="|", quoting=csv.QUOTE_NONE)):
            if len(row) not in placeholders:
                placeholders[len(row)] = "(" + ", ".join("?" for _ in row) + ")"

            placeholder = placeholders[len(row)]
            try:
                cur.execute(
                    f"INSERT INTO {table_name} VALUES {placeholder}", tuple(row)
                )
            except sqlite3.OperationalError:
                traceback.print_exc()
                print("line", idx + 1, row)


conn = sqlite3.connect("asr.sqlite3")
for pubacc_name, table_name in get_import_map():
    print("import", pubacc_name, "to", table_name)
    import_file(conn, pubacc_name, table_name)
    conn.commit()

conn.close()
