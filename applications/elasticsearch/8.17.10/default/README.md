# Elasticsearch 8.17.10

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
- URL: http://localhost:18584
- Admin Username: `elastic`（默认禁用安全认证，无需密码）

## Verification
```bash
bash scripts/healthcheck.sh
```

## State Reset
```bash
bash scripts/reset.sh
```
