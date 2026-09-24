# Snipe-IT v8.7.0 Docker Compose 环境

此环境提供 Snipe-IT v8.7.0 的原生多容器 Docker Compose 部署，包含应用本身、MariaDB 数据库和 Redis 缓存。

## 环境要求
- Docker Engine
- Docker Compose v2
- linux/amd64 架构（如果在 ARM 架构上运行，可能有平台警告）

## Launch Instructions

本环境采用 **Docker Hub** 方式拉取官方和第三方基础镜像。

标准 Compose 项目名为 `snipeit-8-7-0`，请确保宿主机 8000 端口未被占用。

执行启动脚本：
```bash
bash scripts/up.sh
```

`scripts/up.sh` 将自动：
1. 检查 Compose 配置文件有效性。
2. 拉取所需的全部镜像。
3. 启动所有容器（app, db, redis）。
4. 轮询等待所有服务健康状态通过。
5. 自动在数据库中写入初始设置，并创建首个管理员账户，跳过浏览器的交互式安装。

## Access & Credentials

- Web Entrypoint: `http://127.0.0.1:8000`
- Initial Admin Username: `admin`
- Initial Admin Password: `changeme1234`
- Role: Super User

## Service Overview

此环境保留了官方的独立容器拓扑，不是单容器部署。所有服务在 Docker 自动创建的项目专属网络中互相访问。
- **app**: 运行 Snipe-IT 应用本体（Apache/PHP），自动连接 db 和 redis。
- **db**: 运行 MariaDB 11.4.7，挂载命名卷以持久化数据。
- **redis**: 运行 Redis 7.4.0，作为缓存服务。

接收者无需手动创建 Docker 网络、安装数据库，或通过导入 SQL 的方式进行初始化。

## Verification与脚本

- 验证健康状态：`bash scripts/healthcheck.sh` （检查所有服务是否为 healthy，以及入口可用性）
- 登录验证：`bash resources/login.sh` （提取 CSRF Token 并模拟实际登录测试）
- 注册/创建用户：`bash resources/register.sh <username> <email> <password> <first_name> <last_name>` （由于此系统默认不开放前台注册，该脚本调用 Artisan CLI 辅助创建用户）

## State Reset

```bash
bash scripts/reset.sh
```
这将**仅删除**当前 Compose 项目的容器和网络。当前脚本设计同时删除了所有命名卷（数据清空），请在生产使用前修改或按需保留。

## Differences Between Official and Deliverable Compose
1. 将原来分散在 `.env` 里的系统变量汇编进入 `compose.yaml` 中，使部署入口变得单一且明确。
2. 加入了针对每个镜像固定平台标签 `linux/amd64`。
3. 不再使用 `latest`，强制指定所有依赖如 Redis 和 MariaDB 的固定版本 tag。
4. 增强 `scripts/up.sh` 进行全自动化部署，利用 Artisan CLI 和 Tinker 直接向 DB 注入配置和初始管理员，使服务拉起后立即可用，无需经过页面引导。
5. 暴露端口严格绑定到了 127.0.0.1 以确保环境在公共机器上验证时不造成信息安全问题。
