# parse-server 7.0.0

Native Docker Compose application environment.

## Basic Information
- 应用名称：parse-server
- 版本：7.0.0
- 上游仓库：https://github.com/parse-community/parse-server
- 交付镜像：`yorem/parse-server:7.0.0@sha256:60cf7ec922406b9998a688fb5ca5d800d95ed8baaf7be7a689de65db36e63744`
- 数据库镜像：`mongo:5.0@sha256:41108d183e972dcbf98d09ed83f6cfc89a471a3f15d06f9d64a95e45d9db8dd2`
- 专属端口：18558:1337

## Prerequisites
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## Quick Start
Navigate to this directory and run:
```bash
bash scripts/up.sh
```

## 访问与健康检查
- 服务地址：http://localhost:18558
- 健康检查：http://localhost:18558/parse/health
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
