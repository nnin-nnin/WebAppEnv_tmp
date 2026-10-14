# NewBee Mall 1.0.0 原生 Docker Compose 环境

本交付物为 **NewBee Mall 1.0.0** 的原生 Docker Compose 运行环境。

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **宿主机端口**: `18586`

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

- **商城首页访问地址**: http://localhost:18586
- **后台管理系统地址**: http://localhost:18586/admin/login
- **默认管理员账号**: `admin`
- **默认管理员密码**: `123456`
- **后端数据库**: MySQL 8.0.35 (`newbee_mall_db`)

## 4. 服务组成

| 服务名称 | 镜像 | 平台 | 端口映射 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| `application` | `yorem/newbee-mall:1.0.0@sha256:ad016fb1454bb256b6508f6f1b74ff773014e75fbcc9e6a3c0a644abf0f21dff` | `linux/amd64` | `18586:28080` | Spring Boot 商城服务 |
| `db` | `mysql:8.0.35@sha256:9095b039775474d4a652430c1bab0db55d48d7d1885278566152927e4844e84b` | `linux/amd64` | 无对外端口 | MySQL 数据库 |

## 5. 验证与测试

- **健康检查**:
```bash
./scripts/healthcheck.sh
```

- **登录接口与界面测试**:
```bash
./resources/login.sh
```

## 6. 环境重置

执行清理重置脚本，停止并清理容器与卷：
```bash
./scripts/reset.sh
```
