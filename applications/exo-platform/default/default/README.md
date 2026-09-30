# eXo Platform (default)

eXo Platform is an open-source digital workplace and intranet solution built on Java.

## Application Details

- **Application Name**: eXo Platform
- **Version**: default
- **Upstream Repository**: https://github.com/exoplatform/exo-community.git
- **Upstream Commit**: 512519e82cb7029fa94895007dc52a9dc4b4892e
- **Default Port**: 18824
- **Admin Username**: admin (root also available)
- **Admin Password**: AdminPassword123!

## Architecture

This environment is deployed using native Docker Compose with two containers:
1. `elasticsearch`: Search and analytics engine running Elasticsearch 8.14.3 (`elasticsearch:8.14.3@sha256:1ddbb1ae0754278f3ab53edc24fcc5c790ebc2422cc47abea760b24abee2d88a`).
2. `application`: eXo Platform portal server running Tomcat on Java 21 (`yorem/exo-platform:default@sha256:b7becad322b60255189b7338b732e9d261a3cef2ecd18bf22e67707353df4eef`), bound to host port 18824.

## Lifecycle Scripts

- `scripts/up.sh`: Start services via Docker Compose, wait for portal readiness, and initialize administrator credentials.
- `scripts/healthcheck.sh`: Verify HTTP accessibility on port 18824.
- `resources/login.sh`: Verify admin credentials against eXo Platform.
- `scripts/reset.sh`: Tear down containers and clean up volumes.
