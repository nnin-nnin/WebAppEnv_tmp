# mall-swarm default 原生 Docker Compose 环境

本交付物为 **mall-swarm default** 的原生 Docker Compose 应用环境。

> [!NOTE]
> 本环境为原生 Docker Compose 部署，包含 mall-swarm 核心管理服务（基于 Spring Boot 3 + Sa-Token，原生支持全量电商管理后台与 REST API）、MySQL 8.0 关系型数据库以及 Redis 缓存服务。环境内置完整业务初始化数据种子（`mall.sql`），启动即可直接进入生产就绪状态，无需任何手动初始化操作。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机需可用专属分配端口 `18840`

---

## 2. 快速启动 (Docker Hub 交付方式)

使用已推送到 Docker Hub 锁定的镜像启动：

```bash
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d
```

或者使用封装好的生命周期脚本：

```bash
./scripts/up.sh
```

---

## 3. 访问与初始账号

- **Web / API 访问地址**: [http://localhost:18840](http://localhost:18840)
- **Swagger API 文档**: [http://localhost:18840/swagger-ui.html](http://localhost:18840/swagger-ui.html)
- **Druid 数据源监控控制台**: [http://localhost:18840/druid/login.html](http://localhost:18840/druid/login.html)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `macro123`
- **Druid 监控账号/密码**: `druid` / `druid`
- **预设角色**: `超级管理员` (Administrator)

---

## 4. 服务组成

本环境包含以下核心服务：

| 服务名称 | 职责说明 | 镜像 / 基础镜像 | 目标平台 |
| :--- | :--- | :--- | :--- |
| **application** | mall-swarm 电商后台核心微服务应用 | `yorem/mall-swarm:default@sha256:c7431e2c0035800b55d8d00e30107fc183612894239e843c38f19c268dd127ff` | `linux/amd64` |
| **db** | MySQL 8.0 关系型数据库（预置初始业务库表结构与测试数据） | `mysql:8.0@sha256:7dcddc01f13bab2f15cde676d44d01f61fc9f99fe7785e86196dfc07d358ae2b` | `linux/amd64` |
| **redis** | Redis 7 缓存与 Sa-Token 分布式会话存储 | `redis:7-alpine@sha256:858f009f9709ce576febc734aa78b8f6d624b82571f9ddb6bda4377c833b3499` | `linux/amd64` |

---

## 5. 环境验证与辅助工具

### 自动健康检查

```bash
./scripts/healthcheck.sh
```

### 账号与可用性多阶验证

```bash
./resources/login.sh admin macro123
```

---

## 6. 环境重置

重置环境并清理当前 Compose 项目的容器、网络和数据卷：

```bash
./scripts/reset.sh
```

或手动执行：

```bash
docker compose -f docker/compose.yaml down -v --remove-orphans
```

---

## 7. 目录结构说明

```text
default/
├── README.md                 # 交付物使用说明
├── manifest.yaml             # 交付元数据清单
├── docker/
│   └── compose.yaml          # Docker Compose 编排文件
├── image/
│   └── image.json            # 镜像与发布元数据
├── resources/
│   ├── init.sql              # 数据库种子与结构初始脚本
│   ├── login.sh              # 自动化登录校验脚本
│   ├── roles.yaml            # 角色权限定义
│   └── users.yaml            # 预置用户信息
├── scripts/
│   ├── healthcheck.sh        # 一键启动并健康等待脚本
│   ├── reset.sh              # 一键重置与资源清理脚本
│   └── up.sh                 # 一键启动脚本
├── source/
│   ├── SHA256SUMS            # 源码元数据哈希校验
│   └── source.yaml           # 上游仓库与版本锁定信息
└── verification-report/
    ├── verification-report.json
    └── verification-report.md
```
