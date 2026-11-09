# Havenfield Spatial Services — hosted GIS & JSP forensic training lab

This branch hosts a **functional fictional GIS web application**, independently of the operator exercise.

- / — interactive map, layer filtering, asset inspector, catalogue, and service manager.
- /operator.html — separate HTTP operator workstation with approved specimen upload, AES request encoding, JSP responses, PDF stream extraction and session telemetry.
- /api/health, /api/layers, /api/catalog, /api/services — real Java/Tomcat service routes.
- /shell/notice.jsp — real JSP endpoint processing only approved fixed synthetic operations and in-memory approved class loading.

The source archive `gis-source/part-00.b64` is gzip+tar encoded to support the preexisting GitHub/Render Docker build pattern. It contains `src/`, `web/` and `scripts/` with readable Java, HTML, CSS and JavaScript source. All names, accounts, records and values are invented.

## Demonstration workflow
1. Explore the independent GIS application at /.
2. Open /operator.html in another tab, download exact specimen, choose file, and POST it to component-intake. The server **never writes or executes uploaded file bytes**; it only enables a packaged fixed JSP endpoint for this browser session.
3. Send AES-encoded init request to define a fixed preapproved Java module in memory.
4. Select settings or records to retrieve actual local synthetic fixture bytes from the server.
5. Save the PDF response and decode its zlib image stream/Base64 to recover those bytes.
6. Check session server events and reset state.

This online exercise is **not a working CVE exploit**, unrestricted JSP web shell, or general-purpose file retrieval system. The initial-access step illustrates the observable effect of an upload trust-boundary failure; every executable and data path is bounded. No real organisation or system is represented.
