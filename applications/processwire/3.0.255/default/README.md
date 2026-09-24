# ProcessWire 3.0.255

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
- Frontend URL: http://localhost:18554/
- 后台登录：http://localhost:18554/processwire/
- Admin Username: `admin`
- Admin Password: `AdminPassword123!`

## Verification
```bash
bash scripts/healthcheck.sh
```

## Authentication Test
```bash
bash resources/login.sh
```

## State Reset
```bash
bash scripts/reset.sh
```
