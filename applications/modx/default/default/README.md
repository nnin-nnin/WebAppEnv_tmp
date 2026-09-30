# MODX Revolution (default) 原生 Docker Compose 环境交付说明

本交付物包含 **MODX Revolution (default)** 的原生多容器 Docker Compose 部署配置及自动化运维与验证脚本。

---

## 1. 环境架构

本环境采用原生多容器 topology（非 All-in-One 单容器）：

- **app**: MODX Revolution Web 应用容器（基于 Apache 与 PHP 7.4），对外暴露专属端口 `18844`。
- **db**: 独立 MariaDB 数据库容器（`mariadb:10.5`），通过 Compose 内部网络与 Web 应用通信。

镜像与配置针对安全评测进行了优化：
- 预置初始数据库种子与免安装向导配置，实现冷启动零配置即用。
- 禁用 PHP OPcache (`opcache.enable=0`)，彻底规避 macOS ARM64 / Rosetta 模拟执行下的潜在段错误。

---

## 2. 前置条件

- Docker Engine 20.10+
- Docker Compose v2+
- 目标架构：`linux/amd64` (ARM64 主机可通过 Rosetta 2 或 qemu 运行)

---

## 3. 标准启动流程

### 从 Docker Hub 拉取并启动

```bash
# 1. 启动多容器环境
docker compose -f docker/compose.yaml up -d
```

也可以直接使用交付运维脚本启动并等待就绪：

```bash
bash scripts/up.sh
```

---

## 4. 访问入口与默认账号

- **前台首页**: [http://127.0.0.1:18844/](http://127.0.0.1:18844/)
- **管理后台**: [http://127.0.0.1:18844/manager/](http://127.0.0.1:18844/manager/)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `AdminPassword123!`
- **管理员邮箱**: `admin@example.com`

---

## 5. 运维与测试脚本

- **构建本地镜像**: `bash scripts/build.sh`
- **启动环境**: `bash scripts/up.sh`
- **健康检查与登录验证**: `bash scripts/healthcheck.sh`
- **管理员登录脚本**: `bash resources/login.sh`
- **环境重置与清理**: `bash scripts/reset.sh`

---

## 6. 文件与目录说明

```text
.
├── README.md                      # 交付环境说明文档
├── manifest.yaml                  # 环境元数据与架构定义清单
├── source/
│   ├── source.yaml                # GitHub 源码仓库与固定 Commit 哈希
│   └── SHA256SUMS                 # 源码元数据 SHA256 校验和
├── docker/
│   ├── compose.yaml               # 核心 Docker Compose 配置文件
│   ├── Dockerfile                 # Web 应用镜像构建文件
│   ├── config.inc.php             # 核心运行时配置文件
│   └── entrypoint.sh              # 容器入口与权限配置脚本
├── resources/
│   ├── users.yaml                 # 默认初始账号信息定义
│   ├── roles.yaml                 # 角色与权限映射定义
│   ├── login.sh                   # 管理员登录鉴权测试脚本
│   └── database-seed.sql          # 预置初始数据库种子
├── scripts/
│   ├── build.sh                   # 本地镜像构建脚本
│   ├── up.sh                      # Compose 启动与健康等待脚本
│   ├── healthcheck.sh             # 全流程健康检查脚本
│   └── reset.sh                   # 容器与卷重置脚本
├── image/
│   └── image.json                 # 交付镜像元数据清单
└── verification-report/
    ├── verification-report.json   # 验证报告 (JSON)
    └── verification-report.md     # 验证报告 (Markdown)
```

---

## 7. 差异与变动说明

1. **多容器健康联动**: 使用 `depends_on: db: condition: service_healthy`，应用等待 MariaDB 完全准备就绪后再初始化并提供服务。
2. **自动化零配置启动**: 预设 `resources/database-seed.sql` 结构与管理员凭据，以及 `docker/config.inc.php`，免除浏览器手动安装步骤。
3. **架构与兼容性保障**: 镜像使用 `linux/amd64` 平台，并在 PHP 配置中关闭 OPcache (`opcache.enable=0`)，保障跨平台（包括 Apple Silicon macOS）环境下的绝对稳定性。
