# EspoCRM 8.2.5 all-in-one 环境

本目录交付 `linux/amd64` 单镜像、单容器的完整 EspoCRM Web 应用。镜像为 `asteriskax001/sop-espocrm:8.2.5`，内部包含 PHP 8.3.33、Apache 2.4.68、EspoCRM 前端与后端以及 MariaDB 11.8.6。

## 启动

从仓库根目录进入本目录并校验归档，然后只需加载和运行镜像：

```bash
cd yz_espocrm_8.2.5
(cd image && sha256sum -c SHA256SUMS)
docker load -i image/espocrm-8.2.5-linux-amd64.tar
docker run -d --name espocrm -p 18292:80 -v espocrm-data:/var/www/html/data -v espocrm-db:/var/lib/mysql -v espocrm-custom:/var/www/html/custom asteriskax001/sop-espocrm:8.2.5
```

接收者不需要执行 `build.sh`、Compose、bootstrap、Web Installer 或数据库脚本；镜像入口会自动启动 MariaDB、建库、建表和初始化管理员。

## 访问和账号

浏览器打开 <http://localhost:18292/>，应看到 EspoCRM 真实登录页；登录后进入包含导航栏、仪表盘和实体菜单的 CRM 工作区。初始账号为 `admin`，密码为 `benchmark-only`，角色为 Administrator。REST API 根地址为 `http://localhost:18292/api/v1/`。

## 验证

```bash
bash -n scripts/*.sh resources/*.sh
ESPOCRM_URL=http://127.0.0.1:18292 scripts/healthcheck.sh
ESPOCRM_URL=http://127.0.0.1:18292 resources/login.sh
ESPOCRM_URL=http://127.0.0.1:18292 resources/register.sh demo-user demo-password
```

`scripts/healthcheck.sh` 在宿主机执行时只做 HTTP 层检查（根路径返回 200 且内容是真实 EspoCRM 页面）。需要同时检查容器内的安装配置和 MariaDB 时，在容器内执行同一脚本：

```bash
docker exec espocrm /usr/local/bin/espocrm-healthcheck
```

`resources/login.sh` 使用 EspoCRM 的 Basic/Espo-Authorization 登录接口；EspoCRM 没有公开自助注册 API，`register.sh` 使用管理员认证调用真实 `POST /api/v1/User` 创建普通用户。管理员凭据可用 `ESPOCRM_ADMIN_USER` 和 `ESPOCRM_ADMIN_PASSWORD` 覆盖。

## 重置

停止并删除容器后，执行 `scripts/reset.sh`（它会删除默认命名卷），再按“启动”重新运行即可恢复到初始账号和空白数据库。生产数据请先备份卷。

## 文件说明

- `manifest.yaml`：固定源码、运行时、镜像和验收元数据。
- `source/`：仅保存 GitHub 仓库链接和固定 commit 哈希的 `source/source.yaml`；源码快照不随本目录交付。
- `docker/`：最终 Dockerfile、辅助 Dockerfile 和单服务 Compose 配置。
- `resources/`：用户、角色以及登录/创建用户脚本；本版本不需要额外 seed 文件。
- `scripts/`：构建、入口、启动、健康检查和重置运维脚本。
- `image/`：最终 all-in-one 镜像 tar、元数据和 SHA256 校验文件。
