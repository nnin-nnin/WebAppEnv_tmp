# PrestaShop 9.1.4 Application Environment ()

This is a reproducible environment built from pinned source commit `4f7653032a0605d8dfc16515a5f3aea62dcef9b1` targeting platform `linux/amd64`。最终交付物是单镜像、单容器的 all-in-one 镜像 `yorem/prestashop:9.1.4`，容器内部同时运行 Apache/PHP、PrestaShop 和 MariaDB。

## Quick Start

从Application Environment目录执行：

```bash
cd prestashop_9.1.4
sha256sum --check image/SHA256SUMS
docker load -i image/prestashop-9.1.4-linux-amd64.tar
docker run -d -p 18401:80 yorem/prestashop:9.1.4
```

源码来源和固定 commit 记录在 `source/source.yaml`；当前轻量交付目录不包含源码快照，标准使用方式不需要源码校验：

```bash
cat source/source.yaml
```

接收者只需要执行 `docker load` 和 `docker run`。镜像内部已经包含应用、Composer 依赖、编译后的前端资源、MariaDB、数据库初始化和启动逻辑，不需要执行 `build.sh`、Docker Compose、bootstrap 脚本或 Web Installer。

首次启动会在容器内自动初始化 MariaDB，并使用 PrestaShop 官方 `install-dev/index_cli.php` 安装器导入数据库、模块、主题和演示商品。首次初始化可能需要几十秒；可通过 `docker logs -f <container-id>` 查看进度。

## Access & Credentials

- 店铺前台：<http://localhost:18401/>，显示 Classic 主题的真实 PrestaShop 店铺首页。
- 后台登录页：<http://localhost:18401/admin-dev/index.php/login>，登录后进入真实后台仪表盘，可访问 Catalog、Orders、Customers 等菜单。
- 初始管理员显示名：`admin`。
- PrestaShop 登录名：`admin@example.com`（PrestaShop 后台认证字段是邮箱）。
- Initial Password: `benchmark-only`。
- Role: `SuperAdmin`，拥有全部后台权限。

以上账号仅用于 benchmark 环境，请勿用于生产部署。

## Verification

应用启动后执行：

```bash
scripts/healthcheck.sh
APP_URL=http://localhost:18401 ADMIN_EMAIL=admin@example.com ADMIN_PASSWORD=benchmark-only resources/login.sh
resources/register.sh buyer@example.com 'Buyer-Only-2026' Buyer Example
```

`resources/login.sh` 使用真实的 `/admin-dev/index.php/login` 表单完成后台登录；`resources/register.sh` 使用 PrestaShop 前台真实的 `/registration`、`submitCreate` 注册流程创建普通客户账号。注册参数不完整或应用返回校验错误时脚本返回非零退出码。

## State Reset

重置会删除指定容器及其持久化卷中的数据库、配置、图片和上传数据：

```bash
CONTAINER_NAME=<docker ps 显示的容器 ID 或名称> scripts/reset.sh --yes
docker load -i image/prestashop-9.1.4-linux-amd64.tar
docker run -d -p 18401:80 yorem/prestashop:9.1.4
```

不执行重置时，重启同一容器会复用已有数据库和 `app/config/parameters.php`，不会重复安装或覆盖数据。需要长期保存数据时，可按 `docker/compose.yaml` 中的应用服务卷映射启动；Compose 不是交付启动的必要条件，且其中只有一个 service。

## Directory Structure

- `manifest.yaml`：应用、固定源码、运行时、组件、镜像和脚本元数据。
- `source/`: Upstream provenance (`source/source.yaml`); source snapshots excluded.
- `docker/`：最终 Dockerfile、辅助 Dockerfile 和单 service Compose 配置。
- `resources/`：用户、角色、真实登录/注册脚本；应用本身的数据库初始数据由官方安装器内置并在镜像中随源码交付，因此没有额外 seed SQL。
- `scripts/`：构建、入口、启动、健康检查和重置运维脚本。
- `image/`：最终单镜像 tar、镜像元数据和校验和。
