# Bolt CMS 3.7.1

Native Docker Compose deployment for Bolt CMS 3.7.1.

## Prerequisites
- Docker Engine
- Docker Compose v2
- Access to Docker Hub

## Quick Start

Start the application:
```bash
bash scripts/up.sh
```

## Access and Credentials
- Application URL: http://127.0.0.1:18589/
- Login URL: http://127.0.0.1:18589/bolt/login
- Admin Username: `admin`
- Admin Password: `benchmark-only`

## Health Check
```bash
bash scripts/healthcheck.sh
```

## Reset / Teardown
```bash
bash scripts/reset.sh
```
