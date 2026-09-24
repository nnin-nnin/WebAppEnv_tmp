# SMF (Simple Machines Forum) 2.0.18

SMF 2.0.18 Native Docker Compose application environment.

## Prerequisites
- Docker Engine 20.10+
- Docker Compose v2+
- 镜像仓库网络访问（Docker Hub）

## Quick Start
Navigate to the application directory and run:
```bash
bash scripts/up.sh
```

## Access & Credentials
- Access URL: http://localhost:18622
- Admin Username: `admin`
- Admin Password: `AdminPassword123!`

## Verification
```bash
bash scripts/healthcheck.sh
```

## Reset & Cleanup
```bash
bash scripts/reset.sh
```
