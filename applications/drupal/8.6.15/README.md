# Drupal 8.6.15 原生 Docker Compose 环境

本目录交付固定版本 Drupal 8.6.15 的原生多容器 Docker Compose 环境。Drupal 应用、一次性安装器和 PostgreSQL 运行在独立容器中，不是 all-in-one 单容器。

源码来源为 [Drupal 官方 GitHub 仓库](https://github.com/drupal/drupal.git)，固定 commit 为 `91ded4b7776e05ee9633bdc1c458b41c718133e0`，详见 `source/source.yaml`。当前轻量交付目录不包含源码快照；标准使用方式是直接拉取已发布镜像。若要重建，需在仓库外按该链接和 commit 准备源码，再使用现有 Dockerfile。

## 前置条件

- Docker Engine 和 Docker Compose v2。
- 目标平台为 `linux/amd64`；ARM64 主机需要 Docker 的跨架构运行能力。
- 首次启动时会从 Docker Hub 拉取应用和数据库镜像。
- 宿主机端口 `18090` 未被占用；如有冲突，可修改 `docker/.env` 中的 `DRUPAL_HOST_PORT`。

Drupal 8.6.15、PHP 7.2 和 PostgreSQL 10 均已停止维护。本环境只用于固定版本研究和复现实验，不应直接暴露到互联网。

## 构建镜像

如果需要重新构建镜像，请先按 `source/source.yaml` 在仓库外准备固定 commit 的源码，再在应用目录执行：

```bash
bash scripts/build.sh
```

构建脚本会：

1. 使用固定的官方 Drupal 镜像作为基础镜像。
2. 将准备好的 Drupal 源码写入构建上下文中的 `source/drupal-8.6.15/`，再构建并标记为 `yorem/drupal:8.6.15`。
3. 拉取固定版本的 PostgreSQL 10.23 镜像。
4. 在本机生成可选的镜像 tar 和 `image/image.json`；构建不会自动推送镜像。

如果需要把重新构建的应用镜像发布到 Docker Hub，在完成 Docker Hub 登录后执行：

```bash
bash scripts/publish.sh
```

## 启动

收到应用目录后，执行：

```bash
cd path/to/drupal_8.6.15
bash scripts/up.sh
```

`scripts/up.sh` 会检查本地镜像；缺少时自动从 Docker Hub 拉取 `yorem/drupal:8.6.15` 和 `postgres:10.23-bullseye`，然后启动 Compose。也可以先执行 `bash scripts/load-images.sh`，该脚本在存在本地归档时加载归档，否则执行 Docker Hub 拉取。

也可以手动执行 Compose：

```bash
docker compose --env-file docker/.env -f docker/compose.yaml up -d
```

接收者不需要手工创建网络、安装 PostgreSQL、导入 SQL 或打开 Drupal 浏览器安装向导。`installer` 服务会在首次启动时调用 Drupal 自身的安装 API，创建数据库结构和管理员账号；后续启动会识别已安装站点并跳过初始化。

## 访问和账号

- 首页：<http://127.0.0.1:18090/>
- 登录页：<http://127.0.0.1:18090/user/login>
- 初始管理员用户名：`admin`
- 初始管理员密码：`Drupal8615Admin!`
- 初始角色：`administrator`
- 初始管理员邮箱：`admin@example.test`

默认凭据只用于可复现研究环境，保存在 `docker/.env` 和 `resources/users.yaml`。普通测试用户不会预置，使用 `resources/register.sh` 创建。部署到其他环境前应替换这些凭据。

## 服务

| 服务 | 作用 | 镜像 | 对外端口 |
| --- | --- | --- | --- |
| `application` | Drupal 8.6.15、Apache 和 PHP 运行时 | `yorem/drupal:8.6.15` | `${DRUPAL_HOST_PORT}:80`，默认 `18090:80` |
| `installer` | 首次安装数据库和创建管理员，完成后退出 | `yorem/drupal:8.6.15` | 无 |
| `db` | PostgreSQL 数据库 | `postgres:10.23-bullseye` | 无 |

应用通过 Compose service name `db` 连接数据库。数据库、站点设置、上传文件、模块、主题和 profile 使用项目命名卷保存。

## 验证

验证来源元数据和 Docker Hub 镜像：

```bash
test -s source/source.yaml
docker pull --platform linux/amd64 yorem/drupal:8.6.15
docker pull --platform linux/amd64 postgres:10.23-bullseye
docker image inspect yorem/drupal:8.6.15 postgres:10.23-bullseye
```

验证 Compose 和运行服务：

```bash
bash -n scripts/*.sh resources/*.sh
docker compose --env-file docker/.env -f docker/compose.yaml config --quiet
bash scripts/healthcheck.sh
bash resources/login.sh
```

创建普通测试用户并验证真实登录流程：

```bash
bash resources/register.sh acceptance-user 'Acceptance8615!' acceptance-user@example.test
```

`resources/register.sh` 在运行中的 `application` 容器内调用 Drupal 用户实体 API，不伪造通用注册接口。`resources/login.sh` 通过 Drupal 真实登录表单验证账号。

## 停止和重置

停止服务但保留数据：

```bash
docker compose --env-file docker/.env -f docker/compose.yaml down
```

删除当前 Compose 项目的容器、网络和命名卷：

```bash
bash scripts/reset.sh
```

重置会删除站点、数据库和账号数据，但不会删除镜像。重置后重新执行 `bash scripts/up.sh` 即可重新安装初始站点。

## 文件说明

- `manifest.yaml`：应用版本、固定源码、构建基础、Compose 服务、Docker Hub 镜像、资源和脚本索引。
- `source/`：仅保存 GitHub 仓库链接和固定 commit 哈希的 `source/source.yaml`；源码快照不随本目录交付。
- `docker/Dockerfile`：从固定官方基础镜像和固定源码构建应用镜像。
- `docker/compose.yaml`：唯一标准 Compose 入口，定义 application、installer 和 db 服务。
- `docker/.env`：研究环境的数据库和初始账号参数。
- `resources/`：用户、角色、登录、普通用户创建和首次安装脚本。
- `scripts/build.sh`：构建应用镜像、拉取数据库镜像并生成可选的本地 tar 与元数据。
- `scripts/publish.sh`：将本地应用镜像推送到 `yorem/drupal:8.6.15`。
- `scripts/load-images.sh`：有本地归档时加载归档，否则从 Docker Hub 拉取镜像。
- `scripts/up.sh`：检查或拉取 Docker Hub 镜像、启动 Compose 并等待健康检查。
- `scripts/healthcheck.sh`：检查服务、数据库、Drupal 版本、首页和登录页。
- `scripts/reset.sh`：只重置当前 Drupal Compose 项目。
- `image/`：Docker Hub 镜像元数据；本地执行 `scripts/build.sh` 后也可生成未纳入 GitHub 交付的 tar 归档。

## Docker Hub 镜像

应用镜像已经发布到 [Docker Hub](https://hub.docker.com/r/yorem/drupal:8.6.15/tags)：

```text
yorem/drupal:8.6.15
```

数据库使用 Docker Hub 官方镜像：

```text
postgres:10.23-bullseye
```

镜像平台为 `linux/amd64`，详细摘要和来源见 `image/image.json`。

## 已知限制

- Drupal 8.6.15、PHP 7.2 和 PostgreSQL 10 已停止维护，仅适用于隔离的研究环境。
- 默认 HTTP 入口没有 TLS，账号和密码是公开的 benchmark 凭据。
- 镜像归档目标为 `linux/amd64`，ARM64 主机依赖 Docker 跨架构运行。
