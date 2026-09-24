# Elgg 5.1.0 原生多容器 Docker Compose 环境

本交付物为 **Elgg 5.1.0** 的原生多容器 Docker Compose Application Environment。

> [!NOTE]
> 本环境为原生多容器 Compose 部署。应用服务（Elgg / Nginx + PHP-FPM）与数据库服务（MariaDB 10.5）分别运行在独立的容器中，并通过 Compose 专有网络通信。接收者无需手动执行 Web 安装向导或手动导入 SQL 脚本，启动即可直接使用。

## 1. Prerequisites

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **Target Platform**: `linux/amd64`
- **网络要求**: 宿主机需可用端口 `18560`

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

## 3. Access & Default Credentials

- **前台主页地址**: [http://localhost:18560](http://localhost:18560)
- **Initial Admin Username**: `admin`
- **Initial Admin Password**: `AdminPassword123!`
- **Initial Role**: `Administrator`

登录成功后，即可使用 Elgg 进行社交网络应用测试、用户管理与功能验证。

## 4. Service Architecture

This environment consists of 2 core decoupled services:

| Service Name | Description | Image / Base Image | Target Platform |
| :--- | :--- | :--- | :--- |
| **app** | Elgg 5.1.0 Web 界面与 PHP 业务运行时 | `yorem/elgg:5.1.0@sha256:30c4f12bd7a5bd7ceba3fb79696d179bf2561fe0d4cba1e06dd18a4473a78bdb` | `linux/amd64` |
| **db** | MariaDB 10.5 关系型数据库 | `mariadb:10.5@sha256:c219d932f5c0d67d224bceb609cc3dca6188a1903ac17b2d75cc764f0f50e984` | `linux/amd64` |

## 5. Verification & Helper Tools

### Automated Health Check

```bash
./scripts/healthcheck.sh
```

### Authentication Verification

```bash
./resources/login.sh admin AdminPassword123!
```

## 6. Environment Reset

Reset environment and clean up containers, networks, and data volumes for this Compose project:

```bash
./scripts/reset.sh
```

Or execute manually:

```bash
docker compose -f docker/compose.yaml down -v --remove-orphans
```

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
│       ├── database-seed.sql # Database initialization seed data
│       └── settings.php      # Elgg 核心配置文件
├── scripts/
│   ├── up.sh                 # Environment launch script
│   ├── healthcheck.sh        # Environment health check script
│   └── reset.sh              # Environment reset and cleanup script
└── source/
    ├── source.yaml           # Upstream source provenance and commit
    └── SHA256SUMS            # Source metadata checksums
```
