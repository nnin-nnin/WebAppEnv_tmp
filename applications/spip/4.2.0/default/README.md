# SPIP 4.2.0

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
- Access URL: http://localhost:18611
- 后台登录地址：http://localhost:18611/ecrire/
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
