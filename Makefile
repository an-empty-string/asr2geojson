all: asr-spatial.sqlite3

.PHONY: clean
clean:
	rm -f asr-spatial.sqlite3 asr.gpkg asr.geojson asr.sqlite3 *.dat *.dat.fixed a_tower.zip counts

asr-spatial.sqlite3: asr.geojson
	ogr2ogr -f "SQLite" -dsco SPATIALITE=YES asr-spatial.sqlite3 asr.geojson

asr.gpkg: asr.geojson
	ogr2ogr asr.gpkg asr.geojson

asr.geojson: out_geojson.py asr.sqlite3
	python3 out_geojson.py

asr.sqlite3: import_data.py AT.dat.fixed CO.dat.fixed EC.dat.fixed EN.dat.fixed HS.dat.fixed RA.dat.fixed RE.dat.fixed RS.dat.fixed SC.dat.fixed
	rm -f asr.sqlite3
	sqlite3 asr.sqlite3 < schema.sql
	python3 import_data.py

%.dat.fixed: %.dat
	python3 fix_file.py $< $@

AT.dat CO.dat EC.dat EN.dat HS.dat RA.dat RE.dat RS.dat SC.dat: a_tower.zip
	unzip a_tower.zip
	touch AT.dat CO.dat EC.dat EN.dat HS.dat RA.dat RE.dat RS.dat SC.dat

a_tower.zip:
	curl -LO https://data.fcc.gov/download/pub/uls/complete//a_tower.zip
