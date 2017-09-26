# Overpass

## overpass-turbo

[overpass-turbo](https://overpass-turbo.eu/)

` Einstellung - Allgemeines - Server: //overpass.osm.ch/api/ `

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
