# Discourse (default)

这是 Discourse 的标准化 Web 应用评测环境，目标平台为 `linux/amd64`。镜像由 Docker Hub 交付，拓扑为多容器 Compose 架构：包含 Discourse 主应用（Ruby 3.4 / Rails 8.1 / Nginx + Pitchfork）、PostgreSQL 15 (pgvector) 数据库（预填充免安装数据库种子）及 Redis 7 缓存服务。

## 启动

在当前应用目录执行：

```bash
scripts/up.sh
```

或使用 Docker Compose：

```bash
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d
```

Docker 会自动从 Docker Hub 拉取已锁定的交付镜像，冷启动后免向导直接可用。

## 访问和账号

- 浏览器入口：http://127.0.0.1:18816/
- 登录页面：http://127.0.0.1:18816/login
- 初始管理员账号：`admin` (邮箱: `admin@example.com`)
- 初始管理员密码：`AdminPassword123!`

访问登录页面可使用上述账号直接登录并进入论坛管理后台。

## 验证与检查

宿主机 HTTP 健康检查：

```bash
scripts/healthcheck.sh
```

管理员登录验证：

```bash
resources/login.sh
```

## 重置与清理

```bash
scripts/reset.sh
```

## 目录结构说明

- `docker/compose.yaml`：标准 Docker Compose 定义，服务包含 `discourse`、`db`、`redis`，锁定平台 `linux/amd64` 与镜像摘要。
- `image/image.json`：镜像元数据记录与 sha256 digest。
- `manifest.yaml`：应用交付清单，声明 `native_compose` 与 `DOCKERHUB` 交付模式。
- `resources/`：包含角色定义、用户定义、自动化登录脚本以及初始数据库种子。
- `scripts/`：启动、健康检查与清理重置脚本。
- `source/`：上游源码元数据与校验和。
