# Node-RED 3.1.9

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
- 访问地址: http://127.0.0.1:18693
- 初始管理员账号: `admin`
- 初始管理员密码: `Admin123456!`

## 4. 服务编排
| 服务名 | 镜像 | 平台 | 端口映射 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| **app** | `yorem/nodered:3.1.9@sha256:a649dd711d55490151a2c39a8e48ad0c44325488fbc0e66315f2d2e19e5e1ace` | `linux/amd64` | `18693:1880` | Node-RED 低代码流程编排服务 |

## 5. 健康检查与验证
```bash
bash scripts/healthcheck.sh
```
执行端点可用性与登录验证：
```bash
bash resources/login.sh
```

## 6. 环境重置与清理
```bash
bash scripts/reset.sh
```
该操作将停止容器并销毁关联的数据卷（`nodered-data`）。
