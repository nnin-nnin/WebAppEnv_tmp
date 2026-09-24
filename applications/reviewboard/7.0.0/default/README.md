# Review Board 7.0.0

Native Docker Compose deployment for Review Board 7.0.0 with MariaDB 10.11 database.

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
- Application URL: http://127.0.0.1:18596/
- Login URL: http://127.0.0.1:18596/account/login/
- Admin Username: `admin`
- Admin Password: `AdminPassword123!`

## Health Check
```bash
bash scripts/healthcheck.sh
```

## Reset / Teardown
```bash
bash scripts/reset.sh
```
