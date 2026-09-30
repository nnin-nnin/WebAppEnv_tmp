# Gallery (default)

Gallery 3 is an open source web based photo album organizer written in PHP.

## Application Details

- **Application Name**: Gallery
- **Version**: default
- **Upstream Repository**: https://github.com/gallery/gallery3.git
- **Upstream Commit**: c7c18b125662f3e2f10ed5eb41fe21b69c2d4d82
- **Default Port**: 18827
- **Admin Username**: admin
- **Admin Password**: AdminPassword123!

## Architecture

This environment is deployed using native Docker Compose with two containers:
1. `web`: Gallery 3 application running on PHP 5.6 with Apache (`yorem/gallery:default@sha256:71f419a1b59684a1464ff52de2b53d823dfe9f668f00b0e13554013164c2e705`), bound to host port 18827.
2. `db`: MariaDB 10.5 database initialized with pre-seeded database tables and admin user credentials.

## Lifecycle Scripts

- `scripts/up.sh`: Start services via Docker Compose and wait for health.
- `scripts/healthcheck.sh`: Verify HTTP accessibility on port 18827.
- `resources/login.sh`: Verify admin credentials via AJAX login flow.
- `scripts/reset.sh`: Tear down containers and clean up volumes.
