# Roundcube Webmail 1.7.4 原生 Docker Compose 环境

本交付物为 **Roundcube Webmail 1.7.4** 的原生 Docker Compose 运行环境。

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **宿主机端口**: `18562`

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

- **Webmail 访问地址**: http://localhost:18562
- **后端数据库**: SQLite 嵌入式数据库
- **默认邮件服务器配置**:
  - IMAP 主机: `localhost`
  - SMTP 服务器: `localhost`

## 4. 服务组成

| 服务名称 | 镜像 | 平台 | 端口映射 |
| :--- | :--- | :--- | :--- |
| `web` | `yorem/roundcube:1.7.4@sha256:6fe5dc2c00770c11d1fe857f4b6d23fc6c6f4a87b3e3a1b1b76331540af9dadf` | `linux/amd64` | `18562:80` |

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
