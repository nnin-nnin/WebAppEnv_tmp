# b2evolution 7.2.5 原生 Docker Compose 环境交付说明

本交付物包含 **b2evolution 7.2.5** 的原生多容器 Docker Compose 部署配置及自动化运维与验证脚本。

---

## 1. 环境架构

本环境采用原生多容器架构：

- **app**: b2evolution Web 应用服务（基于 openSUSE / Nginx / PHP 7.4-FPM），对外暴露宿主机端口 `18587:80`。
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

- **前台首页**: [http://127.0.0.1:18587/](http://127.0.0.1:18587/)
- **管理后台**: [http://127.0.0.1:18587/evoadm.php](http://127.0.0.1:18587/evoadm.php)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `AdminPassword123!`

---

## 5. 运维与测试脚本

- **启动环境**: `bash scripts/up.sh`
- **健康检查**: `bash scripts/healthcheck.sh`
- **登录端点验证**: `bash resources/login.sh`
- **环境重置与清理**: `bash scripts/reset.sh`

---

## 6. 文件与目录说明

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
