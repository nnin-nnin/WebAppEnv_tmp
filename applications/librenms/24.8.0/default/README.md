# LibreNMS 24.8.0 原生 Docker Compose 环境交付说明

本交付物包含 **LibreNMS 24.8.0** 的原生多容器 Docker Compose 部署配置及自动化运维与验证脚本。

---

## 1. 环境架构

本环境采用原生多容器 topology：

- **app**: LibreNMS 网络监控 Web 应用容器（基于 Nginx 与 PHP 8.4），对外暴露端口 `18588:8000`。
- **db**: 独立 MariaDB 数据库容器（`mariadb:10.11`），通过 Compose 内部网络与 Web 应用通信。

---

## 2. 前置条件

- Docker Engine 20.10+
- Docker Compose v2+
- 目标架构：`linux/amd64` (ARM64 主机可通过 Rosetta 2 或 qemu 运行)

---

## 3. 标准启动流程

### 启动多容器环境

```bash
docker compose -f docker/compose.yaml up -d
```

也可以直接使用交付运维脚本启动：

```bash
bash scripts/up.sh
```

---

## 4. 访问入口与默认账号

- **前台首页**: [http://127.0.0.1:18588/](http://127.0.0.1:18588/)
- **登录页面**: [http://127.0.0.1:18588/login](http://127.0.0.1:18588/login)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `AdminPassword123!`
- **管理员邮箱**: `admin@example.com`

---

## 5. 运维与测试脚本

- **启动环境**: `bash scripts/up.sh`
- **健康检查与登录验证**: `bash scripts/healthcheck.sh`
- **管理员登录脚本**: `bash resources/login.sh`
- **环境重置**: `bash scripts/reset.sh`

---

## 6. 文件与目录说明

```text
.
├── README.md                 # 交付环境说明文档
├── manifest.yaml             # 环境元数据与架构定义
├── source/
│   ├── source.yaml           # GitHub 源码仓库与固定 Commit 哈希
│   └── SHA256SUMS            # 源码元数据校验和
├── docker/
│   └── compose.yaml          # 核心 Docker Compose 配置文件
├── resources/
│   ├── users.yaml            # 默认初始账号信息定义
│   ├── roles.yaml            # 角色与权限映射定义
│   └── login.sh              # 登录与端点验证脚本
├── scripts/
│   ├── up.sh                 # Compose 启动与健康等待脚本
│   ├── healthcheck.sh        # 全流程健康检查脚本
│   └── reset.sh              # 容器与卷重置脚本
└── image/
    └── image.json            # 交付镜像元数据清单
```
