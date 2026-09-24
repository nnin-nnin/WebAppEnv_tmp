# Joomla 6.1.2 Native Docker Compose Environment

本环境为 Joomla 6.1.2 版本的原生多容器 Docker Compose 部署配置。

## Prerequisites
- Docker Engine
- Docker Compose v2
- Target architecture: linux/amd64
- 确保端口 8080 未被占用

## Quick Start Guide
本环境使用 Docker Hub 获取镜像。请按照以下步骤启动：

1. 拉取镜像：
```bash
docker compose -f docker/compose.yaml pull
```

2. 启动服务：
```bash
docker compose -f docker/compose.yaml up -d
```

## Access & Credentials
- Web Entrypoint: `http://localhost:8080` (首次启动可能需要等待数据库初始化完成)
- Admin Dashboard: `http://localhost:8080/administrator/`
- Initial Admin Username: `admin`
- Initial Admin Password: `12345678password`

## Service Overview
本配置包含以下独立容器服务，它们通过 Compose 网络进行通信，不会合并到单个容器中：
- **joomla**: 运行 Joomla PHP-Apache 应用，连接到数据库服务。
- **db**: 运行 MySQL 8.0.35 数据库，保存应用数据。

## Verification与重置
可以使用以下命令进行验证：
```bash
bash scripts/healthcheck.sh
bash resources/login.sh
```

如需重置当前项目（停止容器、删除网络）：
```bash
bash scripts/reset.sh
```
注意：在执行 `reset.sh` 后，数据库数据仍保留在 Docker volume 中。如需完全清理，请手动删除 volume。

## Directory Structure
- `manifest.yaml`: 项目及镜像信息描述。
- `source/`: 源码及构建相关说明。
- `docker/`: 核心 Compose 配置。
- `resources/`: 测试用账号和验证脚本。
- `scripts/`: 生命周期操作脚本。

## Differences & Operational Notes
与官方简单 Compose 示例的差异：
- 补充了固定镜像 digest 确保完全复现。
- 使用 `joomla` 的环境变自动创建初始管理员，无需手动点击安装向导。
- 强制使用 `linux/amd64` 平台以避免跨平台部署时镜像拉取失败。
- 配置了详细的依赖健康检查（depends_on service_healthy），确保数据库就绪后才提供服务。
