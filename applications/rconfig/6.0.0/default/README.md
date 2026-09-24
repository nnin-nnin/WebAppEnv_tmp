# rConfig 6.0.0 原生多容器 Docker Compose 环境

本交付物为 **rConfig 6.0.0** 的原生多容器 Docker Compose 应用环境。

> [!NOTE]
> 本环境为原生多容器 Compose 部署，不是 all-in-one 单容器环境。应用服务（rConfig / PHP 8.4 Apache）与数据库服务（MariaDB 10.5）分别运行在独立的容器中，并通过 Compose 专有网络通信。接收者无需手动执行 Web 安装向导或手动导入 SQL 脚本，启动即可直接使用。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机需可用端口 `18551`

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

- **前台登录地址**: [http://localhost:18551/login](http://localhost:18551/login)
- **控制台地址**: [http://localhost:18551/dashboard](http://localhost:18551/dashboard)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `AdminPassword123!`
- **初始角色**: `Admin`

登录成功后，页面将跳转至 rConfig 控制台首页（Dashboard）。

---

## 4. 服务组成

本环境包含 2 个核心独立服务：

| 服务名称 | 职责说明 | 镜像 / 基础镜像 | 目标平台 |
| :--- | :--- | :--- | :--- |
| **app** | rConfig 6.0.0 Web 界面与 PHP 业务逻辑 | `yorem/rconfig:6.0.0@sha256:99f7f31fd09a3bd247075661da77389e30df4d789b1f5b6ad100f4c0b9153148` | `linux/amd64` |
| **db** | MariaDB 10.5 关系型数据库 | `mariadb:10.5@sha256:c219d932f5c0d67d224bceb609cc3dca6188a1903ac17b2d75cc764f0f50e984` | `linux/amd64` |

---

## 5. 环境验证与辅助工具

### 自动健康检查

```bash
./scripts/healthcheck.sh
```

### 账号登录验证

```bash
./resources/login.sh admin AdminPassword123!
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
│   ├── users.yaml            # 初始用户信息
│   ├── roles.yaml            # 角色与权限映射
│   ├── login.sh              # 登录验证自动化脚本
│   └── initial-data/
│       ├── .env              # 应用运行环境变量
│       ├── database-seed.sql # 数据库初始化种子数据
│       └── supervisord.conf  # Supervisor 进程管理配置
├── scripts/
│   ├── up.sh                 # 环境启动脚本
│   ├── healthcheck.sh        # 环境健康检查脚本
│   └── reset.sh              # 环境重置清理脚本
└── source/
    ├── source.yaml           # 上游源码与版本定位
    └── SHA256SUMS            # 源码元数据校验和
```
