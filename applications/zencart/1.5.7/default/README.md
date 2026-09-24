# Zen Cart 1.5.7 Application Environment (Compose)

This document describes how to deploy and verify the reproducible Zen Cart 1.5.7 application environment.

## 1. Environment Details

- **Application**: Zen Cart
- **Version**: 1.5.7
- **Source Repository**: `https://github.com/zencart/zencart`
- **Source Commit**: `0ad1b0990f0d13080fa7c9c79a1c51187ae78afc`
- **Deployment**: Docker Compose (TurnKey Appliance: Apache + MariaDB 10.1 + PHP 7.0)
- **Exposed Port**: `18625`

## 2. Launch Instructions

Navigate to this environment directory and launch:

```bash
cd applications/zencart/1.5.7/default
./scripts/up.sh
```

Or execute Docker Compose directly:

```bash
docker compose -f docker/compose.yaml up -d
```

## 3. Access & Credentials

- **Storefront URL**: `http://localhost:18625/`
- **Admin Dashboard URL**: `http://localhost:18625/admin/` (或 `http://localhost:18625/manage/`)
- **Customer Login URL**: `http://localhost:18625/index.php?main_page=login`
- **Admin Username**: `admin`
- **Admin Password**: `benchmark-only`

## 4. Verification Methods

Execute automated health check:

```bash
./scripts/healthcheck.sh
```

Execute authentication endpoint test:

```bash
./resources/login.sh
```

## 5. Data Reset

Reset all containers and persistent data:

```bash
./scripts/reset.sh
```

## 6. Directory Structure & Files

- `manifest.yaml`: Describes application version, source commit, ports, and operational script index
- `source/source.yaml`: Pinned upstream GitHub repository URL and commit hash
- `source/SHA256SUMS`: Source metadata hash verification checksums
- `docker/compose.yaml`: Service topology definition and port mappings
- `image/image.json`：镜像元数据定义
- `resources/`: Pre-seeded user roles and login.sh verification script
- `scripts/`: Operations scripts (up.sh, healthcheck.sh, reset.sh)
