# Trilium Notes 0.63.7

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
- 访问地址: http://127.0.0.1:18660
- API 健康检查: http://127.0.0.1:18660/api/health-check
- 初始管理员账号: `admin`
- 初始管理员密码: `Admin123456!`

## 4. 服务编排
| 服务名 | 镜像 | 平台 | 端口映射 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| **app** | `yorem/trilium:0.63.7@sha256:1caf19d6a0d57f8a5065a9e6ff38bb9e626460e886eebd583d299dd727083d75` | `linux/amd64` | `18660:8080` | Trilium 笔记服务与 Web UI |

## 5. 健康检查与验证
```bash
bash scripts/healthcheck.sh
```
执行用户认证校验：
```bash
bash resources/login.sh
```

## 6. 环境重置与清理
```bash
bash scripts/reset.sh
```
该操作将停止容器并销毁关联的数据卷（`trilium-data`）。
