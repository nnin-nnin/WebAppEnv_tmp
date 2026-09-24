# b2evolution 7.2.5 Native Docker Compose Environment交付说明

本交付物包含 **b2evolution 7.2.5** 的原生多容器 Docker Compose 部署配置及自动化运维与验证脚本。

## 1. Environment Architecture

本环境采用原生多容器架构：

- **app**: b2evolution Web 应用服务（基于 openSUSE / Nginx / PHP 7.4-FPM），对外暴露宿主机端口 `18587:80`。
- **db**: 独立 MariaDB 数据库容器（`mariadb:10.11`），通过 Compose 内部网络与 Web 应用通信。

## 2. Prerequisites

- Docker Engine 20.10+
- Docker Compose v2+
- Target architecture: `linux/amd64` (ARM64 hosts supported via Rosetta 2 or QEMU)

## 3. Standard Launch Procedure

### Quick Start Multi-Container Topology

```bash
docker compose -f docker/compose.yaml up -d
```

Alternatively, launch using the operational scripts:

```bash
bash scripts/up.sh
```

## 4. Access Endpoints and Default Credentials

- **前台首页**: [http://127.0.0.1:18587/](http://127.0.0.1:18587/)
- **管理后台**: [http://127.0.0.1:18587/evoadm.php](http://127.0.0.1:18587/evoadm.php)
- **Initial Admin Username**: `admin`
- **Initial Admin Password**: `AdminPassword123!`

## 5. Operations & Testing Scripts

- **Start Environment**: `bash scripts/up.sh`
- **Health Check**: `bash scripts/healthcheck.sh`
- **登录端点验证**: `bash resources/login.sh`
- **环境重置与清理**: `bash scripts/reset.sh`

## 6. Directory Structure & Files

```text
applications/b2evolution/7.2.5/default/
├── README.md                                 # 交付使用与部署文档
├── manifest.yaml                             # 环境交付元数据契约定义
├── docker/
│   └── compose.yaml                          # 原生 Docker Compose 服务定义
├── image/
│   └── image.json                            # 交付镜像版本与摘要声明
├── resources/
│   ├── initial-data/
│   │   ├── _basic_config.php                 # b2evolution 核心配置文件
│   │   ├── b2evolution.conf                  # Nginx 站点配置文件
│   │   └── database-seed.sql                 # 初始数据库数据种子
│   ├── login.sh                              # 登录端点连通性测试脚本
│   ├── roles.yaml                            # 预设角色定义
│   └── users.yaml                            # 预设用户凭证定义
├── scripts/
│   ├── healthcheck.sh                        # 自动化服务可用性检查脚本
│   ├── reset.sh                              # 环境彻底清理与重置脚本
│   └── up.sh                                 # 启动服务与就绪等待脚本
├── source/
│   ├── SHA256SUMS                            # 源码元数据哈希校验
│   └── source.yaml                           # 上游代码仓库与版本信息
└── verification-report/
    ├── verification-report.json              # 自动化验证报告 (JSON)
    └── verification-report.md                # 自动化验证报告 (Markdown)
```
