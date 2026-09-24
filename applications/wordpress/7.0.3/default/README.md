# WordPress 7.0.3 原生多容器 Docker Compose 环境

本目录提供一个可复现的、原生的多容器 Docker Compose 应用环境，用于运行 WordPress。

## 环境特点

- **部署模式**：多容器 Docker Compose 环境，不是 all-in-one 单容器环境。
- **服务分离**：应用和数据库运行在独立容器中，通过 Compose 项目网络通信。
- **无需手动创建网络**：接收者无需手动创建 Docker 网络。
- **无需手动导入 SQL**：数据库会在初次启动时自动进行初始化。

## 前置条件

- 操作系统：Linux 或 macOS
- Docker Engine & Docker Compose v2 (可通过 `docker compose version` 验证)
- 网络访问能够拉取 Docker Hub 镜像

## 启动服务

本环境使用 Docker Hub 获取镜像的方式交付。请在本项目根目录下执行以下命令：

```bash
docker compose -p wordpress-7-0-3 -f docker/compose.yaml pull
docker compose -p wordpress-7-0-3 -f docker/compose.yaml up -d
```

## 访问与账号信息

服务启动后，可以通过浏览器访问。

- **浏览器入口**：http://localhost:28080
- **初始管理员账号**：admin
- **初始管理员密码**：admin_password
- **初始角色**：Administrator

首次运行 `bash scripts/up.sh` 会在应用可访问后通过 WordPress 自带安装页面创建管理员，
不需要安装 `wp-cli`、下载额外文件或配置代理。

## 服务说明

- **application (WordPress)**：Web 服务器 (Apache) 与 PHP 运行环境，挂载命名卷以持久化主题和插件。
- **db (MySQL)**：数据存储，保存 WordPress 用户和站点内容，自动进行数据卷持久化。

## 验证

本目录提供了辅助的检查脚本，请确认您已安装 `curl`：

```bash
bash scripts/healthcheck.sh
bash resources/login.sh
bash resources/register.sh testuser testpassword
```

`register.sh` 使用已登录管理员的 WordPress Users 页面创建 Subscriber 用户，并验证表单请求
成功；脚本不会在容器运行时下载依赖。

## 重置项目

重置操作将删除本 Compose 项目的容器、网络和命名卷：

```bash
bash scripts/reset.sh
```

## 文件与目录结构说明

- `manifest.yaml`：环境描述与元信息配置。
- `source/`：定义依赖的 WordPress 版本 commit。
- `docker/`：存放主 `compose.yaml` 及容器配置。
- `resources/`：角色、账户信息以及模拟登录和注册的辅助脚本。
- `scripts/`：运维脚本，用于快速启动、健康检查和彻底重置。

## 版本与镜像来源

所有镜像使用固定版本标签和 digest 锁定。

- application: `yorem/wordpress:7.0.3@sha256:c6c286c52f1e182c210864b79e5039af4f30e8c802f1fa10db207b033ee67761`
- db: `mysql:8.4.4@sha256:d895a591bdc9fbd228dc75f4859791160f321b839bad18bba44811834143b0c4`

## 与官方 Compose 的差异

- 使用了明确指定架构平台 (`linux/amd64`)。
- 绑定了指定的镜像 hash，防止镜像变更。
- 为 MySQL 配置了严格的健康检查，以便 WordPress 服务确保数据库就绪后才尝试建立连接。
