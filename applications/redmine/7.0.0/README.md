# Redmine 7.0.0 Application Environment ()

This is a reproducible environment built from pinned source commit `e192cf1fd10e58bac716cf94b91b0a5ac8df72a1` 构建的完整 Redmine Web Application Environment，targeting platform `linux/amd64`。最终交付物是单镜像、单容器 all-in-one 镜像 `yorem/redmine:7.0.0`，容器内部包含 Redmine、Ruby/Rails、Puma、Nginx 和 MariaDB。

## Quick Start

Execute from the repository root:

```bash
cd applications/redmine/7.0.0
sha256sum -c image/SHA256SUMS
docker load -i image/redmine-7.0.0-linux-amd64.tar
docker run -d -p 18512:80 yorem/redmine:7.0.0
```

接收者只需要校验并加载归档，然后执行 `docker run`。镜像内部已经包含应用、数据库、初始化和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap 脚本、数据库初始化脚本或 Web Installer。若需要跨容器删除持久化数据，可使用下文的 `scripts/reset.sh`；单纯 `docker restart` 不会丢失数据。

## Access & Credentials

- Web Entrypoint: <http://127.0.0.1:18512/>
- 登录页：<http://127.0.0.1:18512/login>
- Initial Username: `admin`
- Initial Role: Administrator（系统管理员）
- Initial Password: `WcRed!26-nK9vT5J`

登录后应能访问 Redmine 的 “My page”，并能看到 Projects、Administration 等真实应用导航；根路径是应用主页，不是状态页或 API 文档。

## Verification

宿主机 HTTP 健康检查：

```bash
REDMINE_URL=http://127.0.0.1:18512/ scripts/healthcheck.sh
```

登录脚本使用 Redmine 真实登录表单和 CSRF token：

```bash
REDMINE_URL=http://127.0.0.1:18512 \
REDMINE_USERNAME=admin \
REDMINE_PASSWORD='WcRed!26-nK9vT5J' \
resources/login.sh
```

Redmine 没有默认开启的公开注册接口；`resources/register.sh` 使用管理员登录后的真实 `/users/new` 用户创建表单创建普通用户：

```bash
REDMINE_URL=http://127.0.0.1:18512 \
REDMINE_USERNAME=admin \
REDMINE_PASSWORD='WcRed!26-nK9vT5J' \
resources/register.sh demo demo@example.invalid 'Verify-User-2026!' Demo
```

上面的示例密码仅为说明文字，实际执行时应替换为受控值；不要把受控密码写入脚本或命令历史。创建成功后，可用 `REDMINE_USERNAME=demo` 和相应受控密码再次运行 `resources/login.sh`。

容器内的数据库和 HTTP 入口探针由 Docker `HEALTHCHECK` 定义；`scripts/healthcheck.sh` 只通过公开 HTTP 入口运行，不依赖容器路径或 Unix socket。

## State Reset

以下命令会删除脚本明确列出的容器和命名数据卷，属于有意的数据重置操作：

```bash
container_name=$(docker ps --filter ancestor=yorem/redmine:7.0.0 --format '{{.Names}}' | head -n 1)
REDMINE_CONTAINER="${container_name:-redmine-7.0.0}" scripts/reset.sh
docker run -d -p 18512:80 yorem/redmine:7.0.0
```

重置脚本会删除目标容器的匿名数据卷，以及脚本明确列出的命名数据卷；重置后数据库从镜像内置的已迁移数据恢复，初始管理员账号仍由受控渠道提供的凭据使用。

## Directory Structure

- `manifest.yaml`：应用版本、固定 commit、运行时、镜像、端口和脚本元数据。
- `source/`：保存由固定 `7.0.0` tag、commit `e192cf1fd10e58bac716cf94b91b0a5ac8df72a1` 导出的源码树、来源元数据和 SHA-256 校验文件。
- `docker/`：构建 Dockerfile 和单服务 Compose 辅助配置；Compose 不是启动必需项。
- `resources/`：用户、角色、真实登录/用户创建脚本和容器配置；`users.yaml` 中记录了初始管理员账号和密码。
- `scripts/`：构建、入口进程管理、宿主机 HTTP 健康检查、辅助启动和重置脚本。
- `image/`：保存最终 `linux/amd64` 镜像归档、镜像元数据和 SHA-256 校验文件。
