# JasperReports default 原生 Docker Compose 环境

本交付物为 **JasperReports** (版本: `default`) 的原生 Docker Compose 运行环境。

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **宿主机端口**: `18832`

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

- **应用首页**: http://127.0.0.1:18832/jasperserver
- **登录页面**: http://127.0.0.1:18832/jasperserver/login.html
- **REST API 端点**: http://127.0.0.1:18832/jasperserver/rest_v2/serverInfo
- **默认管理员账号**: `jasperadmin`
- **默认管理员密码**: `jasperadmin`
- **示例普通账号**: `joeuser` / `joeuser`
- **后端数据库**: MariaDB 10.5 (`bitnami_jasperreports`)

## 4. 服务组成

| 服务名称 | 镜像 | 平台 | 端口映射 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| `jasperreports` | `yorem/jasperreports:default@sha256:77050833114497735c3f94079c98eaa63f7d4399b76843f5247e9682648da657` | `linux/amd64` | `18832:8080` | JasperReports 核心报表服务 (Tomcat 9 / Java 11) |
| `mariadb` | `mariadb:10.5@sha256:a530aeeefd82f4fa5150f391b6c75462140904780338766f6b03acecb1cca3ce` | `linux/amd64` | 无对外端口 | MariaDB 10.5 关系型数据库 |

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
