# JeecgBoot default 原生 Docker Compose 环境

本交付物为 **JeecgBoot** (版本: `default`) 的原生 Docker Compose 运行环境。

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **宿主机端口**: `18833`

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

- **应用接口文档 (Knife4j)**: http://127.0.0.1:18833/jeecg-boot/doc.html
- **Druid 数据源监控后台**: http://127.0.0.1:18833/jeecg-boot/druid/login.html
- **默认管理员账号**: `admin`
- **默认管理员密码**: `123456`
- **后端数据库**: MySQL 8.0 (`jeecg-boot`)
- **缓存服务**: Redis 7

## 4. 服务组成

| 服务名称 | 镜像 | 平台 | 端口映射 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| `jeecgboot` | `yorem/jeecgboot:default@sha256:87c41f054c48c9dced282062b0175fb5bbfcf5020884e376d205591a5c4c4860` | `linux/amd64` | `18833:8080` | JeecgBoot 核心服务 (Spring Boot 2.7 / Java 8) |
| `db` | `mysql:8.0@sha256:7dcddc01f13bab2f15cde676d44d01f61fc9f99fe7785e86196dfc07d358ae2b` | `linux/amd64` | 无对外端口 | MySQL 8.0 关系型数据库 |
| `redis` | `redis:7-alpine@sha256:858f009f9709ce576febc734aa78b8f6d624b82571f9ddb6bda4377c833b3499` | `linux/amd64` | 无对外端口 | Redis 7 缓存服务 |

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
