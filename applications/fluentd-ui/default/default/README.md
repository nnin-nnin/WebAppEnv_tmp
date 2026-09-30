# Fluentd UI default

原生 Docker Compose 应用运行环境。

## 1. 前置条件
- Docker Engine 20.10+
- Docker Compose v2+
- 网络访问 Docker Hub
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
- 访问地址: http://127.0.0.1:18826
- 初始管理员账号: `admin`
- 初始管理员密码: `AdminPassword123!`

## 4. 服务编排
| 服务名 | 镜像 | 平台 | 端口映射 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| **app** | `yorem/fluentd-ui:default@sha256:2ae6a94acb86fa642162421bd7cf28a8e96a42f7cad3830f025c2544130fd959` | `linux/amd64` | `18826:9292` | Fluentd Web UI 与日志采集守护进程控制台 |

## 5. 健康检查与验证
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
该操作将停止容器并销毁关联的数据卷（`fluentd-data`）。
