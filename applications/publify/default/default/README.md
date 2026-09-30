# Publify default

原生 Docker Compose 应用运行环境。

## 1. 前置条件
- Docker Engine 20.10+
- Docker Compose v2+
- 目标平台: `linux/amd64`

## 2. 启动环境
在当前应用目录下执行：
```bash
bash scripts/up.sh
```
或使用原生 Compose 命令启动：
```bash
docker compose -f docker/compose.yaml up -d
```

## 3. 访问与认证
- 访问地址: http://127.0.0.1:18861
- 初始管理员账号: `admin`
- 初始管理员密码: `AdminPassword123!`
- 登录入口: http://127.0.0.1:18861/users/sign_in
- 管理后台: http://127.0.0.1:18861/admin

## 4. 服务编排
| 服务名 | 镜像 | 平台 | 端口映射 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| **application** | `yorem/publify:default@sha256:76f87a363dd9a49db68f507cf1776697ff7cf4e2e645996a088d11ffbfce704d` | `linux/amd64` | `18861:3000` | Publify Ruby on Rails 博客主应用 (Puma) |
| **db** | `mariadb:10.6@sha256:40153feb479c0da88b5cfe3f50f44c91f7baf05a1b7bcc5beb7eb37a890a8f16` | `linux/amd64` | - | 数据库存储服务 (预置种子与免安装向导配置) |

## 5. 健康检查与验证
执行存活检测：
```bash
bash scripts/healthcheck.sh
```
执行用户认证与端点可用性校验：
```bash
bash resources/login.sh
```

## 6. 环境重置与清理
```bash
bash scripts/reset.sh
```
该操作将停止容器并销毁关联的数据卷（`database-data`）。
