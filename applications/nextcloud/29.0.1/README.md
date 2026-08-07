# Nextcloud 29.0.1 应用环境

这是 Nextcloud 29.0.1 的完整 Web 应用环境，目标平台为 `linux/amd64`。最终交付是单镜像、单容器 all-in-one 镜像，容器内包含 Nextcloud、PHP 8.2、Apache 和 MariaDB 11.8.6；官方源码中的真实前端静态 bundle 也已包含在镜像内。

## 启动

从应用环境仓库根目录执行：

```bash
cd applications/nextcloud/29.0.1
docker run -d -p 18522:80 asteriskax001/sop-nextcloud:29.0.1
```

接收者只需要执行 `docker run`，Docker 会自动从 Docker Hub 拉取镜像。镜像内部已经包含应用、MariaDB、初始化数据和启动逻辑，不需要执行 `build.sh`、Docker Compose、bootstrap 脚本或 Web Installer。

构建者如需重新生成归档，必须通过受控环境提供管理员密码后执行 `NEXTCLOUD_ADMIN_PASSWORD=受控值 scripts/build.sh`；该值只进入一次性的 BuildKit secret，不写入镜像环境变量或交付文件。

## 访问和账号

- 浏览器入口：<http://127.0.0.1:18522/>。应显示 Nextcloud 真实登录页；登录后进入 Files 文件管理页面，可见应用导航和文件列表。
- 状态接口：<http://127.0.0.1:18522/status.php>。
- OCS API 根地址：<http://127.0.0.1:18522/ocs/v1.php/cloud/>。
- 初始用户名：`admin`。
- 初始角色：administrator。
- 初始密码：`WcNext!26-cR7vK2P`

## 验证

宿主机健康检查通过公开 HTTP 入口执行，不依赖容器路径、Unix socket 或宿主机 `127.0.0.1:80`：

```bash
scripts/healthcheck.sh
NEXTCLOUD_URL=http://127.0.0.1:18522 scripts/healthcheck.sh
```

验证真实 WebDAV 登录和真实 OCS 用户创建接口：

```bash
NEXTCLOUD_PASSWORD='WcNext!26-cR7vK2P' resources/login.sh
NEXTCLOUD_PASSWORD='WcNext!26-cR7vK2P' resources/register.sh acceptance-user 'Verify-User-2026!'
NEXTCLOUD_USERNAME=acceptance-user NEXTCLOUD_PASSWORD='Verify-User-2026!' resources/login.sh
```

登录脚本使用 Nextcloud WebDAV `PROPFIND`，注册脚本使用 Nextcloud OCS `cloud/users` 管理接口，失败时返回非零退出码。

## 重置

直接运行的容器没有命名要求，重置脚本会按最终镜像筛选并删除该应用容器：

```bash
scripts/reset.sh
docker run -d -p 18522:80 asteriskax001/sop-nextcloud:29.0.1
```

使用 Compose 或自行挂载 Docker volume 时，如需同时删除持久化数据，明确设置 `RESET_VOLUMES=1 scripts/reset.sh`；删除后再次运行会从镜像内置的初始化数据库恢复。

## 文件说明

- `manifest.yaml`：应用类型、固定源码、运行时、端口、镜像和脚本元数据。
- `source/`：仅保存上游仓库链接和固定 commit 哈希的 `source.yaml`；源码快照不随本目录交付。
- `docker/`：Dockerfile、standalone Dockerfile 和仅含一个 service 的可选 Compose 配置。
- `resources/`：用户、角色、真实登录/注册辅助脚本；`users.yaml` 中记录了初始管理员账号和密码。
- `scripts/`：镜像构建、容器入口、宿主机 HTTP 健康检查和重置脚本。
- `image/`：仅保存镜像元数据 `image.json`；镜像本体从 Docker Hub 获取，tar 和校验和不提交到仓库。

镜像启动时先在同一容器内启动 MariaDB，等待数据库可用后启动 Apache；任一核心进程退出都会使容器退出。MariaDB 只监听容器内 `127.0.0.1`，数据目录和 Nextcloud 文件数据可分别通过 Docker volume 持久化。核心页面、JS、CSS 和图片不依赖 CDN 或运行时联网下载。
