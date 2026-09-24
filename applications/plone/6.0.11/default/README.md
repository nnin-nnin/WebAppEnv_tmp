# Plone 6.0.11

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
- URL: http://localhost:18575/Plone
- Admin Username: `admin`
- Admin Password: `admin`

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
