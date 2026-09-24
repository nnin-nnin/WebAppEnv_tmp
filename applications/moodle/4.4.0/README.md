# Moodle 4.4.0 Application Environment ()

这是 Moodle 4.4.0 固定源码 commit `ee91c6536f99e1633e2245780c4fe7f47340ed66` targeting platform `linux/amd64`。最终交付是单镜像、单容器的 all-in-one 环境, encapsulating Moodle、Apache/PHP 8.2、MariaDB 10.11、初始化数据库和初始 moodledata。

## Quick Start

Execute from the repository root:

```bash
cd applications/moodle/4.4.0
docker run -d -p 18521:80 yorem/moodle:4.4.0
```

接收者只需要执行 `docker run`，Docker 会自动从 Docker Hub 拉取镜像。镜像内部已经包含应用、数据库、初始化和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap 脚本、数据库初始化脚本或 Web Installer。需要持久化数据时，可在 `docker run` 中额外挂载 `/var/www/moodledata` 和 `/var/lib/mysql`；不挂载时数据仍保存在容器可写层。

## Access & Credentials

- Web Entrypoint: <http://localhost:18521/>
- 预期入口：Moodle 真实登录页；管理员登录后进入 Moodle Dashboard，可看到站点导航、课程和管理菜单。
- Initial Username: `admin`
- Initial Role: site administrator
- Initial Password: `WcMood!26-mQ6rS2F`

Moodle 4.4 默认不开放公开自助注册。创建普通用户请使用已经验证的 Moodle 用户 API 辅助方式：运行中的容器提供 `moodle-register-user`，`resources/register.sh` 通过 `docker exec` 调用它，并使用 Moodle 的 `user_create_user()` 核心 API。为保证核心页面离线可用，镜像种子默认关闭可选的 MathJax 过滤器，并将其可选加载地址指向容器内 no-op stub；Moodle 登录、导航和课程管理不依赖远程 CDN。

## Verification

宿主机公开 HTTP 验证：

```bash
MOODLE_URL=http://localhost:18521 scripts/healthcheck.sh
```

真实登录验证：

```bash
MOODLE_URL=http://localhost:18521 MOODLE_USERNAME=admin MOODLE_PASSWORD='WcMood!26-mQ6rS2F' resources/login.sh
```

创建普通用户（参数为用户名、密码、邮箱，可选名和姓）：

```bash
MOODLE_CONTAINER=$(docker ps --filter ancestor=yorem/moodle:4.4.0 --format '{{.ID}}' | head -n 1) resources/register.sh learner 'Verify-User-2026!' learner@example.invalid Learner One
```

容器内部数据库探针由 Docker `HEALTHCHECK` 定义；宿主机健康检查只通过公开 HTTP 入口验证真实 Moodle 页面。

## State Reset

重置会删除指定容器和数据卷，执行前需要交互输入 `RESET`：

```bash
MOODLE_CONTAINER=moodle-app MOODLE_DATA_VOLUME=moodle-data MOODLE_DB_VOLUME=moodle-db scripts/reset.sh
```

重置后重新执行本节“启动”中的 `docker run` 命令即可恢复初始管理员及初始数据库。若使用自定义容器名或卷名，请同步设置脚本环境变量。

## Directory Structure

- `manifest.yaml`：应用类型、固定源码、运行时、组件、端口、镜像和脚本元数据。
- `source/`: Upstream provenance (`source.yaml`); raw source snapshot excluded.
- `docker/`：最终 Dockerfile、standalone Dockerfile 和单服务 Compose 辅助配置；Compose 不是启动前置条件。
- `resources/`：用户、角色、登录和普通用户创建辅助内容；`initial-data/` 说明镜像内的数据库与 moodledata 种子。
- `scripts/`：构建、入口、启动、宿主机 HTTP 健康检查和重置脚本。
- `image/`: Metadata (`image.json`); images pulled from Docker Hub.

## 直接启动命令

```bash
docker run -d -p 18521:80 yorem/moodle:4.4.0
```
