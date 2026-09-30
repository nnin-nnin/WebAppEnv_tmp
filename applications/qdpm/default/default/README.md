# qdPM default (9.3) 原生 Docker Compose 环境交付说明

本交付物包含 **qdPM default (9.3)** 的原生多容器 Docker Compose 部署配置及自动化运维与验证脚本。

---

## 1. 环境架构

本环境采用原生多容器 topology（非 All-in-One 单容器）：

- **application**: qdPM Web 应用容器（基于 Apache 与 PHP 7.4），对外暴露端口 `18862`。
- **db**: 独立 MariaDB 数据库容器（`mariadb:10.5`），通过 Compose 内部网络与 Web 应用通信。

---

## 2. 前置条件

- Docker Engine 20.10+
- Docker Compose v2+
- 目标架构：`linux/amd64` (ARM64 主机可通过 Rosetta 2 或 qemu 运行)

---

## 3. 标准启动流程

### 从 Docker Hub 拉取并启动

```bash
# 1. 拉取固定版本镜像
docker compose -f docker/compose.yaml pull

# 2. 启动多容器环境
docker compose -f docker/compose.yaml up -d
```

也可以直接使用交付运维脚本启动：

```bash
bash scripts/up.sh
```

---

## 4. 访问入口与默认账号

- **前台首页**: [http://127.0.0.1:18862/](http://127.0.0.1:18862/)
- **后台登录页**: [http://127.0.0.1:18862/index.php/login](http://127.0.0.1:18862/index.php/login)
- **初始管理员账号**: `admin@localhost.com`
- **初始管理员密码**: `AdminPassword123!`
- **管理员备用登录账号**: `admin` / `AdminPassword123!`

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
│   ├── compose.yaml          # 核心 Docker Compose 配置文件
│   ├── Dockerfile            # Web 应用镜像构建文件
│   ├── databases.yml         # 数据库连接预置配置
│   └── entrypoint.sh         # 容器初始化与自动配置入口脚本
├── resources/
│   ├── initial-data/
│   │   └── init.sql          # 数据库初始化种子脚本
│   ├── users.yaml            # 默认初始账号信息定义
│   ├── roles.yaml            # 角色与权限映射定义
│   └── login.sh              # 模拟管理员登录测试脚本
├── scripts/
│   ├── build.sh              # 镜像构建脚本
│   ├── up.sh                 # Compose 启动与健康等待脚本
│   ├── healthcheck.sh        # 全流程健康检查脚本
│   └── reset.sh              # 容器与卷重置脚本
└── image/
    └── image.json            # 交付镜像元数据清单
```

---

## 7. 差异与变动说明

1. **多容器健康联动**: 使用 `depends_on: db: condition: service_healthy`，应用等待 MariaDB 完全准备就绪后再初始化并提供服务。
2. **自动化无人值守初始化**: 预先准备标准数据库 schema、管理员配置与种子账号（`resources/initial-data/init.sql`），挂载于 `/docker-entrypoint-initdb.d/init.sql`，冷启动立即可用，免除网页交互向导。
3. **密码哈希与权限配置**: 写入符合官方 `phpass` 哈希的初始管理员账号 `admin@localhost.com` 及别名 `admin`（密码均为 `AdminPassword123!`），赋予系统完全管理员权限。
