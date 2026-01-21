# UDG Pre-Plan Submission Checker (Proceed Build v1.2.0)

## Run (Windows)
1) Unzip
2) Double click: `scripts/START_1CLICK.bat`
3) Open: http://127.0.0.1:5174

## What is wired right now
- Address -> geocode (Nominatim)
- Parcel -> eThekwini public ArcGIS (Property_Query)
- Zoning -> eThekwini public ArcGIS (Land_Use_Management)
- Sewer -> eThekwini public ArcGIS (Water_Sanitation)

## What is structured but disabled until you confirm layer URLs
stormwater, water_supply, roads, servitudes, contours, floodplain_100yr
(See `config/source_registry.json`.)
