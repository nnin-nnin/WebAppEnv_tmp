# Halo 2.17.0

Native Docker Compose application environment.

## Prerequisites
- Docker Engine
- Docker Compose v2
- Network access to Docker Hub

## Quick Start
Navigate to this directory and run:
```bash
bash scripts/up.sh
```

## 访问和控制台
- URL: http://localhost:18582
- 管理控制台：http://localhost:18582/console
- Initial Admin Username: `admin`
- Initial Admin Password: `AdminPassword123!`

## Verification
```bash
bash scripts/healthcheck.sh
bash resources/login.sh
```

## State Reset
```bash
bash scripts/reset.sh
```
