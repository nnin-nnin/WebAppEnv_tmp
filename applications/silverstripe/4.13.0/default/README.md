# SilverStripe 4.13.0

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
- URL: http://localhost:18619
- Admin Dashboard: http://localhost:18619/Security/login 或 http://localhost:18619/admin/
- Default Admin Username: admin@example.com
- Default Admin Password: AdminPassword123!

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
