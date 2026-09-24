# OpenCart 4.0.2-3 Application Environment ()

这是 OpenCart 4.0.2-3 的完整 Web Application Environment，targeting platform `linux/amd64`。最终交付物是一个 all-in-one 镜像：同一个容器内包含 OpenCart storefront、后台管理界面、PHP 8.2、Apache 和 MariaDB。

## Quick Start

在Application Environment仓库根目录执行：

```bash
cd applications/opencart/4.0.2-3
docker run -d -p 18523:80 yorem/opencart:4.0.2-3
```

接收者只需要执行 `docker run`，Docker 会自动从 Docker Hub 拉取镜像。镜像内部已经包含应用、运行时、数据库、初始化数据和启动逻辑；不需要执行 `build.sh`、Compose、bootstrap 脚本、数据库初始化脚本或 Web Installer。

## Access & Credentials

- storefront：<http://localhost:18523/>
- 后台管理：<http://localhost:18523/admin/>
- Initial Username: `admin`
- Initial Role: OpenCart `Administrator`
- Initial Password: `WcOpen!26-hV4qM7D`

打开后台地址后应看到真实的 OpenCart 登录页；登录后应进入 Dashboard，并能看到左侧导航、商品、订单、客户和系统设置等业务菜单。

## Verification

宿主机 HTTP 健康检查使用公开入口，不依赖容器内部路径或 Unix socket：

```bash
scripts/healthcheck.sh
```

管理员真实登录验证使用 OpenCart 后台登录表单：

```bash
OPENCART_PASSWORD='WcOpen!26-hV4qM7D' resources/login.sh
```

普通客户注册验证使用 OpenCart storefront 的 `account/register.register` 接口：

```bash
OPENCART_REGISTER_PASSWORD='Verify-User-2026!' resources/register.sh "test-$(date +%s)@example.com"
```

注册脚本缺少邮箱或密码时会返回非零退出码。

容器内 Docker `HEALTHCHECK` 同时检查公开 HTTP 页面和同容器内的 MariaDB socket。应用和数据库始终是同一个容器中的两个核心进程。

## State Reset

以下命令只移除由该 OpenCart 镜像创建的容器，不影响其他镜像或容器：

```bash
scripts/reset.sh
docker run -d -p 18523:80 yorem/opencart:4.0.2-3
```

若使用 Compose 的 `application-db` 卷，需按接收者的卷管理策略另外移除该卷后再启动，才能清空持久化数据库。

## Directory Structure

- `manifest.yaml`: Metadata manifest detailing application, runtime, ports, and operational scripts.
- `source/`: Upstream provenance (`source.yaml`); raw source snapshot excluded.
- `docker/`：最终 Dockerfile、兼容用 standalone Dockerfile 和单服务 Compose 配置；Compose 不定义独立数据库服务。
- `resources/`：用户、角色、登录、注册辅助脚本及官方数据库初始 seed；`users.yaml` 中记录了初始管理员账号和密码。
- `scripts/`：镜像构建、构建期初始化、容器入口、启动、宿主机健康检查和重置脚本。
- `image/`: Metadata (`image.json`); images pulled from Docker Hub.

运行时核心前端资源均由镜像内的 OpenCart 文件提供，不依赖 CDN、远程 API 或启动时联网下载依赖。OpenCart 的可选 Marketplace、Fixer 等功能仍可能由用户主动配置后访问外部服务，但不影响默认页面、登录和后台使用。
