# Overpass

[overpass-api](http://overpass-api.de/)

## overpass-turbo

[overpass-turbo](https://overpass-turbo.eu/)

` Einstellung - Allgemeines - Server: //overpass.osm.ch/api/ `
- Wiki: <https://wiki.openstreetmap.org/wiki/Overpass_API>
  - [Overpass QL](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL)
- Haltestellen sind mit `public_transport = stop_position` getagged
  - Namens-Schemas sind im [Wiki](https://wiki.openstreetmap.org/wiki/Public_transport)

### Test-Request

[direct link](http://overpass-turbo.eu/s/rYu)
```
[out:json][timeout:25];
// gather results
(
  node["public_transport"="stop_position"]({{bbox}});
);
// print results
out body;
>;
out skel qt;
```
