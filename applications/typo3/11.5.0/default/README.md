# TYPO3 11.5.0

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

## Access & Credentials
- Access URL: http://localhost:18623/
- 后台登录地址：http://localhost:18623/typo3/
- Admin Username: `admin`
- Admin Password: `benchmark-only`

## Verification
```bash
bash scripts/healthcheck.sh
```

## Authentication Verification
```bash
bash resources/login.sh
```

## State Reset
```bash
bash scripts/reset.sh
```
