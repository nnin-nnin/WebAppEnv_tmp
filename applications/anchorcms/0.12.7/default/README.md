# AnchorCMS 0.12.7 Native Docker Compose Environment交付说明

本交付物包含 **AnchorCMS 0.12.7** 的原生多容器 Docker Compose 部署配置及自动化运维与验证脚本。

## 1. Environment Architecture

This environment uses a native multi-container topology (decoupled, non-all-in-one):

- **application**: AnchorCMS Web 应用容器（基于 Apache 与 PHP 7.4），对外暴露端口 `18009`。
- **db**: 独立 MariaDB 数据库容器（`mariadb:10.5`），通过 Compose 内部网络与 Web 应用通信。

## 2. Prerequisites

- Docker Engine 20.10+
- Docker Compose v2+
- Target architecture: `linux/amd64` (ARM64 hosts supported via Rosetta 2 or QEMU)

## 3. Standard Launch Procedure

### 从 Docker Hub 拉取并启动

```bash
# 1. Pull Pinned Version Image
docker compose -f docker/compose.yaml pull

# 2. 启动多容器环境
docker compose -f docker/compose.yaml up -d
```

Alternatively, launch using the operational scripts:

```bash
bash scripts/up.sh
```

## 4. Access Endpoints and Default Credentials

- **前台首页**: [http://127.0.0.1:18009/](http://127.0.0.1:18009/)
- **后台登录页**: [http://127.0.0.1:18009/index.php/admin/login](http://127.0.0.1:18009/index.php/admin/login)
- **Initial Admin Username**: `admin`
- **Initial Admin Password**: `benchmark-only`
- **管理员邮箱**: `admin@example.com`

## 5. Operations & Testing Scripts

- **Start Environment**: `bash scripts/up.sh`
- **Health Check & Authentication**: `bash scripts/healthcheck.sh`
- **Admin Login Script**: `bash resources/login.sh`
- **创建新用户脚本**: `bash resources/register.sh <username> <email> <password>`
- **Environment Reset**: `bash scripts/reset.sh`

## 6. Directory Structure & Files

```text
.
├── README.md                 # Deliverable documentation
├── manifest.yaml             # Environment metadata and architecture definition
├── source/
│   └── source.yaml           # Upstream GitHub repo and pinned commit hash
├── docker/
│   ├── compose.yaml          # Core Docker Compose configuration
│   ├── Dockerfile             # Web 应用镜像构建文件
│   └── entrypoint.sh         # 容器初始化与自动配置入口脚本
├── resources/
│   ├── users.yaml            # Default initial account definitions
│   ├── roles.yaml            # Role and permission mapping definitions
│   ├── login.sh              # CURL 模拟管理员登录测试脚本
│   └── register.sh           # 通过管理员 API 创建普通用户脚本
├── scripts/
│   ├── build.sh              # 本地镜像构建脚本
│   ├── up.sh                 # Compose launch and healthcheck wait script
│   ├── healthcheck.sh        # End-to-end healthcheck script
│   └── reset.sh              # Container and volume reset script
└── image/
    └── image.json            # Deliverable image metadata manifest
```

## 7. 差异与变动说明

与 AnchorCMS 仓库中默认开发用 `docker-compose.yml` 相比：

1. **多容器健康联动**: 使用 `depends_on: db: condition: service_healthy`，应用等待 MariaDB 完全准备就绪后再初始化。
2. **自动化无人值守初始化**: 编写 `docker/entrypoint.sh` 入口脚本，自动读取官方 `install/storage/anchor.sql` 结构，注入配置文件 `anchor/config/db.php` 与 `install.lock`，免除浏览器手动安装步骤。
3. **密码哈希与权限配置**: 自动化写入符合官方标准 `bcrypt` 哈希的初始管理员账号 `admin / benchmark-only`。
