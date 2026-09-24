# Let's Chat 0.4.8

Native Docker Compose application environment.

## Basic Information
- 应用名称：lets-chat
- 版本：0.4.8
- Target architecture: linux/amd64
- Deployment mode: native_compose
- Delivery mechanism: Docker Hub

## Ports & Credentials
- Access URL: http://localhost:18631
- Login Page: http://localhost:18631/login
- Admin Username: `admin`
- Admin Password: `AdminPassword123!`

## Quick Start
Navigate to this directory and run:
```bash
bash scripts/up.sh
```

## Health Check & Authentication Verification
```bash
bash scripts/healthcheck.sh
```

## Authentication Test
```bash
bash resources/login.sh
```

## Reset & Cleanup
```bash
bash scripts/reset.sh
```
