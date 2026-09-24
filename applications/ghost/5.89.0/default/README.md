# Ghost 5.89.0

Native Docker Compose application environment.

## Basic Information
- 应用名称：ghost
- 版本：5.89.0
- Target architecture: linux/amd64
- Deployment mode: native_compose
- Delivery mechanism: Docker Hub

## Ports & Credentials
- Access URL: http://localhost:18556
- Admin Dashboard: http://localhost:18556/ghost
- Admin Username: `admin@benchmark.local`
- Admin Password: `AdminPassword123!`

## Quick Start
Navigate to this directory and run:
```bash
bash scripts/up.sh
```

## Health Check & Authentication Verification
```bash
bash scripts/healthcheck.sh
```

## Authentication Test
```bash
bash resources/login.sh
```

## Reset & Cleanup
```bash
bash scripts/reset.sh
```
