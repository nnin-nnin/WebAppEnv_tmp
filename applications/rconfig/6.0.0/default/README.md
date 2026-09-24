# rConfig 6.0.0 原生多容器 Docker Compose 环境

本交付物为 **rConfig 6.0.0** 的原生多容器 Docker Compose Application Environment。

> [!NOTE]
> 本环境为原生多容器 Compose 部署，不是 all-in-one 单容器环境。应用服务（rConfig / PHP 8.4 Apache）与数据库服务（MariaDB 10.5）分别运行在独立的容器中，并通过 Compose 专有网络通信。接收者无需手动执行 Web 安装向导或手动导入 SQL 脚本，启动即可直接使用。

---

## 1. Prerequisites

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **Target Platform**: `linux/amd64`
- **网络要求**: 宿主机需可用端口 `18551`

---

## 2. Quick Start (Docker Hub Delivery)

Launch using the pinned image from Docker Hub:

```bash
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d
```

Or use the provided launch script:

```bash
./scripts/up.sh
```

---

## 3. Access & Default Credentials

- **前台登录地址**: [http://localhost:18551/login](http://localhost:18551/login)
- **控制台地址**: [http://localhost:18551/dashboard](http://localhost:18551/dashboard)
- **Initial Admin Username**: `admin`
- **Initial Admin Password**: `AdminPassword123!`
- **Initial Role**: `Admin`

登录成功后，页面将跳转至 rConfig 控制台首页（Dashboard）。

---

## 4. Service Architecture

This environment consists of 2 core decoupled services:

| Service Name | Description | Image / Base Image | Target Platform |
| :--- | :--- | :--- | :--- |
| **app** | rConfig 6.0.0 Web 界面与 PHP 业务逻辑 | `yorem/rconfig:6.0.0@sha256:99f7f31fd09a3bd247075661da77389e30df4d789b1f5b6ad100f4c0b9153148` | `linux/amd64` |
| **db** | MariaDB 10.5 关系型数据库 | `mariadb:10.5@sha256:c219d932f5c0d67d224bceb609cc3dca6188a1903ac17b2d75cc764f0f50e984` | `linux/amd64` |

---

## 5. Verification & Helper Tools

### Automated Health Check

```bash
./scripts/healthcheck.sh
```

### Authentication Verification

```bash
./resources/login.sh admin AdminPassword123!
```

---

## 6. Environment Reset

Reset environment and clean up containers, networks, and data volumes for this Compose project:

```bash
./scripts/reset.sh
```

Or execute manually:

```bash
docker compose -f docker/compose.yaml down -v --remove-orphans
```

---

## 7. Directory Structure

```text
default/
├── README.md                 # Deliverable usage documentation
├── manifest.yaml             # Deliverable metadata manifest
├── docker/
│   └── compose.yaml          # Docker Compose orchestration file
├── image/
│   └── image.json            # Image and release metadata
├── resources/
│   ├── users.yaml            # Initial user information
│   ├── roles.yaml            # Role and permission mappings
│   ├── login.sh              # Automated login verification script
│   └── initial-data/
│       ├── .env              # 应用运行环境变量
│       ├── database-seed.sql # Database initialization seed data
│       └── supervisord.conf  # Supervisor 进程管理配置
├── scripts/
│   ├── up.sh                 # Environment launch script
│   ├── healthcheck.sh        # Environment health check script
│   └── reset.sh              # Environment reset and cleanup script
└── source/
    ├── source.yaml           # Upstream source provenance and commit
    └── SHA256SUMS            # Source metadata checksums
```
