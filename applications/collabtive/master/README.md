# Collabtive master (原生多容器 Docker Compose)

## 简介
这是一个使用原生 Docker Compose 部署的 Collabtive 项目管理工具环境。由于官方没有提供有效的 Docker Compose 环境，本环境采用了定制化的 `php:5.6-apache` 容器与 `mysql:5.7` 数据库容器，以兼容应用的旧版依赖（mysql_query 扩展）。

应用、数据库分别运行在独立容器中，数据通过命名卷持久化。

## 前置条件
- Docker Engine
- Docker Compose v2
- 目标平台 linux/amd64

## 启动服务

本环境采用 `DOCKERHUB` 交付，应用镜像为 `yorem/collabtive:1.2@sha256:9d4e1521e31e7880407f151ae310c8d0c07be257d220b9c2a03f8c871a163e96

```bash
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d
```

## 访问与账号
- 浏览器入口: `http://127.0.0.1:8080/`
- 初始管理员账号: `admin`
- 初始管理员密码: `123456`

## 服务说明
- `application`: 运行 PHP 5.6 和 Apache，提供 Collabtive 前后端服务。
- `db`: 运行 MySQL 5.7 数据库服务，提供存储支持。

## 验证与测试
提供以下脚本验证环境：
- 健康检查：`bash scripts/healthcheck.sh`
- 登录测试：`bash resources/login.sh`
- 注册测试：`bash resources/register.sh newuser 123456`

## 重置
若需要重置环境并清除数据：
```bash
bash scripts/reset.sh
```
此操作只会删除当前项目的容器和命名卷。

## 文件说明
- `manifest.yaml`: 环境元数据信息。
- `source/`: 包含后端源码的版本和仓库信息。
- `docker/`: 包含 Dockerfile 和 Docker Compose 配置文件。
- `resources/`: 包含测试脚本、初始账号信息、初始化 SQL。
- `scripts/`: 包含启停、重置、健康检查等自动化脚本。
- `image/`: 包含最终打包好的镜像归档。

## 差异说明
官方仓库没有提供 Docker Compose。本环境构建了标准的应用+数据库分离拓扑。应用直接连接 Compose 网络中的 `db` 服务，并使用了定制的 `php:5.6-apache` 镜像以支持 `mysql_query`。
