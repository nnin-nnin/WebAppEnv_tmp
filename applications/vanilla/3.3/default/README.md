# Vanilla Forums 3.3

Native Docker Compose application environment.

## Prerequisites
- Docker Engine
- Docker Compose v2
- Network access to Docker Hub

## 架构说明
- **app**: Vanilla Forums 3.3 Web 应用容器（`yorem/vanilla:3.3`），端口映射 `18603:80`。
- **db**: 独立 MariaDB 数据库容器（`mariadb:10.11`），通过 Compose 内部网络与 Web 应用通信。

## Quick Start
Navigate to this directory and run:
```bash
bash scripts/up.sh
```

## Access & Credentials
- URL: http://localhost:18603
- Admin Username: `admin`
- Admin Password: `AdminPassword123!`

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
