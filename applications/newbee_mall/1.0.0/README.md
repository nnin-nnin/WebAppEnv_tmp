# newbee-mall 1.0.0

这是一个可复现的、多容器 Docker Compose Application Environment。

## 架构说明

本交付物是多容器 Compose 环境，不是 all-in-one 单容器环境。
应用、数据库运行在独立容器中：
- **application**: 运行新蜂商城的 Spring Boot 后端及 Thymeleaf 渲染页面。
- **db**: 运行 MySQL 8 数据库。

Compose 会创建项目网络，应用通过 Compose service name (`db`) 连接数据库服务。接收者不需要手动创建 Docker 网络，不需要手动安装数据库或导入 SQL。

## Prerequisites
- Docker Engine
- Docker Compose v2
- Target architecture: linux/amd64

## Quick Start Guide (Docker Hub 方式)

本应用镜像已上传到 `yorem/newbee-mall:1.0.0@sha256:ad016fb1454bb256b6508f6f1b74ff773014e75fbcc9e6a3c0a644abf0f21dff

```bash
# 1. Pull Pinned Version Image
docker compose -f docker/compose.yaml pull

# 2. Launch Services并等待健康检查通过
bash scripts/up.sh
```

## Access & Credentials

- **前台页面**: http://localhost:28089/
- **后台管理页面**: http://localhost:28089/admin
- **Initial Admin Username**: admin
- **Initial Admin Password**: 123456

（注：登录需手动输入图片验证码）

## 服务验证

您可以通过提供的脚本自动验证环境：

```bash
# 健康检查
bash scripts/healthcheck.sh

# 测试登录 API
bash scripts/login.sh

# 测试注册 API
bash scripts/register.sh
```

## 清理和重置

如果需要完全清除本应用的运行数据，请执行以下重置脚本。这只会删除当前 Compose 项目的容器、网络和命名卷：

```bash
bash scripts/reset.sh
```

## Directory Structure

- `manifest.yaml`: 环境清单和元数据。
- `source/`: 包含官方源码的 commit 记录。
- `docker/`: 最终的 Compose 配置和构建镜像所需的 Dockerfile。
- `resources/`: 包含用户信息、登录脚本及数据库初始 seed SQL。
- `scripts/`: 包含启动、重置、构建和加载镜像等运维脚本。
- `image/`: 包含离线加载使用的 docker 镜像 tar 包及校验文件。

## 官方 Compose 差异说明

官方仓库并未直接提供 `docker compose.yaml` 文件，仅提供了 SQL 脚本和 properties 配置。本交付物：
1. 编写了从源码使用 Maven 编译出 jar 并在 openjdk:8 运行的 Dockerfile。
2. 引入了标准的 mysql:8.0.35 数据库，并将 `newbee_mall_schema.sql` 映射进初始化目录，实现了数据库自动化导入。
3. 未对应用本身代码进行任何破坏性修改。
