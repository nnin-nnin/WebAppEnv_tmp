# Webmin 2.100

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
- URL: http://localhost:18626
- Login Page: http://localhost:18626/session_login.cgi
- Admin Username: `root`
- Admin Password: `password`

## Verification
```bash
bash scripts/healthcheck.sh
```

## State Reset
```bash
bash scripts/reset.sh
```
