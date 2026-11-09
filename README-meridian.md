# Meridian Operations Portal — public training edition

This branch contains a fictional, public-safe cybersecurity learning simulation built with Java 17 and Tomcat 9, designed to deploy directly on Render Free. It is separate from the repository's default branch.

## Source layout
The sanitised source is stored as six verified base64-encoded parts in `meridian-source/part-00.b64` through `part-05.b64`. The Dockerfile assembles and extracts the archive inside Render's remote Docker build, then compiles the Java servlet. This is a transport workaround because the GitHub connector cannot upload local files directly.

The release source has also been provided separately as a conventional ZIP archive with individual files. Further development should use that extracted source as a dedicated repository when available.

## Safety
The initial-access and uploaded server component stages are simulations; the submitted specimen is compared against an exact SHA-256 fingerprint and is never saved or executed. The Java handler only processes allowlisted synthetic operations, creates an AES-GCM encrypted PDF response, and does not provide shell, outbound scanning, credentials, or arbitrary code execution.

## Deployment
Render Web Service; Docker runtime; branch `meridian-public-v2-1`; Free plan; Frankfurt region; `PORT=10000`. Health path: `/api/health`. Free services sleep when inactive and lose in-memory state.

This application and all demonstration data are entirely fictional.
