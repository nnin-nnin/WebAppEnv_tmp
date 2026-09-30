# Liferay default 原生 Docker Compose 环境

本交付物为 **Liferay** (版本: `default`) 的原生 Docker Compose 运行环境。

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **宿主机端口**: `18838`

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

- **门户首页**: http://127.0.0.1:18838/
- **登录界面**: http://127.0.0.1:18838/c/portal/login
- **REST / JSON-WS API**: http://127.0.0.1:18838/api/jsonws
- **默认超级管理员账号**: `test@liferay.com`
- **默认超级管理员密码**: `test`
- **数据库**: 内嵌 HSQLDB 2.3（免向导冷启动）

## 4. 服务组成

| 服务名称 | 镜像 | 平台 | 端口映射 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| `liferay` | `yorem/liferay:default@sha256:dc8211e1454e1fffc063eebc57aec590ba1e75f33d4af36cbccb3c8797d8edba` | `linux/amd64` | `18838:8080` | Liferay Portal 门户服务 (Tomcat / Java 8) |

## 5. 验证与测试

- **健康检查**:
```bash
./scripts/healthcheck.sh
```

- **登录验证**:
```bash
./resources/login.sh
```

## 6. 环境重置

执行清理重置脚本，停止并清理容器与命名卷：
```bash
./scripts/reset.sh
```
