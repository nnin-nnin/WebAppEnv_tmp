# Apache RocketMQ 5.3.4

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

## 访问和配置
- NameServer 地址：localhost:18594 (容器端口 9876)
- 协议：RocketMQ Remoting Protocol / TCP

## Verification
```bash
bash scripts/healthcheck.sh
bash resources/login.sh
```

## State Reset
```bash
bash scripts/reset.sh
```
