# Monica 4.1.2 Native Multi-Container Docker Compose Environment

This directory delivers the complete Web Application Environment for Monica 4.1.2. The backend source is pinned to:
`https://github.com/monicahq/monica.git` commit
`50c266f7beb9d8fe6cd8c8929a759529275143f4`, deployed under the
`native_compose` topology.

This is a native multi-container Docker Compose environment, not an all-in-one single container. The application, Nginx web gateway, database, Redis cache, cron worker, queue worker, and MailHog debug server run in isolated containers. Compose manages the bridge network; services communicate via service names (`db`, `redis`, `mail`). Users do not need to manually configure Docker networks, install databases, or import SQL dumps.

## Prerequisites

- Docker Engine 24+ and Docker Compose v2.
- Target platform is `linux/amd64` (ARM64 hosts supported via Docker emulation).
- Network access to Docker Hub to pull pre-built images.
- Host ports `18097` and `18087` available.

## Quick Start

This is a `native_compose` environment. Pull custom app/web images and official service dependencies directly via Compose:

```bash
cd applications/monica/4.1.2
docker compose -f docker/compose.yaml pull
bash scripts/up.sh
```

`scripts/up.sh` waits until all 7 Compose services report healthy. Users do not need to compile code, create databases, or execute Composer, npm, or Yarn commands.

```bash
docker compose -f docker/compose.yaml up -d
```

Recommended launch using the health-wait orchestration script:

```bash
bash scripts/up.sh
```

## Access & Credentials

- Web Entrypoint: <http://localhost:18097/>
- Login Page: <http://localhost:18097/login>
- Expected Landing Page: `/dashboard` displaying Monica Dashboard, People, and Journal menus.
- API Root: <http://localhost:18097/api> (uses Monica's native authentication; OAuth token entrypoint at `/oauth/token`).
- Default Admin Account: `admin` (mapped to `admin@example.com`).
- Admin Password: `benchmark-only`.
- Role: First account owner with full administrator privileges.

Monica 4.1.2 enforces valid email addresses for login identifiers; hence `admin@example.com` serves as the benchmark administrator account (recorded in `resources/users.yaml`). The application container creates this account via `php artisan account:create` idempotently on first start.

## Service Topology

| Compose Service | Pinned Image | Responsibility | Exposed Port |
| :--- | :--- | :--- | :--- |
| `app` | `yorem/monica:4.1.2-app` | Monica PHP-FPM core, migrations, and initialization | Internal |
| `web` | `yorem/monica:4.1.2-web` | Nginx static assets and FastCGI web gateway | `18097:80` |
| `db` | `mariadb:11.4.2` | Primary MariaDB relational store | Internal |
| `redis` | `redis:7.2.5-alpine` | Cache, sessions, and Redis queue | Internal |
| `cron` | `yorem/monica:4.1.2-app` | Monica schedule worker | Internal |
| `queue` | `yorem/monica:4.1.2-app` | Monica Redis queue worker | Internal |
| `mail` | `mailhog/mailhog:v1.0.1` | Local SMTP capture and webmail debugging | `18087:8025` |

`cron` and `queue` share the same base application image but execute as decoupled Compose containers. Persistent data is maintained via named volumes.

## Verification

Validate script syntax and Compose configuration:

```bash
bash -n scripts/*.sh resources/*.sh
docker compose -f docker/compose.yaml config --quiet
```

Execute automated healthcheck and live credential verification:

```bash
bash scripts/healthcheck.sh
APP_URL=http://localhost:18097 bash resources/login.sh
```

Register and test a standard regular user via the native CLI helper:

```bash
bash resources/register.sh benchmark-user@example.com benchmark-user-password Benchmark User
APP_URL=http://localhost:18097 \
  APP_USERNAME=benchmark-user@example.com \
  APP_PASSWORD=benchmark-user-password \
  bash resources/login.sh
```

Inspect services and operational logs:

```bash
docker compose -f docker/compose.yaml ps
docker compose -f docker/compose.yaml logs --tail=100 app web db redis cron queue mail
```

Test restart persistence:

```bash
docker compose -f docker/compose.yaml restart
bash scripts/healthcheck.sh
APP_URL=http://localhost:18097 bash resources/login.sh
```

## State Reset

Purges the `monica_4_1_2` Compose topology, removing containers, networks, and named volumes:

```bash
bash scripts/reset.sh
bash scripts/up.sh
```

## Version & Image Source

Images are distributed via Docker Hub using `yorem/monica:4.1.2-app` and `yorem/monica:4.1.2-web`. Digests are recorded in `image/image.json`. All runtimes declare `linux/amd64`. Front-end assets are pre-compiled into images; no runtime CDN or external package downloads are required.

## Directory Structure

- `manifest.yaml`: Application metadata, topology, runtime, images, volumes, and operational scripts.
- `source/`: Upstream provenance (`source/source.yaml`) locking commit hash; raw source tree excluded.
- `docker/`: Dockerfile, Nginx config, and entrypoint scripts.
- `resources/`: Pre-seeded users, role definitions, and authentication helper scripts.
- `scripts/`: Operations scripts (up.sh, healthcheck.sh, reset.sh).
- `image/`: Metadata (`image.json`) locking Docker Hub digests.

## Differences Between Official and Deliverable Compose

1. Consolidated developmental configurations into a production-grade `docker/compose.yaml`.
2. Built custom app/web images pinned to exact commit `50c266f7beb9d8fe6cd8c8929a759529275143f4`.
3. Pinned MariaDB to `11.4.2` and Redis to `7.2.5-alpine`.
4. Replaced developmental bind-mounts with managed named volumes.
5. Embedded strict `depends_on` health assertions and 180s startup timeouts.
6. Embedded local MailHog for self-contained, offline email testing (<http://localhost:18087/>).
7. Pre-configured idempotent admin creation on cold start.

## Known Constraints & Assumptions

- Benchmark-only testing environment; secrets are test fixtures and must not be used in production.
- Architecture targets `linux/amd64`.
- Monica requires email syntax for usernames; `admin` is represented as `admin@example.com`.
