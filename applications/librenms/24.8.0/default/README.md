# LibreNMS 24.8.0 Native Docker Compose Environment交付说明

本交付物包含 **LibreNMS 24.8.0** 的原生多容器 Docker Compose 部署配置及自动化运维与验证脚本。

## 1. Environment Architecture

本环境采用原生多容器 topology：

- **app**: LibreNMS 网络监控 Web 应用容器（基于 Nginx 与 PHP 8.4），对外暴露端口 `18588:8000`。
- **db**: 独立 MariaDB 数据库容器（`mariadb:10.11`），通过 Compose 内部网络与 Web 应用通信。

## 2. Prerequisites

- Docker Engine 20.10+
- Docker Compose v2+
- Target architecture: `linux/amd64` (ARM64 hosts supported via Rosetta 2 or QEMU)

## 3. Standard Launch Procedure

### Quick Start Multi-Container Topology

```bash
docker compose -f docker/compose.yaml up -d
```

Alternatively, launch using the operational scripts:

```bash
bash scripts/up.sh
```

## 4. Access Endpoints and Default Credentials

- **前台首页**: [http://127.0.0.1:18588/](http://127.0.0.1:18588/)
- **登录页面**: [http://127.0.0.1:18588/login](http://127.0.0.1:18588/login)
- **Initial Admin Username**: `admin`
- **Initial Admin Password**: `AdminPassword123!`
- **管理员邮箱**: `admin@example.com`

## 5. Operations & Testing Scripts

- **Start Environment**: `bash scripts/up.sh`
- **Health Check & Authentication**: `bash scripts/healthcheck.sh`
- **Admin Login Script**: `bash resources/login.sh`
- **Environment Reset**: `bash scripts/reset.sh`

## 6. Directory Structure & Files

```text
.
├── README.md                 # Deliverable documentation
├── manifest.yaml             # Environment metadata and architecture definition
├── source/
│   ├── source.yaml           # Upstream GitHub repo and pinned commit hash
│   └── SHA256SUMS            # Source metadata checksums
├── docker/
│   └── compose.yaml          # Core Docker Compose configuration
├── resources/
│   ├── users.yaml            # Default initial account definitions
│   ├── roles.yaml            # Role and permission mapping definitions
│   └── login.sh              # 登录与端点验证脚本
├── scripts/
│   ├── up.sh                 # Compose launch and healthcheck wait script
│   ├── healthcheck.sh        # End-to-end healthcheck script
│   └── reset.sh              # Container and volume reset script
└── image/
    └── image.json            # Deliverable image metadata manifest
```
