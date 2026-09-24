# MintHCM 4.0.4 Application Environment ()

本目录交付 MintHCM 4.0.4 的完整 Web Application Environment，targeting platform `linux/amd64`。归档镜像是单镜像、单容器 all-in-one 环境, encapsulating MintHCM Vue 前端、PHP/Apache、MariaDB、Elasticsearch、运行依赖、数据库初始化和启动逻辑。

## Quick Start

Execute from the repository root:

```bash
cd applications/minthcm/4.0.4
docker run -d -p 18520:80 yorem/minthcm:4.0.4
```

接收者只需要执行 `docker run`，Docker automatically pulls the image from Docker Hub. The image encapsulates the application, database, and initialization routines; no local build scripts, bootstrap steps, or web installers are required.

## Access & Credentials

- Web Entrypoint: <http://localhost:18520/>；登录后预期进入 MintHCM 真实业务首页，可见应用导航、模块菜单和仪表盘内容。
- 认证接口：`POST http://localhost:18520/api/login`，请求体为 JSON `username`、`password` 和可选的 `login_language`。
- Initial Username: `admin`。
- Initial Role: System Administrator。
- Initial Password: `MintHCM-Admin-2026!R7w2`。该密码由容器启动时的 `MINTHCM_ADMIN_PASSWORD` 注入；镜像不烘焙密码，未提供该环境变量时容器会拒绝初始化。

## Verification

宿主机 HTTP 健康检查使用 README 入口，可按需覆盖地址：

```bash
MINTHCM_URL=http://127.0.0.1:18520 scripts/healthcheck.sh
MINTHCM_PASSWORD='MintHCM-Admin-2026!R7w2' MINTHCM_URL=http://127.0.0.1:18520 resources/login.sh
```

普通用户创建使用 MintHCM 已验证的 Users Save 流程，并会再次验证新用户登录：

```bash
MINTHCM_ADMIN_PASSWORD='MintHCM-Admin-2026!R7w2' \
  MINTHCM_URL=http://127.0.0.1:18520 \
  resources/register.sh USERNAME NEW_PASSWORD user@example.com 'User'
```

容器内部的 `HEALTHCHECK` 同时检查 MariaDB、Elasticsearch 和公开 HTTP 页面；宿主机脚本不依赖容器路径或容器内 socket。

## State Reset

重置脚本默认只处理本应用的容器名：

```bash
MINTHCM_CONTAINER=minthcm-4-0-4 scripts/reset.sh
docker run --name minthcm-4-0-4 -d -p 18520:80 yorem/minthcm:4.0.4
```

脚本只删除指定容器，不删除未明确指定的 Docker volume。使用 Compose 时，数据库、上传文件和 Elasticsearch 数据分别持久化到本应用的命名卷，重启后会自动恢复。

## Directory Structure

- `manifest.yaml`：应用、源码、运行时、组件、镜像和脚本元数据。
- `source/`: Upstream provenance (`source.yaml`); raw source snapshot excluded.
- `docker/`：Dockerfile、可选的 standalone Dockerfile 和单服务 Compose 配置。
- `resources/`：用户、角色、登录/注册脚本和初始数据说明；`users.yaml` 中记录了初始管理员账号和密码。
- `scripts/`：构建、入口、宿主机健康检查、容器健康检查和重置脚本。
- `image/`: Metadata (`image.json`); images pulled from Docker Hub.
