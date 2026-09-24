# OpenEMR 8.2.0 - Native Docker Compose

## 应用信息
- 应用名称：OpenEMR
- 应用版本：8.2.0
- 部署模式：原生多容器 Docker Compose

**注意**：本交付物是多容器 Compose 环境，不是 all-in-one 单容器环境。应用、数据库分别运行在独立容器中，并通过 Compose 网络通信。接收者不需要手动创建 Docker 网络、手动安装数据库或导入 SQL。

## 前置条件
- 目标平台：linux/amd64
- 已安装 Docker Engine 和 Docker Compose v2
- 能够正常访问外部网络，拉取 Docker Hub 镜像

## 启动服务

本项目使用 Docker Hub 镜像交付。请进入当前应用根目录执行以下命令：

```bash
docker compose -p openemr-8-2-0 -f docker/compose.yaml pull
docker compose -p openemr-8-2-0 -f docker/compose.yaml up -d
```

## 访问与账号
- 浏览器入口：http://127.0.0.1:8085/
- API 地址：未特别对外暴露独立 API 端口
- 初始管理员账号：`admin`
- 初始管理员密码：`pass`
- 角色：Administrator

## 服务说明
- **应用 (openemr)**：OpenEMR 核心服务，运行在独立容器中，提供 Web 界面和后端功能。
- **数据库 (mysql)**：MariaDB 11.8.8 服务，提供核心数据存储。

## 验证
可执行以下脚本进行环境验证：
```bash
bash scripts/healthcheck.sh
bash resources/login.sh
bash resources/register.sh testuser 'TestPassword3!' Test User testuser@example.com
```

## 重置
重置操作会停止并删除当前 Compose 项目的容器、网络和命名卷：
```bash
bash scripts/reset.sh
```
只影响本项目，不影响宿主机其他容器。

## 文件说明
- `manifest.yaml`: 环境元数据声明文件。
- `source/`: 源码信息记录，包含固定 commit 等。
- `docker/`: 包含最终运行配置 `compose.yaml`。
- `resources/`: 包含初始用户、角色定义和登录测试脚本。
- `scripts/`: 包含启动、健康检查和重置等运维脚本。

## 官方 Compose 差异
- 修改了对外端口映射：官方默认映射了宿主机的 `80` 和 `443` 端口，为了避免冲突和暴露，我们将其修改为 `127.0.0.1:8085:80` 且移除了 `443` 映射。
- 将 openemr 服务的健康检查从 `https` 改为了 `http`。
- `resources/register.sh` 使用管理员登录后的 OpenEMR Users 页面创建普通用户并立即
  用真实登录请求验证，不依赖运行时下载或直接修改数据库。
