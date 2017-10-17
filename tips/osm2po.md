# Osm2po
## Daten vorbereiten
- Download XML z.B. von osm.org
- Mit [Osmosis](https://wiki.openstreetmap.org/wiki/Osmosis) zu PBF konvertieren

```bash
osmosis --read-xml data/helvetiaplatz.osm --write-pbf data/helvetiaplatz.pbf
```
## Convert mit osm2po
- <http://osm2po.de/>
- Im Config-file `osm2po.config` folgendes hinzufügen:
```
postp.0.class = de.cm.osm2po.plugins.postp.PgRoutingWriter
```
- SQL-File erstellen:
```bash
java -jar osm2po-core-5.1.0-signed.jar prefix=hp cmd=c data/helvetiaplatz.pbf 
```
- Die SQL-Files sind nun im Ordner `<prefix>`, hier `hp`
## Import in PostGIS
- Es braucht eine Postgres-Instanz mit den Plugins für PostGIS und pgRouting
- PostGIS starten, z.B. im Docker:
```
docker run --name pgis -p 5432:5432 -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=osm_helvetiaplatz starefossen/pgrouting
```
- Import in Datenbank
```
psql --host=localhost -U postgres -d osm_helvetiaplatz -f hp/hp_2po_4pgr.sql
```

## QGIS
- Plugin `pgRouting Layer` installieren (experimentelle Plugins müssen aktiviert sein)
- Im DB Manager die DB-Verbindung einrichten. Wichtig: Username und Passwort speichern
