# The Lounge 4.4.3

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
- 访问地址: http://127.0.0.1:18672
- 初始管理员账号: `admin`
- 初始管理员密码: `Admin123456!`

## 4. 服务编排
| 服务名 | 镜像 | 平台 | 端口映射 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| **app** | `yorem/thelounge:4.4.3@sha256:54e87285a8a6203e1cc4a3a854227f100180f33a1b5fa42933b4ed6ab4d07d38` | `linux/amd64` | `18672:9000` | The Lounge 现代 Web IRC 客户端服务 |

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
该操作将停止容器并销毁关联的数据卷（`thelounge-data`）。
