# MintHCM 4.0.4 应用环境

本目录交付 MintHCM 4.0.4 的完整 Web 应用环境，目标平台为 `linux/amd64`。归档镜像是单镜像、单容器 all-in-one 环境，内部包含 MintHCM Vue 前端、PHP/Apache、MariaDB、Elasticsearch、运行依赖、数据库初始化和启动逻辑。

## 启动

从应用环境仓库根目录执行：

```bash
cd applications/minthcm/4.0.4
docker run -d -p 18520:80 asteriskax001/sop-minthcm:4.0.4
```

接收者只需要执行 `docker run`，Docker 会自动从 Docker Hub 拉取镜像。镜像内部已经包含应用、数据库、初始化和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap 脚本、数据库脚本或 Web Installer。

## 访问和账号

- 浏览器入口：<http://localhost:18520/>；登录后预期进入 MintHCM 真实业务首页，可见应用导航、模块菜单和仪表盘内容。
- 认证接口：`POST http://localhost:18520/api/login`，请求体为 JSON `username`、`password` 和可选的 `login_language`。
- 初始用户名：`admin`。
- 初始角色：System Administrator。
- 初始密码：`MintHCM-Admin-2026!R7w2`。该密码由容器启动时的 `MINTHCM_ADMIN_PASSWORD` 注入；镜像不烘焙密码，未提供该环境变量时容器会拒绝初始化。

## 验证

宿主机 HTTP 健康检查使用 README 入口，可按需覆盖地址：

```bash
MINTHCM_URL=http://127.0.0.1:18520 scripts/healthcheck.sh
MINTHCM_PASSWORD='MintHCM-Admin-2026!R7w2' MINTHCM_URL=http://127.0.0.1:18520 resources/login.sh
```

普通用户创建使用 MintHCM 已验证的 Users Save 流程，并会再次验证新用户登录：

```bash
MINTHCM_ADMIN_PASSWORD='MintHCM-Admin-2026!R7w2' \
  MINTHCM_URL=http://127.0.0.1:18520 \
  resources/register.sh USERNAME NEW_PASSWORD user@example.com 'User'
```

容器内部的 `HEALTHCHECK` 同时检查 MariaDB、Elasticsearch 和公开 HTTP 页面；宿主机脚本不依赖容器路径或容器内 socket。

## 重置

重置脚本默认只处理本应用的容器名：

```bash
MINTHCM_CONTAINER=minthcm-4-0-4 scripts/reset.sh
docker run --name minthcm-4-0-4 -d -p 18520:80 asteriskax001/sop-minthcm:4.0.4
```

脚本只删除指定容器，不删除未明确指定的 Docker volume。使用 Compose 时，数据库、上传文件和 Elasticsearch 数据分别持久化到本应用的命名卷，重启后会自动恢复。

## 文件说明

- `manifest.yaml`：应用、源码、运行时、组件、镜像和脚本元数据。
- `source/`：仅保存上游仓库链接和固定 commit 哈希的 `source.yaml`；源码快照不随本目录交付。
- `docker/`：Dockerfile、可选的 standalone Dockerfile 和单服务 Compose 配置。
- `resources/`：用户、角色、登录/注册脚本和初始数据说明；`users.yaml` 中记录了初始管理员账号和密码。
- `scripts/`：构建、入口、宿主机健康检查、容器健康检查和重置脚本。
- `image/`：仅保存镜像元数据 `image.json`；镜像本体从 Docker Hub 获取，tar 和校验和不提交到仓库。
