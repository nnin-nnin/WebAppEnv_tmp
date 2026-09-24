# InvoiceNinja 5.13.30 (Native Docker Compose)

本交付物是多容器 Docker Compose 环境，保留了 InvoiceNinja 原本的容器拓扑，不是 all-in-one 单容器环境。

## 前置条件
- 操作系统支持 Docker
- 已安装 Docker Engine 和 Docker Compose v2
- 目标架构：linux/amd64
- 确保端口 `18085` 未被占用

## 启动服务

使用 Docker Hub 镜像交付方式，执行以下命令：
```bash
docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml pull
docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml up -d
```
或直接运行内置脚本：
```bash
bash scripts/up.sh
```

## 服务说明
本环境包含 3 个独立容器，通过 Compose 网络互相连接：
1. **server** (`nginx`): 负责静态文件处理和代理到 PHP-FPM。
2. **app** (`yorem/invoiceninja:5.13.30`): 包含应用代码、通过 supervisord 启动的 PHP-FPM、定时任务 (cron) 和队列处理守护进程。
3. **db** (`mysql`): 应用专用的数据库，持久化存储业务数据。

应用通过 `db:3306` 访问数据库。数据卷配置了本地持久化，重新创建容器不会丢失数据。

## 访问与账号

- 浏览器入口：http://127.0.0.1:18085
- 初始管理员账号：`admin@example.com`
- 初始管理员密码：`adminpassword`

初始管理员是由 `app` 容器在第一次启动、初始化数据库后自动根据环境变量创建的。

## 验证

验证应用健康状态：
```bash
bash scripts/healthcheck.sh
```

验证 API 登录：
```bash
bash resources/login.sh
```

验证命令行注册新用户：
```bash
bash resources/register.sh newuser@example.com newpassword
```

## 重置

如果需要清理环境，执行以下命令（将删除所有相关容器、网络以及命名卷，业务数据将被清空）：
```bash
bash scripts/reset.sh
```

## 交付文件说明
- `manifest.yaml`: 项目构建和环境配置的完整元数据描述
- `source/`: 源码信息（包含仓库及 Immutable commit 哈希）
- `docker/`: 最终使用的 `compose.yaml` 及 `nginx.conf`
- `resources/`: 账号和角色说明、登录/注册验证脚本
- `scripts/`: 包含启动、健康检查、环境重置等运维脚本

## 版本及来源
- `nginx`：`1.25-alpine@sha256:721fa00bc549df26b3e67cc558ff176112d4ba69847537766f3c28e171d180e7`
- `yorem/invoiceninja:5.13.30`：`5.13.30@sha256:31962034a40e1d6bb505082365525747df73c22307327c129dd0662966598cb7`
- `mysql`：`8.0@sha256:62fb722c78b24245ddff1796a0fcee4a49cc5b87e0aaaf20c92d1da9e0a2497b`

## 官方 Compose 的差异
1. 固定镜像 Tag，并且绑定了精确的 Digest。
2. 剔除挂载宿主机绝对路径，改用 Docker named volume 持久化数据。
3. 官方原本 `cron` 需要单独容器或者已移除(在 V5 中使用 supervisord)。当前服务已由 `app` 中的 `supervisord` 提供完整的 PHP-FPM 和 Worker 支持。
4. 加入了针对 `db` 容器明确的 healthcheck 以及服务间的 `depends_on` 设置以保证顺序启动。
