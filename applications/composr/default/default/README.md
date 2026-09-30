# Composr CMS 原生 Docker Compose 环境交付说明

本交付物包含 **Composr CMS** 的原生多容器 Docker Compose 部署配置及自动化运维与验证脚本。

---

## 1. 环境架构

本环境采用原生多容器 topology（非 All-in-One 单容器）：

- **application**: Composr Web 应用容器（基于 Apache 与 PHP 8.2），对外暴露端口 `18808`。
- **db**: 独立 MariaDB 数据库容器（`mariadb:10.5`），通过 Compose 内部网络与 Web 应用通信。

---

## 2. 前置条件

- Docker Engine 20.10+
- Docker Compose v2+
- 目标架构：`linux/amd64` (ARM64 主机可通过 Rosetta 2 或 qemu 运行)

---

## 3. 标准启动流程

### 从 Docker Hub 拉取并启动

```bash
# 1. 拉取固定版本镜像
docker compose -f docker/compose.yaml pull

# 2. 启动多容器环境
docker compose -f docker/compose.yaml up -d
```

也可以直接使用交付运维脚本启动：

```bash
bash scripts/up.sh
```

---

## 4. 访问入口与默认账号

- **前台首页**: [http://127.0.0.1:18808/](http://127.0.0.1:18808/)
- **前台登录页**: [http://127.0.0.1:18808/index.php?page=login&type=browse](http://127.0.0.1:18808/index.php?page=login&type=browse)
- **后台管理区**: [http://127.0.0.1:18808/adminzone/index.php](http://127.0.0.1:18808/adminzone/index.php)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `AdminPassword123!`
- **管理员邮箱**: `admin@example.com`

---

## 5. 运维与测试脚本

- **启动环境**: `bash scripts/up.sh`
- **健康检查与登录验证**: `bash scripts/healthcheck.sh`
- **管理员登录脚本**: `bash resources/login.sh`
- **环境重置与清理**: `bash scripts/reset.sh`

---

## 6. 数据持久化与重置

- **Web 应用数据卷**: `composr-data`（挂载于 `/var/www/html`）
- **数据库持久化卷**: `composr-db-data`（挂载于 `/var/lib/mysql`）
- **清理重置**: 执行 `bash scripts/reset.sh` 将清理容器并删除关联 volumes。
