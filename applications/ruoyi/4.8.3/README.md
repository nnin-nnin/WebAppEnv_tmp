# RuoYi 4.8.3 - 原生多容器 Docker Compose 环境

本环境为 RuoYi (Spring Boot + Thymeleaf) 构建的原生多容器 Docker Compose 部署。环境保留了应用的独立容器和数据库的独立容器。

## Prerequisites
- Docker Engine
- Docker Compose v2
- Target architecture: linux/amd64

## Quick Start

本应用采用**Docker Hub**交付，应用镜像为 `yorem/ruoyi:4.8.3@sha256:09b46ea2f540b71e2353d1a0605a0d493d9764d53f12556c175f49b107cc5369

```bash
# 拉取固定版本镜像
docker compose -f docker/compose.yaml pull
```

然后启动应用：

```bash
docker compose -f docker/compose.yaml up -d
```

## Access & Credentials
- 浏览器入口: `http://<主机IP>:18080` (例如 `http://127.0.0.1:18080`)
- 初始管理员账号: `admin`
- 初始管理员密码: `admin123`
- 角色: admin (系统管理员)

## Service Overview
- **application**: RuoYi 主程序 (Spring Boot 应用)，包含内置的 Tomcat。
- **db**: MySQL 8.0 数据库，存储系统的结构和初始化数据。

## Verification
提供以下脚本用于验证环境是否正常：
- `bash scripts/healthcheck.sh` - 检查容器状态和应用健康状态。
- `bash resources/login.sh` - 使用初始管理员账号通过应用真实接口登录验证。
- `bash resources/register.sh` - 使用应用管理员 API 创建一个普通测试用户。

## State Reset
若需要重置环境并清除数据：
```bash
bash scripts/reset.sh
```
注意：这会删除当前 Compose 项目的容器和网络，并删除相关数据卷（`application-data` 和 `database-data`）。

## Directory Structure
- `manifest.yaml` - 应用的元数据。
- `source/` - 包含 GitHub 仓库链接和固定 commit 哈希。
- `docker/` - 包含 `compose.yaml` 和构建应用所使用的 `Dockerfile`。
- `resources/` - 用户、角色、登录及注册验证脚本，以及初始化所需 SQL。
- `scripts/` - 构建、启动、健康检查、重置和镜像加载脚本。
- `image/` - 本地镜像归档和 checksum 文件。

## Version & Image Source
- **application**: `ruoyi:4.8.3` (基于 eclipse-temurin:17-jre，由源码本地构建)
- **db**: `mysql:8.0.36` (官方镜像，由 docker pull 并保存为归档)

## Differences with Official Compose
官方仓库 `yangzongzhuan/RuoYi` 未提供官方 Docker Compose 文件。本环境从源码使用 Maven 编译构建 Java 应用镜像，并配置 MySQL 数据库镜像，将 `application.yml` 中默认的 `localhost` 数据库连接通过环境变量修改为连接到 `db` 容器。为了自动化测试登录，通过 `SHIRO_USER_CAPTCHAENABLED=false` 禁用了图形验证码。
