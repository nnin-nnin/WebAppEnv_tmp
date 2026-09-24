# October CMS 3.0.0

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
- Frontend URL: http://localhost:18605
- Admin Dashboard: http://localhost:18605/backend
- Admin Username: `admin`
- Admin Password: `admin`

## Verification
```bash
bash scripts/healthcheck.sh
bash resources/login.sh
```

## State Reset
```bash
bash scripts/reset.sh
```
