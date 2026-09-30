# ERPNext (default)

这是 ERPNext 的标准化 Web 应用安全评测环境，目标平台为 `linux/amd64`。镜像由 Docker Hub 统一托管交付，拓扑采用 Compose 编排架构：包含 ERPNext 主应用服务（Python 3.11 / Frappe Framework / Nginx + Gunicorn）、MariaDB 10.6 数据库（预导入免安装向导的完整数据库种子）及 Redis 7 缓存服务。

## 启动

在当前应用目录执行：

```bash
scripts/up.sh
```

或使用 Docker Compose：

```bash
docker compose -f docker/compose.yaml up -d
```

冷启动后免向导直接可用，数据库已预置并跳过向导模式。

## 访问和账号

- 浏览器入口：http://127.0.0.1:18822/
- 登录页面：http://127.0.0.1:18822/login
- 主控面板：http://127.0.0.1:18822/app
- 初始管理员账号：`Administrator`
- 初始管理员密码：`AdminPassword123!`

访问登录页面可使用上述账号直接登录并进入 ERPNext 管理主控面板。

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

- `docker/compose.yaml`：标准 Docker Compose 定义，服务包含 `app`、`db`、`redis`，锁定平台 `linux/amd64` 与镜像摘要。
- `image/image.json`：镜像元数据记录与 sha256 digest。
- `manifest.yaml`：应用交付清单，声明 `native_compose` 与 `DOCKERHUB` 交付模式。
- `resources/`：包含角色定义、用户定义、自动化登录脚本以及初始数据库种子 `database-seed.sql`。
- `scripts/`：启动、健康检查与清理重置脚本。
- `source/`：上游源码元数据与校验和。
