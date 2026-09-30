# MISP (default)

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：MISP (Malware Information Sharing Platform)
- 版本：default
- 上游仓库：https://github.com/MISP/MISP
- 固定 commit：fb54b3e4a4ddd7ad7913fffd94284dd0e81b2120
- 交付镜像：
  - 应用：`yorem/misp:default@sha256:02fcca47635f0128d2d0ddc451d63ac12c6c819775713588f0a6d53840e70721`
  - 数据库：`mariadb:10.5@sha256:a530aeeefd82f4fa5150f391b6c75462140904780338766f6b03acecb1cca3ce`
  - 缓存：`redis:6.2-alpine@sha256:b362b5dff9d14d961dc3352db4776aba6a8c53ca2661d7c74ad2c121f82cdaea`
- 目标平台：linux/amd64
- 宿主机对外端口：18843

## 快速启动
在应用目录下执行：
```bash
bash scripts/up.sh
```
或者直接使用 Docker Compose 启动：
```bash
docker compose -f docker/compose.yaml up -d
```

## 访问与初始账号
- Web 入口：http://127.0.0.1:18843/
- 登录页面：http://127.0.0.1:18843/users/login
- 管理员账号：`admin@admin.test`
- 管理员密码：`AdminPassword123!`

## 验收与测试
执行健康检查：
```bash
bash scripts/healthcheck.sh
```

验证管理员登录：
```bash
bash resources/login.sh
```

## 环境清理与重置
```bash
bash scripts/reset.sh
```

## 文件职责说明
- `docker/compose.yaml`: 生产环境 Docker Compose 编排，包含 Web 应用、数据库与 Redis 缓存服务配置。
- `docker/custom-entrypoint.sh`: 应用免向导自动初始化与管理员密码更新脚本。
- `image/image.json`: 记录锁定镜像的完整 tag 与 sha256 digest。
- `manifest.yaml`: 环境元数据清单，声明运行时版本、端口映射与部署策略。
- `resources/init.sql`: 预初始化的数据库种子文件。
- `resources/login.sh`: 验证管理员自动登录及主控面板可用性的脚本。
- `resources/users.yaml` / `roles.yaml`: 初始用户及权限角色元数据。
- `scripts/up.sh`: 启动容器并轮询就绪状态的启动脚本。
- `scripts/healthcheck.sh`: 检测 HTTP 响应状态码的健康检测脚本。
- `scripts/reset.sh`: 彻底清理容器与匿名卷的重置脚本。
- `source/source.yaml` / `source/SHA256SUMS`: 记录上游仓库来源与对应 commit。
