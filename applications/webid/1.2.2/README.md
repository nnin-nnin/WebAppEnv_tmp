# WeBid 1.2.2 原生多容器 Docker Compose 环境

本项目为 WeBid 1.2.2 提供的原生多容器 Docker Compose 环境。因官方仓库未提供 Docker Compose 配置文件，我们基于官方提供的 PHP 运行要求（PHP 5.6，附带 MySQL 和 GD 扩展），编写了标准的 Dockerfile 并搭建了独立的数据库环境，保留了原生系统的服务边界，非 all-in-one 单容器环境。

## 前置条件
- Docker Engine
- Docker Compose v2
- 目标平台: linux/amd64
- 可连通的外部网络（首次启动需要拉取 Docker Hub 镜像）

## 启动服务
应用镜像已发布到 Docker Hub，并在 Compose 中固定 digest；接收者无需源码或本地构建。

```bash
docker compose -f docker/compose.yaml up -d
```

> **注意：** 首次启动时，应用容器会自动执行安装向导脚本并配置数据库，该过程会在后台执行，需要稍等片刻。

## 服务说明
- **应用服务 (`application`)**：WeBid 主程序（PHP 5.6 + Apache），使用 `yorem/webid:1.2.2@sha256:0c581a9010430311afb6e3c7f6c5e0e8ae705db341bf02ca4c3782d3e0e0d65a 固定镜像。
- **数据库服务 (`db`)**：WeBid 依赖的关系型数据库，运行独立的 MySQL 5.7 容器。
服务间通过 Compose 内置的 DNS 项目网络通信，接收者无需手动创建 Docker 网络。

## 访问和账号
- **应用入口**：http://127.0.0.1:18086/
- **管理后台**：http://127.0.0.1:18086/admin/
- **初始管理员账号**：`admin`
- **初始管理员密码**：`password123`
- **默认用户角色**：管理员权限，可完全管理站点设置、商品与用户。

> API 端口和访问说明：前端界面在 `18086` 暴露，应用内置完整的浏览器管理和展示界面。

## 验证
可以使用 scripts/ 目录下的脚本进行状态验证和操作。
- **环境检查**：`bash scripts/healthcheck.sh`
- **后台登录验证**：`bash resources/login.sh`
- **注册普通用户验证**：`bash resources/register.sh`

## 重置
仅清理本项目对应的容器、网络和命名卷，避免影响其他项目。
```bash
bash scripts/reset.sh
```

## 文件说明
- `manifest.yaml`: 部署环境说明元数据
- `source/`: WeBid 的后端源码 GitHub 固定版本信息
- `docker/`: Dockerfile 与 Compose 配置
- `resources/`: 存放用户账号、角色、模拟登录注册脚本
- `scripts/`: 提供一键式的服务启动、健康检查及重置脚本

## 版本和镜像来源
- `application`: `yorem/webid:1.2.2@sha256:0c581a9010430311afb6e3c7f6c5e0e8ae705db341bf02ca4c3782d3e0e0d65a
- `db`: 使用官方固定标签的 `mysql:5.7` 镜像。

## 官方 Compose 与交付 Compose 的差异
官方仅提供了源码，未提供 Compose 文件或 Dockerfile。本交付 Compose 为 WeBid 补齐了生产运行所需的 PHP 环境、依赖扩展和自动化安装逻辑，通过后台脚本调用原生的 web 安装流程完成初始化，而不需要用户手动执行 SQL 和 Web 向导。
