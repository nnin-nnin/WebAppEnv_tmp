# GLPI 10.0.15 应用环境

本目录交付 GLPI 10.0.15 的完整 Web 应用环境，固定源码 commit 为 `f64caeedbeda1010cfd8142d5fa0125e11568129`，目标平台为 `linux/amd64`。最终产物是单镜像、单容器 all-in-one 环境：镜像内包含 GLPI PHP 应用、Apache、前端静态资源、Composer 依赖、MariaDB 和自动初始化逻辑。

## 启动

从应用环境仓库根目录执行：

```bash
cd applications/glpi/10.0.15
docker run -d -p 18514:80 yorem/glpi:10.0.15
```

接收者只需要执行 `docker run`，Docker 会自动从 Docker Hub 拉取镜像。镜像内部已经包含应用、数据库、初始化和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap 脚本、安装脚本、数据库脚本或 Web Installer。首次启动会在同一容器内初始化 MariaDB 和 GLPI 数据库，可能需要等待一段时间。

## 访问和账号

- 浏览器入口：`http://127.0.0.1:18514/`
- 登录后预期页面：GLPI Central 管理首页，可看到资产、协助、工单、配置等真实应用菜单和导航。
- 初始用户名：`admin`
- 初始角色：GLPI 内置 `Super-Admin`。
- 初始密码：`WcGlpi!26-fC7mR2N`
- REST API：`http://127.0.0.1:18514/apirest.php`；镜像已启用凭据登录。

## 验证

宿主机公开 HTTP 健康检查使用 `GLPI_URL` 覆盖默认地址：

```bash
GLPI_URL=http://127.0.0.1:18514 ./scripts/healthcheck.sh
```

使用真实 GLPI REST 认证接口验证管理员登录：

```bash
GLPI_URL=http://127.0.0.1:18514 GLPI_USERNAME=admin GLPI_PASSWORD='WcGlpi!26-fC7mR2N' ./resources/login.sh
```

GLPI 没有匿名公开注册接口；`resources/register.sh` 使用 GLPI 真实 REST API 的 `User` 资源，以管理员会话创建 `Self-Service` 普通用户。用户名和新密码由调用者提供：

```bash
GLPI_PASSWORD='WcGlpi!26-fC7mR2N' GLPI_NEW_PASSWORD='Verify-User-2026!' ./resources/register.sh testuser testuser@example.com
```

## 重置

`scripts/reset.sh` 会删除匹配 GLPI 镜像的目标容器及其匿名数据卷；如存在多个候选容器，必须显式指定容器名或 ID。执行后重新运行启动章节中的 `docker run` 命令：

```bash
GLPI_CONTAINER=<容器名或ID> ./scripts/reset.sh
docker run -d -p 18514:80 yorem/glpi:10.0.15
```

## 文件说明

- `manifest.yaml`：应用、固定源码、运行时、镜像、资源和脚本元数据。
- `source/`：仅保存上游仓库链接和固定 commit 哈希的 `source.yaml`；源码快照不随本目录交付。
- `docker/`：all-in-one Dockerfile、standalone Dockerfile 入口和单服务 Compose 辅助配置；Compose 不是启动前置条件。
- `resources/`：账号、角色、真实登录脚本、真实用户创建脚本和初始数据说明。
- `scripts/`：构建、容器入口、宿主机健康检查、容器健康检查、启动和重置脚本。
- `image/`：仅保存镜像元数据 `image.json`；镜像本体从 Docker Hub 获取，tar 和校验和不提交到仓库。
