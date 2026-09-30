# Silverpeas (default)

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：Silverpeas
- 版本：default
- 上游仓库：https://github.com/Silverpeas/Silverpeas-Core
- 固定 commit：3f5875d5832af01276050f9ad75a08f7ddb4dd30
- 交付镜像：
  - 应用：`yorem/silverpeas:default`
  - 数据库：`postgres:15-alpine@sha256:f7d23353e1b15400d22ebe31189f4d314b87a4c129cc400c8c2d8d4ca127bf81`
- 目标平台：linux/amd64
- 宿主机对外端口：18864

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
- Web 入口：http://127.0.0.1:18864/silverpeas/
- 登录页面：http://127.0.0.1:18864/silverpeas/defaultLogin.jsp
- 管理员账号：`silverpeas`
- 管理员密码：`SilverpeasPassword123!`
- 备用管理员账号：`SilverAdmin` / `SilverAdmin`

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
- `docker/compose.yaml`: 生产环境 Docker Compose 编排，包含 Silverpeas Web 应用与 PostgreSQL 数据库服务配置。
- `image/image.json`: 记录锁定镜像的完整 tag 与 sha256 digest。
- `manifest.yaml`: 环境元数据清单，声明运行时版本、端口映射与部署策略。
- `resources/init.sql`: 预初始化的数据库种子文件，包含完整的初始化架构与预置管理员账号。
- `resources/login.sh`: 验证管理员自动登录及主控面板可用性的脚本。
- `resources/users.yaml` / `roles.yaml`: 初始用户及权限角色元数据。
- `scripts/up.sh`: 启动容器并轮询就绪状态的启动脚本。
- `scripts/healthcheck.sh`: 检测 HTTP 响应状态码的健康检测脚本。
- `scripts/reset.sh`: 彻底清理容器与匿名卷的重置脚本。
- `source/source.yaml` / `source/SHA256SUMS`: 记录上游仓库来源与对应 commit。
