# Magento 2.2.7

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
- URL: http://localhost:18636
- 安装/登录向导页面：http://localhost:18636/setup/ 或 http://localhost:18636/admin/
- Default Admin Username: admin
- Default Admin Password: admin
- 数据库连接：主机 `mysql`，用户名 `root`，密码 `root`，数据库 `magento`

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
