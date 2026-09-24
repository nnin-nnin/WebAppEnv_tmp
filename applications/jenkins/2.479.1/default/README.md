# Jenkins 2.479.1

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
- URL: http://localhost:18581
- Login Page: http://localhost:18581/login
- Admin Username: `admin`
- Admin Password: `admin`

## Verification
```bash
bash scripts/healthcheck.sh
```

## State Reset
```bash
bash scripts/reset.sh
```
