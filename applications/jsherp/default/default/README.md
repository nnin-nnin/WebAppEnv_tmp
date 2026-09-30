# jshERP 原生 Docker Compose 环境

本环境为 **jshERP** 的标准化多容器 Docker Compose 可复现评测基准环境。

> [!NOTE]
> 本环境采用原生多容器架构（native_compose），应用服务（jshERP / Spring Boot + Nginx Web 前端）、数据库服务（MariaDB 10.5）以及缓存服务（Redis 7）各自运行在独立的 Docker 容器中，并通过 Docker Compose 自动创建的桥接网络互通。内置初始数据库种子，冷启动直接可用。

---

## 1. 前置条件

- **Docker Engine**: v20.10+
- **Docker Compose**: v2.0+
- **目标平台**: `linux/amd64`
- **宿主机专属分配端口**: `18836`

---

## 2. 快速启动与生命周期

### 启动服务
```bash
bash scripts/up.sh
```

### 服务健康检查
```bash
bash scripts/healthcheck.sh
```

### 账号登录验证
```bash
bash resources/login.sh admin 123456
```

### 清理与重置环境
```bash
bash scripts/reset.sh
```

---

## 3. 服务访问与初始账号

- **前端访问地址**: [http://127.0.0.1:18836/](http://127.0.0.1:18836/)
- **Swagger API 文档**: [http://127.0.0.1:18836/jshERP-boot/doc.html](http://127.0.0.1:18836/jshERP-boot/doc.html)
- **初始系统管理员**: `admin` / `123456`
- **初始业务管理员**: `jsh` / `123456`

---

## 4. 拓扑与服务说明

| 服务名称 | 镜像引用 | 目标架构 | 端口映射 | 职责描述 |
| :--- | :--- | :--- | :--- | :--- |
| **`application`** | `yorem/jsherp:default@sha256:090c20899ae9a8ebe24d444e20a2277dadb3573863a93eb240d680ca5dcf2704` | `linux/amd64` | `18836:3000` | jshERP 核心应用服务与 Nginx Web 前端 |
| **`db`** | `mariadb:10.5@sha256:a530aeeefd82f4fa5150f391b6c75462140904780338766f6b03acecb1cca3ce` | `linux/amd64` | 内部 3306 | MariaDB 10.5 关系型数据库 (预填充 jsh_erp 种子) |
| **`redis`** | `redis:7-alpine@sha256:858f009f9709ce576febc734aa78b8f6d624b82571f9ddb6bda4377c833b3499` | `linux/amd64` | 内部 6379 | Redis 7 缓存与 Session/验证码存取 |

---

## 5. 源码与版本元数据

- **上游仓库**: `https://github.com/jishenghua/jshERP`
- **锁定 Commit**: `d1a0f7d6082b7fbcc7af341f198dd1abf095321b`
- **交付方式**: `DOCKERHUB`
