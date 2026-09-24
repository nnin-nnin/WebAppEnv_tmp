# Leantime 3.1.4 Application Environment ()

这是 Leantime 3.1.4 的完整 Web Application Environment，targeting platform `linux/amd64`，最终交付为单镜像、单容器 all-in-one 环境。镜像内包含 Leantime PHP 应用、同仓库构建的前端静态资源、Apache、PHP 8.2 和 MariaDB 11.8；数据库与 Web 应用在同一个容器内通过 `127.0.0.1` 通信。

## Quick Start

Execute from the repository root:

```bash
cd applications/leantime/3.1.4
docker run -d -p 18516:80 yorem/leantime:3.1.4
```

接收者只需要执行 `docker run`，Docker 会自动从 Docker Hub 拉取镜像。镜像内部已经包含应用、前端、依赖、数据库、初始化和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap 脚本、安装脚本、数据库初始化脚本或 Web Installer。

## Access & Credentials

- Web Entrypoint: `http://127.0.0.1:18516/`，首次打开显示真实 Leantime 登录页；登录后进入 Dashboard / My Work，并可使用项目、待办和用户管理菜单。
- 登录入口：`http://127.0.0.1:18516/auth/login`。
- Initial Admin Username: `admin`。
- Initial Role: `owner`（Leantime 最高级角色）。
- Initial Admin Password: `WcLean!26-rT5kM9V`

## Verification

宿主机 HTTP 健康检查使用公开入口，不依赖容器内路径或数据库 socket：

```bash
LEANTIME_URL=http://127.0.0.1:18516 ./scripts/healthcheck.sh
```

使用受控密码验证真实登录接口：

```bash
LEANTIME_URL=http://127.0.0.1:18516 \
LEANTIME_USERNAME=admin LEANTIME_PASSWORD='WcLean!26-rT5kM9V' \
./resources/login.sh
```

Leantime 3.1.4 没有公开注册 API。`resources/register.sh` 调用官方 `bin/leantime user:add` 创建真实普通用户：

```bash
LEANTIME_CONTAINER=<运行中的容器名> \
./resources/register.sh user@example.com 'Verify-User-2026!' editor
```

密码只作为调用时的参数传入，不写入脚本或交付文档。容器内部的 Docker `HEALTHCHECK` 同时检查 MariaDB socket 和真实登录页面。

## State Reset

以下命令会删除指定 Leantime 容器及其匿名数据卷，然后可以重新执行上面的 `docker run` 命令：

```bash
./scripts/reset.sh <容器名>
```

使用 Compose 创建的命名卷不会被该脚本删除；如需清空 Compose 数据，请只针对本应用的 `application-db` 和 `application-userfiles` 卷执行删除，再重新启动同一个最终镜像。

## Directory Structure

- `manifest.yaml`：应用类型、源码、运行时、组件、镜像和脚本元数据。
- `source/`: Upstream provenance (`source.yaml`); raw source snapshot excluded.
- `docker/`：最终镜像 Dockerfile、标准 standalone 接口文件和单服务 Compose 辅助配置。
- `resources/`：账号与角色元数据、真实登录脚本、官方 CLI 用户创建脚本和初始数据目录。
- `scripts/`：镜像构建、容器入口、宿主机健康检查、启动和重置脚本；数据库探针由 Docker `HEALTHCHECK` 提供。
- `image/`: Metadata (`image.json`); images pulled from Docker Hub.
