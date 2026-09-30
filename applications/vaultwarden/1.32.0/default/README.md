# Vaultwarden 1.32.0 原生 Docker Compose 环境

本交付物为 **Vaultwarden 1.32.0** 的原生 Docker Compose 应用环境。

> [!NOTE]
> 本环境为原生 Compose 部署。应用服务（Vaultwarden Rust / Rocket）运行在独立的容器中，并挂载专用数据卷。系统预设允许注册（`SIGNUPS_ALLOWED=true`）并配置有管理面板访问令牌（`ADMIN_TOKEN=Admin123456!`）。启动即可直接使用，无需任何手动初始化操作。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机需可用端口 `18651`

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

- **Web 密码库前端地址**: [http://localhost:18651](http://localhost:18651)
- **管理控制台地址**: [http://localhost:18651/admin](http://localhost:18651/admin)
- **初始管理员账号**: `admin@example.com`
- **初始管理口令 / Admin Token**: `Admin123456!`
- **预设角色**: `Administrator`

访问管理控制台时，输入初始管理口令 `Admin123456!` 即可进入 Vaultwarden 系统管理面板，查看系统状态、配置参数以及管理用户与组织。

---

## 4. 服务组成

本环境包含以下核心服务：

| 服务名称 | 职责说明 | 镜像 / 基础镜像 | 目标平台 |
| :--- | :--- | :--- | :--- |
| **app** | Vaultwarden 1.32.0 后端与 Web Vault 前端 | `yorem/vaultwarden:1.32.0@sha256:c1ac298c3f1803e87d719ac882f01ccb1f0385c403bdb94db3e09e24dcbdfe7d` | `linux/amd64` |

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
