# phpMyAdmin 4.7.9 all-in-one Application Environment ()

This is a reproducible environment built from pinned source commit `80914e327e4deafe78e0813ffdba7fce8acf10ac`（标签 `RELEASE_4_7_9`，附注标签对象 `98a32765caae870e0f9df3e3374ee5c8cff435e8`）的完整 Web Application Environment，targeting platform `linux/amd64`。最终镜像为单镜像、单容器，内含 PHP 7.2、Apache、MariaDB 10.3、phpMyAdmin 浏览器前端、初始化数据库和管理员账号。

## Quick Start

从仓库根目录进入本目录后，接收者只需要校验并加载最终镜像，然后直接运行容器：

```bash
cd phpmyadmin_4.7.9
sha256sum -c image/SHA256SUMS
docker load -i image/phpmyadmin-4.7.9-linux-amd64.tar
docker run -d -p 18379:80 yorem/phpmyadmin:4.7.9
```

镜像内部已经包含应用、依赖、数据库、初始化和启动逻辑；不需要执行 `build.sh`、Compose、bootstrap 脚本、Web Installer、SQL 导入或单独启动数据库容器。若需要显式命名持久化卷，可在 `docker run` 中额外挂载 `/var/lib/mysql` 和 `/var/www/html/data`。

## Access & Credentials

- Web Entrypoint: <http://127.0.0.1:18379/>
- 登录后预期页面：phpMyAdmin 的数据库服务器首页，可看到导航树、数据库列表和 SQL/状态等菜单，而不是状态页或 API 文档。
- Initial Admin: `admin`
- Initial Password: `benchmark-only`
- Role: 数据库管理员；初始账号拥有同容器 MariaDB 中数据库的管理权限。
- 数据库地址：容器内部 `127.0.0.1:3306`，外部不需要也不应再启动数据库。

密码仅用于 benchmark 验收，不适合生产环境。

## Verification

容器启动后执行：

```bash
scripts/healthcheck.sh
PMA_URL=http://127.0.0.1:18379 PMA_USER=admin PMA_PASSWORD=benchmark-only resources/login.sh
PMA_CONTAINER="$(docker ps -q --filter publish=18379 | head -n 1)" PMA_ADMIN_PASSWORD=benchmark-only resources/register.sh ordinary benchmark-only-2
```

`login.sh` 使用 phpMyAdmin 的真实 cookie 登录表单；phpMyAdmin 4.7.9 没有公开注册 API，因此 `register.sh` 使用容器内 MariaDB 的真实 `CREATE USER`/授权能力创建一个普通数据库用户，并验证该用户可以连接。该脚本需要宿主机上的 Docker CLI，但不依赖 Docker Compose。

## State Reset

重置会删除该容器关联的数据库卷并重新初始化管理员和 `benchmark` 数据库。必须显式确认：

```bash
RESET_CONFIRM=YES PMA_CONTAINER="$(docker ps -q --filter publish=18379 | head -n 1)" scripts/reset.sh
```

重置后恢复方式是重新执行：

```bash
PMA_URL=http://127.0.0.1:18379 PMA_USER=admin PMA_PASSWORD=benchmark-only resources/login.sh
```

## Directory Structure

- `manifest.yaml`：应用、源码、运行时、镜像、端口和运维入口的机器可读清单。
- `source/`: Upstream provenance (`source/source.yaml`); source snapshots excluded.
- `docker/`：最终镜像 Dockerfile、备用 standalone Dockerfile 和单服务 Compose 配置。
- `resources/`：账号、角色、真实登录/用户创建辅助脚本以及数据库初始 SQL。
- `scripts/`：构建、容器入口、健康检查和重置脚本。
- `image/`：最终 all-in-one 镜像 tar、镜像元数据和校验文件。
