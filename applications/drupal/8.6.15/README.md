# Drupal 8.6.15 Native Docker Compose Environment

This directory delivers the reproducible, native multi-container Docker Compose environment for Drupal 8.6.15. The Drupal application, initialization service, and PostgreSQL database run in isolated containers.

The source is pinned to the [Drupal Official GitHub Repository](https://github.com/drupal/drupal.git) at commit `91ded4b7776e05ee9633bdc1c458b41c718133e0` (see `source/source.yaml`). Raw source code trees are excluded from version control; pre-built images are pulled directly from Docker Hub.

## Prerequisites

- Docker Engine and Docker Compose v2.
- Target platform: `linux/amd64` (ARM64 hosts supported via emulation).
- Network access to Docker Hub.
- Host port `18090` available (configurable via `DRUPAL_HOST_PORT` in `docker/.env`).

*Note: Drupal 8.6.15, PHP 7.2, and PostgreSQL 10 are deprecated upstream releases intended exclusively for benchmark reproduction in isolated environments.*

## Quick Start

Execute the launch orchestration script:

```bash
cd applications/drupal/8.6.15
bash scripts/up.sh
```

`scripts/up.sh` checks for local images, pulls `yorem/drupal:8.6.15` and `postgres:10.23-bullseye` from Docker Hub if absent, and starts the Compose topology.

Alternatively, execute Compose directly:

```bash
docker compose --env-file docker/.env -f docker/compose.yaml up -d
```

No manual database installation, SQL imports, or browser install wizards are needed. The internal `installer` service bootstraps the database schema and creates default administrator credentials on first run.

## Access & Credentials

- Homepage: <http://127.0.0.1:18090/>
- Login Page: <http://127.0.0.1:18090/user/login>
- Initial Admin Username: `admin`
- Initial Admin Password: `Drupal8615Admin!`
- Initial Role: `administrator`
- Admin Email: `admin@example.test`

Credentials are benchmark fixtures defined in `docker/.env` and `resources/users.yaml`. Regular test users can be registered via `resources/register.sh`.

## Services

| Service | Responsibility | Image | Exposed Port |
| :--- | :--- | :--- | :--- |
| `application` | Drupal 8.6.15, Apache, PHP runtime | `yorem/drupal:8.6.15` | `${DRUPAL_HOST_PORT}:80` (default `18090:80`) |
| `installer` | Bootstraps DB schema & admin user on first launch | `yorem/drupal:8.6.15` | Internal |
| `db` | Relational PostgreSQL database | `postgres:10.23-bullseye` | Internal |

Services communicate via internal service names (`db`). Databases, settings, and file uploads are persisted in named volumes.

## Verification

Verify upstream metadata and image availability:

```bash
test -s source/source.yaml
docker pull --platform linux/amd64 yorem/drupal:8.6.15
docker pull --platform linux/amd64 postgres:10.23-bullseye
docker image inspect yorem/drupal:8.6.15 postgres:10.23-bullseye
```

Verify service orchestration and live login:

```bash
bash -n scripts/*.sh resources/*.sh
docker compose --env-file docker/.env -f docker/compose.yaml config --quiet
bash scripts/healthcheck.sh
bash resources/login.sh
```

Register a regular test user:

```bash
bash resources/register.sh acceptance-user 'Acceptance8615!' acceptance-user@example.test
```

## Stop & State Reset

Stop containers while preserving data:

```bash
docker compose --env-file docker/.env -f docker/compose.yaml down
```

Reset environment, removing containers, networks, and persistent volumes:

```bash
bash scripts/reset.sh
```

Re-running `bash scripts/up.sh` re-initializes a fresh Drupal installation.

## Directory Structure

- `manifest.yaml`: Metadata manifest detailing application, runtime, ports, and operational scripts.
- `source/`: Upstream provenance (`source/source.yaml`) locking commit hash.
- `docker/`: Dockerfile, compose.yaml, and environment configuration.
- `resources/`: Pre-seeded users, roles, and automated login/registration scripts.
- `scripts/`: Operations scripts (up.sh, healthcheck.sh, reset.sh, build.sh, publish.sh).
- `image/`: Metadata (`image.json`) locking immutable digests.

## Known Constraints & Assumptions

- Pinned deprecated components for academic evaluation; do not expose to public networks.
- Architecture targets `linux/amd64`.
