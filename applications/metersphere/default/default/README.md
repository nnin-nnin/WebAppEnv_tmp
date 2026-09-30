# MeterSphere default 原生 Docker Compose 环境

本交付物为 **MeterSphere** (版本: `default`) 的原生 Docker Compose 运行环境。

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **宿主机专属分配端口**: `18842`

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

- **Web 控制台地址**: http://127.0.0.1:18842/
- **默认管理员账号**: `admin`
- **默认管理员密码**: `metersphere`
- **认证方式**: RSA 动态公钥加密传输 (POST `/login`，会话凭证 `X-AUTH-TOKEN`)
- **服务架构**: 一体化容器架构，容器内内置并自动化拉起 Spring Boot 核心应用、MariaDB 关系型数据库、Kafka 消息中间件、Redis 缓存以及 MinIO 对象存储服务。

## 4. 服务组成

| 服务名称 | 镜像 | 平台 | 端口映射 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| `metersphere` | `yorem/metersphere:default@sha256:2a15f4360901ec0fd007663396f0749481b27d665e3e23bd313fdbc7d4dbe1a3` | `linux/amd64` | `18842:8081` | MeterSphere 一体化服务 (Spring Boot / MariaDB / Kafka / Redis / MinIO) |

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
