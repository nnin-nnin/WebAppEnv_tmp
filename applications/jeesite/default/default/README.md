# JeeSite default 原生 Docker Compose 环境

本交付物为 **JeeSite** (版本: `default`) 的原生 Docker Compose 运行环境。

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **宿主机端口**: `18834`

## 2. 快速启动

进入应用目录后执行：
```bash
./scripts/up.sh
```

或使用 Docker Compose 启动：
```bash
docker compose -f docker/compose.yaml up -d
```

## 3. 访问与配置

- **系统首页/登录页**: http://127.0.0.1:18834/
- **管理后台入口**: http://127.0.0.1:18834/a/login
- **默认管理员账号**: `admin`
- **默认管理员密码**: `admin`
- **备选超级管理员**: `system` (密码: `admin`)
- **备选开发者账号**: `thinkgem` (密码: `admin`)
- **后端数据库**: 内置嵌入式 H2 数据库（已预填充全量系统表与测试数据，免安装向导冷启动即用）

## 4. 服务组成

| 服务名称 | 镜像 | 平台 | 端口映射 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| `jeesite` | `yorem/jeesite:default@sha256:fe3bc6aac459af55ead57e757b731f01f6e4cc054632c3252138533d90652419` | `linux/amd64` | `18834:8080` | JeeSite 核心服务 (Spring Boot / OpenJDK 17 + 内置 H2) |

## 5. 验证与测试

- **健康检查**:
```bash
./scripts/healthcheck.sh
```

- **登录与 API 功能验证**:
```bash
./resources/login.sh
```

## 6. 环境重置

执行清理重置脚本，停止并清理容器与命名卷：
```bash
./scripts/reset.sh
```
