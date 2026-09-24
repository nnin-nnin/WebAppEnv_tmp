# Redash 10.0.0

Native Docker Compose application environment.

## Basic Information
- 应用名称：redash
- 版本：10.0.0
- Target architecture: linux/amd64
- Deployment mode: native_compose
- Delivery mechanism: Docker Hub

## Ports & Credentials
- Access URL: http://localhost:18610
- Admin Username: `admin@example.com`
- Admin Password: `AdminPassword123!`

## Quick Start
Navigate to this directory and run:
```bash
bash scripts/up.sh
```

## Health Check & Verification
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
