# ownCloud 10.14.0 Application Environment ()

这是 ownCloud 10.14.0 的完整 Web 应用 all-in-one 环境，targeting platform `linux/amd64`。最终交付是单个镜像、单个容器, encapsulating ownCloud、PHP 7.4、Apache 2.4、MariaDB 以及初始化数据。

## Quick Start

Execute from the repository root:

```bash
cd applications/owncloud/10.14.0
docker run -d --name owncloud-10-14-0 -p 18524:80 yorem/owncloud:10.14.0
```

接收者只需要执行 `docker run`，Docker 会自动从 Docker Hub 拉取镜像。镜像内部已经包含应用、数据库、初始化和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap 脚本、数据库初始化脚本或 Web Installer。

## Access & Credentials

- Web Entrypoint: <http://127.0.0.1:18524/>。登录后预期进入 ownCloud Files 文件页面，可看到文件导航、应用菜单和用户菜单。
- API 入口：`http://127.0.0.1:18524/ocs/v1.php/cloud/`；公开状态：`http://127.0.0.1:18524/status.php`。
- Initial Username: `admin`。
- Initial Role: administrator，具备 ownCloud 全局管理、用户管理和文件管理权限。
- Initial Password: `WcOwn!26-iS9nF2L`

## Verification

宿主机 HTTP 健康检查使用公开入口，不依赖容器路径或容器内 socket：

```bash
OWNCLOUD_URL=http://127.0.0.1:18524 scripts/healthcheck.sh
```

使用真实 ownCloud OCS 登录接口验证管理员：

```bash
OWNCLOUD_URL=http://127.0.0.1:18524 OWNCLOUD_USERNAME=admin OWNCLOUD_PASSWORD='WcOwn!26-iS9nF2L' resources/login.sh
```

使用真实 provisioning API 创建普通用户；`NEW_PASSWORD` 仅在执行时通过受控渠道提供：

```bash
OWNCLOUD_URL=http://127.0.0.1:18524 OWNCLOUD_USERNAME=admin OWNCLOUD_PASSWORD='WcOwn!26-iS9nF2L' NEW_USER=验收用户 NEW_PASSWORD='Verify-User-2026!' resources/register.sh
```

构建脚本要求构建环境通过受控 `CODEX_ADMIN_PASSWORD` 提供初始化密码；该值不写入脚本、镜像环境变量或构建产物文本。容器内的数据库和 Apache 由同一个 `scripts/entrypoint.sh` 管理，Docker `HEALTHCHECK` 同时检查 MariaDB socket 和 ownCloud `status.php`。

## State Reset

```bash
OWNCLOUD_CONTAINER_NAME=owncloud-10-14-0 scripts/reset.sh
```

该命令移除容器。使用 Compose 或显式挂载命名卷时，卷中的数据仍会保留；按本 README 的直接 `docker run` 未挂载卷时，数据随容器移除。重新执行“启动”章节的命令可生成新的初始化环境；需要跨容器保留数据时使用 `docker/compose.yaml` 中的 `owncloud-data` 和 `owncloud-db` 卷。

## Directory Structure

- `manifest.yaml`：应用版本、固定源码、运行时、all-in-one 组件、镜像和脚本清单。
- `source/`: Upstream provenance (`source.yaml`); raw source snapshot excluded.
- `docker/`：最终 Dockerfile、单服务 Compose 辅助配置和 standalone Dockerfile；Compose 不启动独立数据库服务。
- `resources/`：用户、角色、真实登录/用户创建脚本和应用初始数据目录。
- `scripts/`：镜像构建、单容器启动、内部入口、宿主机健康检查和重置脚本。
- `image/`: Metadata (`image.json`); images pulled from Docker Hub.

## 固定源码与构建

源码仓库为 <https://github.com/owncloud/core.git>，固定 commit 为 `f8c196c1d17abca4e8c2ce17e936cb9fe4ebd316`。ownCloud core 自带实际浏览器前端，不需要独立前端仓库或运行时前端下载。构建时使用固定 digest 的 `owncloud/server:10.14.0` 作为 PHP/Apache/Composer 依赖基底，并安装 MariaDB 到同一最终镜像；基底 digest 已记录在 `docker/Dockerfile` 和构建元数据中。
