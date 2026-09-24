# Bonita BPM 7.15.0

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
- URL: http://localhost:18578/bonita/
- Login Page: http://localhost:18578/bonita/login.jsp
- Admin Username: `install`
- Admin Password: `install`

## Verification
```bash
bash scripts/healthcheck.sh
```

## State Reset
```bash
bash scripts/reset.sh
```
