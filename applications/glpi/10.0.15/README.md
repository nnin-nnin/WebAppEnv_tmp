# GLPI 10.0.15 Application Environment ()

本目录交付 GLPI 10.0.15 的完整 Web Application Environment，固定源码 commit 为 `f64caeedbeda1010cfd8142d5fa0125e11568129`，targeting platform `linux/amd64`。最终产物是单镜像、单容器 all-in-one 环境：镜像内包含 GLPI PHP 应用、Apache、前端静态资源、Composer 依赖、MariaDB 和自动初始化逻辑。

## Quick Start

Execute from the repository root:

```bash
cd applications/glpi/10.0.15
docker run -d -p 18514:80 yorem/glpi:10.0.15
```

Users only need to execute `docker run`. Docker automatically pulls the image from Docker Hub. The image encapsulates the application, database, and initialization logic; no local build scripts, bootstrap steps, or web installers are required. Initial startup initializes internal database schemas and may require a brief wait to converge.

## Access & Credentials

- Web Entrypoint: `http://127.0.0.1:18514/`
- 登录后预期页面：GLPI Central 管理首页，可看到资产、协助、工单、配置等真实应用菜单和导航。
- Initial Username: `admin`
- Initial Role: GLPI built-in `Super-Admin`.
- Initial Password: `WcGlpi!26-fC7mR2N`
- REST API：`http://127.0.0.1:18514/apirest.php`；镜像已启用凭据登录。

## Verification

宿主机公开 HTTP 健康检查使用 `GLPI_URL` 覆盖默认地址：

```bash
GLPI_URL=http://127.0.0.1:18514 ./scripts/healthcheck.sh
```

使用真实 GLPI REST 认证接口验证管理员登录：

```bash
GLPI_URL=http://127.0.0.1:18514 GLPI_USERNAME=admin GLPI_PASSWORD='WcGlpi!26-fC7mR2N' ./resources/login.sh
```

GLPI No anonymous self-registration interface;`resources/register.sh` 使用 GLPI 真实 REST API 的 `User` 资源，以管理员会话创建 `Self-Service` 普通用户。用户名和新密码由调用者提供：

```bash
GLPI_PASSWORD='WcGlpi!26-fC7mR2N' GLPI_NEW_PASSWORD='Verify-User-2026!' ./resources/register.sh testuser testuser@example.com
```

## State Reset

`scripts/reset.sh` 会删除匹配 GLPI 镜像的目标容器及其匿名数据卷；如存在多个候选容器，必须显式指定容器名或 ID。执行后重新运行启动章节中的 `docker run` 命令：

```bash
GLPI_CONTAINER=<容器名或ID> ./scripts/reset.sh
docker run -d -p 18514:80 yorem/glpi:10.0.15
```

## Directory Structure

- `manifest.yaml`: Application, source commit, runtime, image, and operational metadata.
- `source/`: Upstream provenance (`source.yaml`); raw source snapshot excluded.
- `docker/`：all-in-one Dockerfile、standalone Dockerfile 入口和单服务 Compose 辅助配置；Compose 不是启动前置条件。
- `resources/`：账号、角色、真实登录脚本、真实用户创建脚本和初始数据说明。
- `scripts/`: Build, entrypoint, host healthcheck, container healthcheck, up, and reset scripts.
- `image/`: Metadata (`image.json`); images pulled from Docker Hub.
