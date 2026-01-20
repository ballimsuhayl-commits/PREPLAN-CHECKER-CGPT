# UDG Pre-Plan Submission Checker (Desktop)

This is a **single-process** local desktop-friendly app:
- You paste an **address**
- It geocodes the address
- Pulls **parcel polygon**, **zoning**, and any **enabled service layers** (sewer/stormwater/water/electricity/roads/servitudes/contours)
- Produces a **JSON evidence pack** + **PDF report**
- Lets you **preview** the PDF in the UI before downloading

## 1-Click Start (Windows)

1. Install **Node.js 20+**.
2. Unzip this folder.
3. Double-click:
   - `scripts/START_1CLICK.bat` (recommended)

It will:
- run `npm install`
- start the server with `node --use-system-ca` (fixes Durban GIS TLS certificate issues)
- open the app in your default browser.

## If Durban GIS still fails (certificate error)

Preferred:
- Always run via `START_1CLICK.bat` or start Node with:
  - `node --use-system-ca server/index.js`

Emergency troubleshooting only (not recommended):
- Set `UDG_INSECURE_TLS=1` and run `npm start`.

## Configure data sources

Edit:
- `config/source_registry.json`

### What’s wired by default
- **Parcels**: eThekwini ArcGIS parcel query service (enabled)
- **Zoning**: eThekwini zoning layer (enabled)
- **Sewer**: enabled if URL is present

### Adding more layers (stormwater, water, electricity, roads, servitudes, contours)

1. Find the ArcGIS REST layer endpoint (it will look like):
   `https://.../arcgis/rest/services/.../MapServer/<LAYER_ID>/query`
2. Add it under `arcgis.<layer_key>.url` and set `enabled: true`.
3. Restart the server.

The app will automatically run **spatial intersects** queries against the parcel polygon.

## Outputs

Every run creates a case folder in:
- `out/<caseId>/`

Including:
- `report.json`
- `report.pdf`
- `parcel.geojson` (if geometry exists)
- `context_map.png` (small OSM tile composite)

## Local URLs

- UI: `http://127.0.0.1:5174`
- API health: `http://127.0.0.1:5174/api/health`

## Next step to true "Desktop App" (optional)

When you are ready, wrap `http://127.0.0.1:5174` using:
- **Tauri** (recommended) or Electron

This repo is intentionally built to be easy to wrap.
