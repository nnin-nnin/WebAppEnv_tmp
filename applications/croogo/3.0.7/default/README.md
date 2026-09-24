# Croogo 3.0.7

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
- URL: http://localhost:18624
- Admin Dashboard: http://localhost:18624/admin 或 http://localhost:18624/admin/users/users/login
- Default Admin Username: croogo
- Default Admin Password: croogo

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
