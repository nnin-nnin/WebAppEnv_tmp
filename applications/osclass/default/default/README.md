# Osclass default 原生 Docker Compose 环境交付说明

本交付物包含 **Osclass default** 的原生多容器 Docker Compose 部署配置及自动化运维与验证脚本。

---

## 1. 环境架构

本环境采用原生多容器 topology（非 All-in-One 单容器）：

- **application**: Osclass Web 应用容器（基于 Apache 与 PHP 7.4），对外暴露端口 `18850`。
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

- **前台首页**: [http://127.0.0.1:18850/](http://127.0.0.1:18850/)
- **后台登录页**: [http://127.0.0.1:18850/oc-admin/index.php](http://127.0.0.1:18850/oc-admin/index.php)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `AdminPassword123!`
- **管理员邮箱**: `admin@example.com`

---

## 5. 运维与测试脚本

- **启动环境**: `bash scripts/up.sh`
- **健康检查与登录验证**: `bash scripts/healthcheck.sh`
- **管理员登录脚本**: `bash resources/login.sh`
- **环境重置与清理**: `bash scripts/reset.sh`

---

## 6. 文件与目录说明

```text
.
├── README.md                 # 交付环境说明文档
├── manifest.yaml             # 环境元数据与架构定义
├── source/
│   ├── source.yaml           # GitHub 源码仓库与固定 Commit 哈希
│   └── SHA256SUMS            # 源码元数据哈希校验清单
├── docker/
│   ├── compose.yaml          # 核心 Docker Compose 配置文件
│   ├── Dockerfile            # Web 应用镜像构建文件
│   ├── config.php            # 免安装向导初始配置文件
│   └── entrypoint.sh         # 容器初始化与就绪等待脚本
├── image/
│   └── image.json            # 交付镜像元数据与 sha256 digest
├── resources/
│   ├── initial-data/
│   │   └── database-seed.sql # 预置初始数据库种子（包含管理员账号与分类）
│   ├── users.yaml            # 默认初始账号信息定义
│   ├── roles.yaml            # 角色与权限映射定义
│   └── login.sh              # CURL 模拟管理员登录测试脚本
├── scripts/
│   ├── build.sh              # 镜像构建脚本
│   ├── up.sh                 # 环境拉起与等待就绪脚本
│   ├── healthcheck.sh        # HTTP 健康检查与登录验证闭环
│   └── reset.sh              # 环境下线与数据清理脚本
└── verification-report/      # 静态与动态测试验证报告
```
