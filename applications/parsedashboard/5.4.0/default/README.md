# Parse Dashboard 5.4.0

Native Docker Compose application environment.

## Basic Information
- 应用名称：parsedashboard
- 版本：5.4.0
- 上游仓库：https://github.com/parse-community/parse-dashboard
- 交付镜像：`yorem/parsedashboard:5.4.0@sha256:f5137e104f09ce484ceede1890d28b885c7923a71d1e3777dcb59bb2e6d544cd`
- 专属端口：18592:4040

## Prerequisites
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## Quick Start
Navigate to this directory and run:
```bash
bash scripts/up.sh
```

## 访问与健康检查
- 服务地址：http://localhost:18592
- Login Page: http://localhost:18592/login
- Admin Username: `admin`
- Admin Password: `AdminPassword123!`

## Verification
```bash
bash scripts/healthcheck.sh
```

## State Reset
```bash
bash scripts/reset.sh
```
