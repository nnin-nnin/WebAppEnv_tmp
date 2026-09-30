# Gotify 2.5.0 原生 Docker Compose 环境

本交付物为 **Gotify 2.5.0** 的原生 Docker Compose 应用环境。

> [!NOTE]
> 本环境为原生 Compose 部署。应用服务（Gotify Go / Gin）运行在独立的容器中，并挂载专用数据卷。系统预设初始管理员账号（`admin`）及密码（`Admin123456!`）。启动即可直接使用，无需任何手动初始化操作。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机需可用端口 `18663`

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

- **Web 前端与 API 地址**: [http://localhost:18663](http://localhost:18663)
- **版本接口**: [http://localhost:18663/version](http://localhost:18663/version)
- **健康检查接口**: [http://localhost:18663/health](http://localhost:18663/health)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `Admin123456!`
- **预设角色**: `Administrator`

访问 Web 控制台时，输入初始管理员账号 `admin` 和密码 `Admin123456!` 即可进入 Gotify 系统管理面板，查看系统状态、管理消息、创建客户端应用（Clients / Applications）以及管理用户权限。

---

## 4. 服务组成

本环境包含以下核心服务：

| 服务名称 | 职责说明 | 镜像 / 基础镜像 | 目标平台 |
| :--- | :--- | :--- | :--- |
| **app** | Gotify 2.5.0 后端与 Web 前端 | `yorem/gotify:2.5.0@sha256:87761c6884bab9169699111bc542c0d29ae785247e2129ac9b3a07e54b686281` | `linux/amd64` |

---

## 5. 环境验证与辅助工具

### 自动健康检查

```bash
./scripts/healthcheck.sh
```

### 账号与接口验证

```bash
./resources/login.sh admin Admin123456!
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
│   ├── login.sh              # 自动化登录校验脚本
│   ├── roles.yaml            # 角色权限定义
│   └── users.yaml            # 预置用户信息
├── scripts/
│   ├── healthcheck.sh        # 一键健康检查脚本
│   ├── reset.sh              # 一键重置与资源清理脚本
│   └── up.sh                 # 一键启动脚本
├── source/
│   ├── SHA256SUMS            # 源码元数据哈希校验
│   └── source.yaml           # 上游仓库与版本锁定信息
└── verification-report/
    ├── verification-report.json
    └── verification-report.md
```
