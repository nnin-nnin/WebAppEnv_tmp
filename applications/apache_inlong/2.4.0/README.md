# Apache InLong (2.4.0) 原生 Docker Compose 应用环境

本目录包含 Apache InLong 的原生多容器 Docker Compose 环境。

## 前置条件
- Docker Engine
- Docker Compose v2
- 目标平台: linux/amd64
- 可用的网络以拉取 Docker Hub 镜像

## 启动指南
本环境采用 Docker Hub 拉取镜像的方式部署。进入本目录后执行：
```shell
bash scripts/up.sh
```
或手动执行：
```shell
docker compose -p apache-inlong-2-4-0 -f docker/compose.yaml pull
docker compose -p apache-inlong-2-4-0 -f docker/compose.yaml up -d
```

## 访问与账号
- **浏览器入口**: `http://127.0.0.1:80`；启动前请确保宿主机 80 端口未被占用。
- **管理员账号**: `admin`
- **初始密码**: `inlong`

## 包含的服务
- **manager**: 应用后端服务，处理核心逻辑 (暴露于 8083 端口)。
- **dashboard**: 前端管理界面 (暴露于 80 端口)。
- **dataproxy**: 接收数据代理，对接 Pulsar (暴露于 46801, 46802)。
- **agent**: 数据采集代理。
- **audit**: 数据对账审计系统 (暴露于 10080, 10081)。
- **mysql**: 核心数据库引擎。
- **pulsar**: 消息中间件。
- **jobmanager / taskmanager**: 运行 Flink 任务的处理引擎。
- **logcollector / loki / grafana**: 可选日志组件（目前默认未开启 profile）。

## 验证与测试
提供以下脚本验证环境状态（在根目录下执行）：
```shell
# 检查健康状态和可达性
bash scripts/healthcheck.sh

# 测试登录
bash resources/login.sh

# 测试注册普通用户
bash resources/register.sh
```

## 清理与重置
```shell
bash scripts/reset.sh
```
此命令仅删除当前项目的容器和网络，并清理本地对应的数据卷。

## 文件说明
- `manifest.yaml`: 项目及镜像环境元数据说明。
- `source/`: 包含官方代码的仓库地址和不可变 commit Hash。
- `docker/`: 最终的 `compose.yaml` 配置，无宿主机依赖。
- `resources/`: 包含初始化的数据库 SQL 和各类环境验证与管理脚本。
- `scripts/`: 生命周期运维管理脚本。

## 修改与差异说明
相较于官方 `docker compose.yml`：
1. 更新了 `inlong` 镜像的版本，移除了对 `latest` 或不明确 `${VERSION_TAG}` 环境变量的依赖，固定为 `2.4.0`。
2. 移除了 `mysql` 的固定容器名 `container_name: mysql`，避免与宿主机或其他项目发生冲突。
3. 加入了合理的 `restart: unless-stopped` 策略保障稳定性。
4. 固定了第三方镜像（如 `grafana:11.1.0`，原版为 `latest`）。
5. 指定了所有容器运行的平台为 `linux/amd64` 保障兼容性。
6. Manager 使用 Compose 网络中的 `pulsar:2181`，并在 Manager API 就绪后重启一次
   Dashboard，避免 Nginx 在后端尚未监听时缓存失效上游。
