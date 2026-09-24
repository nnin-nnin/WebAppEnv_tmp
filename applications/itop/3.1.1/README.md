# iTop 3.1.1 all-in-one Application Environment ()

本目录交付 iTop 3.1.1 的 `linux/amd64` 单镜像、单容器完整 Web Application Environment。最终镜像为 `yorem/itop:3.1.1`, encapsulating iTop 后端和真实浏览器 UI、PHP 8.1、Apache 以及 MariaDB。

## Quick Start

Execute from the repository root:

```bash
cd applications/itop/3.1.1
docker run -d -p 18515:80 yorem/itop:3.1.1
```

接收者只需要执行 `docker run`，Docker automatically pulls the image from Docker Hub. The image encapsulates the application, database, and initialization routines; no local build scripts, bootstrap steps, or web installers are required.

## Access & Credentials

浏览器打开 <http://localhost:18515/>，应看到 iTop 的真实登录页；登录后进入包含仪表盘、导航菜单和 CMDB/工单业务入口的应用页面。初始用户名为 `admin`，角色为 `Administrator`。初始密码为 `WcITop!26-bL9hS5C`。

iTop REST API 入口为 `http://localhost:18515/webservices/rest.php`，使用 `version=1.0`、`auth_user`、`auth_pwd` 和 `json_data` 参数。

## Verification

```bash
bash -n scripts/*.sh
ITOP_URL=http://127.0.0.1:18515 scripts/healthcheck.sh
ITOP_URL=http://127.0.0.1:18515 ITOP_USER=admin ITOP_PASSWORD='WcITop!26-bL9hS5C' resources/login.sh
ITOP_URL=http://127.0.0.1:18515 ITOP_USER=admin ITOP_PASSWORD='WcITop!26-bL9hS5C' resources/register.sh acceptance-user "$ITOP_NEW_USER_PASSWORD"
```

`ITOP_PASSWORD` 默认取上文记录的初始管理员密码，也可用环境变量覆盖。`login.sh` 使用 iTop 真实表单登录接口，`register.sh` 使用 iTop 真实 REST `core/create` 操作创建带有 `Service Desk Agent` 角色的 `UserLocal` 普通用户，而不是伪造通用注册 API。

## State Reset

以下命令会删除标准容器及其标准命名卷中的数据：

```bash
scripts/reset.sh
docker run -d -p 18515:80 yorem/itop:3.1.1
```

执行前请备份需要保留的业务数据。

## Directory Structure

- `manifest.yaml`：固定源码、运行时、镜像、入口和验收元数据。
- `source/`: Upstream provenance (`source.yaml`); raw source snapshot excluded.
- `docker/`：最终 Dockerfile、辅助 Dockerfile 和单服务 Compose 配置；Compose 不包含独立数据库服务。
- `resources/`：用户、角色、真实登录和普通用户创建脚本；管理员账号和密码记录在 `users.yaml`。
- `scripts/`：构建、镜像入口、启动辅助、宿主机健康检查、重置和构建期官方安装器调用。
- `image/`: Metadata (`image.json`); images pulled from Docker Hub.

该镜像是单镜像、单容器 all-in-one 环境，应用和数据库服务均在容器内运行，数据库地址固定为 `127.0.0.1`。iTop 官方源码内置完整服务端渲染前端和静态资源，不依赖独立前端仓库、CDN 或运行时下载。
