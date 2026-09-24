# WordPress 6.5.3 Application Environment ()

This is a reproducible environment built from pinned source commit `c54b7021fe1ad22ff3ce2b61dd741b3d7e71596a` targeting platform `linux/amd64`. Delivered as an all-in-one container image `yorem/wordpress:6.5.3`, encapsulating WordPress 6.5.3、PHP 8.2、Apache 和 MariaDB。

## Quick Start

Execute from the repository root:

```bash
cd applications/wordpress/6.5.3
docker run -d -p 18513:80 yorem/wordpress:6.5.3
```

Users only need to execute `docker run`. Docker automatically pulls the image from Docker Hub. The image encapsulates the application runtime, database, initial schemas, and administrative accounts; no local build scripts, bootstrap steps, or web installers are required.

## Access & Credentials

- Web Frontend: <http://127.0.0.1:18513/>
- Admin Dashboard: <http://127.0.0.1:18513/wp-admin/>
- Initial Username: `admin`
- Initial Role: Administrator
- Initial Password: `WcWord!26-aQ6nT3F`

Opening the frontend renders the live WordPress application; logging in accesses the Dashboard and administrative menus (Posts, Media, Pages, Comments, Appearance, Users).

## Verification

Host health check accesses the public HTTP endpoint:

```bash
WORDPRESS_URL=http://127.0.0.1:18513 ./scripts/healthcheck.sh
```

Verify admin account via live WordPress login form:

```bash
WORDPRESS_URL=http://127.0.0.1:18513 WORDPRESS_USER=admin WORDPRESS_PASSWORD='WcWord!26-aQ6nT3F' ./resources/login.sh
```

Create a standard user via internal WordPress API (executed inside container, Subscriber role):

```bash
WORDPRESS_CONTAINER=<容器名或ID> ./resources/register.sh reader 'Verify-User-2026!' reader@example.local Reader
```

## State Reset

Reset purges the database inside the container and restarts the service, automatically restoring default sites and admin credentials (`wp-content` preserved):

```bash
WORDPRESS_CONTAINER=<容器名或ID> ./scripts/reset.sh
```

## Directory Structure

- `manifest.yaml`: Pinned version, source, runtime, image, and operation entrypoints.
- `source/`: Upstream provenance (`source.yaml`); raw source snapshot excluded.
- `docker/`: Final Dockerfile, standalone Dockerfile, and Compose configurations.
- `resources/`: Account and role descriptions, login and user registration helper scripts.
- `scripts/`: Image build, up, entrypoint, host healthcheck, and reset scripts.
- `image/`: Metadata (`image.json`); images pulled from Docker Hub.
