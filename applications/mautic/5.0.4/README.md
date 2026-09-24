# Mautic 5.0.4 Application Environment ()

This is a reproducible environment built from pinned source commit `4676457f5ac7c9d13308b119a28bbe527cb542ce` targeting platform `linux/amd64`。最终交付是单镜像、单容器 all-in-one 环境, encapsulating Mautic、PHP 8.1、Apache 和 MariaDB 11.8。

## Quick Start

Execute from the repository root:

```bash
cd applications/mautic/5.0.4
docker compose -f docker/compose.yaml up -d
```

接收者只需要执行 `docker run`，Docker 会自动从 Docker Hub 拉取镜像。镜像内部已经包含应用、数据库、初始化数据和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap 脚本、Web Installer、数据库初始化脚本或单独启动数据库容器。

## Access & Credentials

- Web Entrypoint: <http://localhost:18518/s/login>；根路径会进入 Mautic 登录流程。
- 登录后预期进入真实的 Mautic Dashboard，可看到侧边导航、联系人、营销、渠道和设置等应用菜单。
- Initial Username: `admin`。
- Initial Role: `Administrator`。
- Initial Password: `WcMautic!26-dF8qN4X`
- API 基址：<http://localhost:18518/api>，API 认证使用 Mautic 支持的 HTTP Basic Auth。

## Verification

宿主机 HTTP 健康检查使用 `MAUTIC_URL`，默认值为 `http://localhost:18518`：

```bash
MAUTIC_URL=http://localhost:18518 scripts/healthcheck.sh
```

管理员 API 登录验证：

```bash
MAUTIC_URL=http://localhost:18518 MAUTIC_USERNAME=admin MAUTIC_PASSWORD='WcMautic!26-dF8qN4X' resources/login.sh
```

创建普通用户使用 Mautic 真实 API：

```bash
MAUTIC_URL=http://localhost:18518 MAUTIC_USERNAME=admin MAUTIC_PASSWORD='WcMautic!26-dF8qN4X' MAUTIC_REGISTER_PASSWORD='Verify-User-2026!' resources/register.sh ordinary ordinary@example.invalid Ordinary User
```

`resources/login.sh` 登录失败返回非零退出码，`resources/register.sh` 参数不足或 API 失败返回非零退出码。容器内数据库和 Web 服务探针由 Docker `HEALTHCHECK` 定义。

源码不随本目录交付，`source/source.yaml` 只记录上游仓库和固定 commit；需要核对源码时请按该 commit 自行 checkout 上游仓库。镜像本体从 Docker Hub 获取，仓库中不保存 tar 和校验和。

## State Reset

默认容器没有外部数据库；重置会移除指定容器及其容器内可写数据。执行前必须显式确认：

```bash
scripts/reset.sh
```

重置后的管理员账号仍为 `admin`，密码与上文一致。

## Directory Structure

- `manifest.yaml`: Metadata manifest detailing application, runtime, ports, and operational scripts.
- `source/`: Upstream provenance (`source.yaml`); raw source snapshot excluded.
- `docker/`：最终 Dockerfile、辅助 standalone Dockerfile 和单服务 Compose 配置。
- `resources/`：用户、角色、登录、注册说明及脚本；`users.yaml` 中记录了初始管理员账号和密码。
- `scripts/`：构建、启动、容器入口、宿主机健康检查和重置脚本。
- `image/`: Metadata (`image.json`); images pulled from Docker Hub.

## 构建说明

构建者需从受控渠道设置 `MAUTIC_ADMIN_PASSWORD`，然后执行：

```bash
MAUTIC_ADMIN_PASSWORD="$MAUTIC_INITIAL_PASSWORD" scripts/build.sh
```

该受控值只在镜像构建阶段用于生成管理员密码哈希，镜像运行时不需要联网下载依赖，也不把明文密码写入交付物。
