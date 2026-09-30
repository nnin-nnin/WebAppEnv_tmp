# Metabase 0.50.0 原生 Docker Compose 环境

本交付物为 **Metabase 0.50.0** 的原生 Docker Compose 应用环境。

> [!NOTE]
> 本环境为原生 Compose 部署。应用服务（Metabase Clojure / Jetty）运行在独立的容器中，并挂载专用数据卷保存应用元数据库（`MB_DB_FILE=/metabase-data/metabase.db`），且关闭了匿名追踪（`MB_ANON_TRACKING_ENABLED=false`）。服务启动后可直接访问，并通过内置 API 健康检查端点保障就绪状态。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机需可用端口 `18652`

---

## 2. 快速启动 (Docker Hub 交付方式)

使用已推送到 Docker Hub 锁定的镜像启动：

```bash
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d
```

或者使用封装好的启动脚本：

```bash
./scripts/up.sh
```

---

## 3. 访问与初始账号

- **Web 访问地址**: [http://localhost:18652](http://localhost:18652)
- **健康检查接口**: [http://localhost:18652/api/health](http://localhost:18652/api/health)
- **初始管理员账号**: `admin@example.com`
- **初始管理员密码**: `Admin123456!`
- **预设角色**: `Administrator`

---

## 4. 服务组成

本环境包含以下核心服务：

| 服务名称 | 职责说明 | 镜像 / 基础镜像 | 目标平台 |
| :--- | :--- | :--- | :--- |
| **app** | Metabase 0.50.0 商业智能与数据可视化系统 | `yorem/metabase:0.50.0@sha256:9bb2fc209d2957d8e459e5818ff60dfcd23322c74c18e4da1f591e56b8ea4ca2` | `linux/amd64` |

---

## 5. 环境验证与辅助工具

### 自动健康检查

```bash
./scripts/healthcheck.sh
```

### 账号与接口验证

```bash
./resources/login.sh admin@example.com Admin123456!
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
│   ├── login.sh              # 登录与接口检测脚本
│   ├── roles.yaml            # 角色规范定义
│   └── users.yaml            # 初始凭据规范
├── scripts/
│   ├── healthcheck.sh        # 健康检查脚本
│   ├── reset.sh              # 环境重置清理脚本
│   └── up.sh                 # 启动脚本
├── source/
│   ├── SHA256SUMS            # 源码元数据校验和
│   └── source.yaml           # 上游源码版本元数据
└── verification-report/
    ├── verification-report.json
    └── verification-report.md
```
