# Homer 24.05.1 原生 Docker Compose 环境

本交付物为 **Homer 24.05.1** 的原生 Docker Compose 应用环境。

> [!NOTE]
> Homer 是一个简洁轻量的静态个人仪表板与服务导航页（Dashboard & Homepage for home server services）。本环境为原生 Docker Compose 部署，启动即可直接使用。

---

## 1. 基本信息

- **应用名称**: homer
- **应用版本**: 24.05.1
- **交付方式**: DOCKERHUB (`yorem/homer:24.05.1`)
- **目标平台**: `linux/amd64`
- **宿主机专属分配端口**: `18674:8080`
- **初始管理员账号**: `admin`
- **初始管理员密码**: `Admin123456!`

---

## 2. 前置条件

- Docker Engine v20.10.0+
- Docker Compose v2.0.0+
- 宿主机专属分配端口 `18674` 可用

---

## 3. 快速启动

使用封装脚本一键启动：

```bash
bash scripts/up.sh
```

或使用标准 Docker Compose 命令：

```bash
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d
```

---

## 4. 访问与凭据

- **Web 访问地址**: [http://localhost:18674](http://localhost:18674)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `Admin123456!`

---

## 5. 服务与镜像

| 服务名称 | 职责说明 | 交付镜像 | 目标平台 |
| :--- | :--- | :--- | :--- |
| **app** | Homer 24.05.1 仪表盘 Web 服务 (lighttpd) | `yorem/homer:24.05.1@sha256:2276ddf032f972887b84992b3c538f14da73b4fc8a811f5c84a5ec957922b78b` | `linux/amd64` |

---

## 6. 健康检查与验证

### 自动健康检查

```bash
bash scripts/healthcheck.sh
```

### 访问连通性校验

```bash
bash resources/login.sh
```

---

## 7. 环境重置

重置环境并清理当前 Compose 项目的容器、网络和数据卷：

```bash
bash scripts/reset.sh
```

或手动执行：

```bash
docker compose -f docker/compose.yaml down -v --remove-orphans
```

---

## 8. 目录结构说明

```text
default/
├── README.md                 # 交付物使用说明
├── manifest.yaml             # 交付元数据清单
├── docker/
│   └── compose.yaml          # Docker Compose 编排文件
├── image/
│   └── image.json            # 镜像与发布元数据
├── resources/
│   ├── login.sh              # 自动化访问校验脚本
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
