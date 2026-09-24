# Supermarket 5.3.7 原生多容器 Docker Compose 环境

这是一个保留官方多容器拓扑的 Supermarket 环境，包含应用本身、PostgreSQL 数据库和 Redis 缓存。

## 部署说明

本交付物是多容器 Compose 环境，不是 all-in-one 单容器环境。
应用、数据库和缓存服务分别运行在独立容器中，Compose 会自动创建项目网络。接收者不需要手动创建 Docker 网络、安装数据库或导入 SQL。

### Prerequisites
- Docker Engine
- Docker Compose v2
- 目标平台 linux/amd64

### Launch Instructions

本环境采用 Docker Hub（DOCKERHUB）方式分发，应用镜像为 `yorem/supermarket:5.3.7`。执行以下命令拉取固定镜像并启动服务；接收者无需源码构建或手动加载归档：

```bash
# 1. 拉取所有固定版本服务镜像
docker compose -f docker/compose.yaml pull

# 2. Launch Services
docker compose -f docker/compose.yaml up -d
```

### Access & Credentials

- Web Entrypoint: `http://127.0.0.1:18095`
- 初始管理员账号：无直接本地密码（使用 OAuth2 Mock 机制）
- 认证机制说明：Supermarket 官方强制要求使用 Chef Infra Server (oc-id) 进行 OAuth2 登录，不支持本地注册。为了在这个独立环境中进行验证，我们在 Dockerfile 中注入了 `MOCK_AUTH=true`。这意味着在浏览器中点击 `Sign In` 后，系统会自动使用 `OmniAuth.config.test_mode` 截获认证请求，并让你以预设的 `admin` 身份登录。

### Service Overview

1. **application**: Supermarket 核心 Web 应用程序（基于 Ruby on Rails，包含 Puma 服务器和所有前端资源）。
2. **db**: PostgreSQL 13.19，用于存储 Supermarket 的关系型数据。应用自动通过入口脚本执行 `db:setup`。
3. **redis**: Redis 6.2.5，用作后台任务和缓存。

### Verification

1. **健康检查**
   ```bash
   bash scripts/healthcheck.sh
   ```

2. **登录验证**
   ```bash
   bash resources/login.sh
   ```
   （模拟向 `/auth/chef_oauth2` 发起请求，测试 mock 登录是否成功。）

3. **注册验证**
   ```bash
   bash resources/register.sh
   ```
   （会提示 Supermarket 不支持本地注册，完全依赖 Chef Infra Server。）

### State Reset

重置操作只删除当前 Compose 项目的容器、网络和数据卷：
```bash
bash scripts/reset.sh
```
注意，这将同时清空保存在 `application-data` 和 `database-data` 中的业务数据。

## Directory Structure

- `manifest.yaml`: 部署元数据，包含版本、端口、服务说明和风险提示。
- `source/`: 包含 `source.yaml`，记录后端的固定 GitHub 仓库及 immutable commit 哈希。
- `docker/`: 包含应用的 Dockerfile 和 `compose.yaml` 拓扑。
- `scripts/`: 包含交付后的启动、重置、归档加载和健康检查脚本；`build.sh` 只供维护者重新生成归档，不是接收者启动前置步骤。
- `resources/`: 包含测试登录、注册等辅助信息，以及定义默认账号的 `users.yaml` 和 `roles.yaml`。
- `image/`: 存放本地构建好的 tar 格式 Docker 镜像归档和校验和；接收者不得在启动时重新源码构建。

## 官方 Compose 差异与原因

- **缺少应用镜像**: 官方 `docker compose.yml` 仅用于开发依赖（PostgreSQL、Redis），缺失了应用自身的容器。本方案通过 `docker/Dockerfile` 将应用从固定源码打包。
- **依赖外部 IDP**: 官方强依赖外部 Chef 服务器。为交付一个独立可测试环境，本方案通过环境变量激活 OmniAuth `test_mode` 实现本地 Mock 登录。
- **端口映射**: 仅对外映射了应用 HTTP 端口 `18095:80`，确保数据库端口不会直接暴露。
