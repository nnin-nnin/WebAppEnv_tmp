# Memos 0.30.0

原生多容器 Docker Compose 环境（注：Memos 官方原生为单容器架构，内置 SQLite，无需依赖独立的外部数据库或缓存容器）。

## 前置条件
- Docker Engine
- Docker Compose v2
- 目标平台：linux/amd64
- 网络要求：正常访问 Docker Hub

## 启动方式

使用 Docker Hub 镜像交付方式启动：

```bash
# 拉取镜像
docker compose -f docker/compose.yaml pull
# 后台启动
docker compose -f docker/compose.yaml up -d
```

## 访问和账号

- **浏览器入口**: `http://127.0.0.1:5230`
- **API 地址**: `http://127.0.0.1:5230/api/v1`
- **初始管理员账号**: admin
- **初始管理员密码**: 123456
- **角色**: `ADMIN`

注意：Memos 的机制是第一次注册的用户会自动成为系统管理员 (ADMIN)。

## 服务说明

Memos 是一个注重隐私的轻量级笔记服务。官方默认采用单进程架构部署，内置 SQLite 数据库支持，无需外部的数据库或 Redis 服务容器。本环境完全遵循并复用官方的单服务 Compose 拓扑。

- `memos`: 核心应用与数据服务，暴露于 `5230` 端口。数据持久化在 `memos-data` 命名卷中。

## 验证

验证所需脚本均在 `scripts/` 与 `resources/` 目录：

```bash
# 健康检查
bash scripts/healthcheck.sh

# 注册初始管理员
bash resources/register.sh

# 登录验证
bash resources/login.sh
```

## 重置

如需彻底清除环境：

```bash
# 停止容器并删除当前项目的网络及数据卷
bash scripts/reset.sh
```

## 文件说明

- `manifest.yaml`：描述交付产物的元信息、组件以及验证方式。
- `source/`：记录对应的上游固定 Commit 信息。
- `docker/`：包含标准的 `compose.yaml` 编排文件。
- `scripts/`：启动、检查与重置运维脚本。
- `resources/`：包含角色、用户信息与用于初始化的 API 脚本。

## 版本和镜像来源

- `memos`: `neosmemo/memos:0.30.0` (Digest: `sha256:71a5b4738d1bed96e92112004054f0888e92791b64eb78afd79077c96e6f9327`)

## 与官方 Compose 的差异

- 从官方的 `image: neosmemo/memos:stable` 修改为固定版本的 `:0.30.0` 标签。
- 移除了 `container_name: memos` 以防止同宿主机多个 Compose 项目产生名称冲突。
- 移除了原生的宿主机挂载 `~/.memos/:/var/opt/memos`，采用标准的命名卷 `memos-data:/var/opt/memos`。
- 明确声明了 `platform: linux/amd64`。
