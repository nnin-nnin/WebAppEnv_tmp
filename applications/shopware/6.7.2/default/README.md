# Shopware 6.7.2

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
- URL: http://localhost:18595
- Admin Dashboard: http://localhost:18595/admin
- Admin Username: `admin`
- Admin Password: `shopware`

## Verification
```bash
bash scripts/healthcheck.sh
```

## State Reset
```bash
bash scripts/reset.sh
```
