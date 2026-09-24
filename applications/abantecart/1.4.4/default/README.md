# AbanteCart 1.4.4 Application Environment (Compose)

This document describes how to deploy and verify the reproducible AbanteCart 1.4.4 application environment.

## 1. Environment Details

- **Application**: AbanteCart
- **Version**: 1.4.4 (latest)
- **Source Commit**: `051a50f373fad8c8955800f881e08f2f7620600e`
- **Deployment**: Docker Compose Multi-Container (PHP 8.2 Apache + MariaDB 10.6)
- **Exposed Port**: `18001`

## 2. Launch Instructions

Navigate to this environment directory and launch:

```bash
cd applications/abantecart/1.4.4/default
./scripts/up.sh
```

Or execute Docker Compose directly:

```bash
docker compose -f docker/compose.yaml up -d
```

## 3. Access & Credentials

- **Storefront URL**: `http://localhost:18001`
- **Admin Dashboard URL**: `http://localhost:18001/index.php?s=admin`
- **Admin Username**: `admin`
- **Admin Password**: `benchmark-only`

## 4. Verification Methods

Execute automated health check and authentication test:

```bash
./scripts/healthcheck.sh
```

Or run authentication test directly:

```bash
./resources/login.sh
```

## 5. Data Reset

Reset all containers and persistent data:

```bash
./scripts/reset.sh
```

## 6. Directory Structure & Files

- `manifest.yaml`: Metadata manifest detailing application version, source commit, ports, and scripts
- `source/source.yaml`: Pinned upstream GitHub repository URL and commit hash
- `docker/`: Contains Dockerfile and compose.yaml service topology
- `resources/`: Pre-seeded user roles and automated authentication scripts
- `scripts/`: Operations scripts (up.sh, healthcheck.sh, reset.sh)
