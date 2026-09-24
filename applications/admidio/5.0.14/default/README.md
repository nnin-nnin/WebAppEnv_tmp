# Admidio 5.0.14 原生多容器 Docker Compose 环境

本交付物为 **Admidio 5.0.14** 的原生多容器 Docker Compose 应用环境。

> [!NOTE]
> 本环境为原生多容器 Compose 部署，不是 all-in-one 单容器环境。应用服务（Web/PHP）与数据库服务（MariaDB）分别运行在独立的容器中，并通过 Compose 专有网络通信。接收者无需手动安装数据库、手动创建网络或手动导入 SQL 脚本。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机需可用端口 `18003`

---

## 2. 快速启动 (Docker Hub 交付方式)

使用已拉取/推送至 Docker Hub 的镜像直接启动：

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

- **浏览器访问地址**: [http://localhost:18003](http://localhost:18003)
- **登录页面地址**: [http://localhost:18003/system/login.php](http://localhost:18003/system/login.php)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `benchmark-only`
- **初始角色**: `Administrator`

登录成功后，页面将跳转至 Admidio 管理控制台首页，展现组织管理、用户管理、角色权限与模块设置等核心功能。

---

## 4. 服务组成

本环境保留官方服务边界，包含 2 个核心独立服务：

| 服务名称 | 职责说明 | 镜像 / 基础镜像 | 目标平台 |
| :--- | :--- | :--- | :--- |
| **app** | Admidio 5.0.14 Web 界面与 PHP 业务逻辑 | `yorem/admidio:5.0.14` | `linux/amd64` |
| **db** | MariaDB 10.11 关系型数据库 | `mariadb:10.11.8` | `linux/amd64` |

---

## 5. 环境验证与辅助工具

### 自动健康检查

```bash
./scripts/healthcheck.sh
```

### 账号登录验证

```bash
./resources/login.sh admin benchmark-only
```

### 普通用户注册/创建验证

```bash
./resources/register.sh testuser benchmark-only testuser@example.com Test User
```

---

## 6. 环境重置

重置环境并清理当前 Compose 项目的容器、网络和数据卷：

```bash
./scripts/reset.sh
```

或手动执行：

```bash
docker compose -f docker/compose.yaml down -v
```

---

## 7. 目录结构说明

```text
default/
├── README.md                           # 环境交付与使用说明
├── manifest.yaml                       # 部署清单元数据
├── source/
│   └── source.yaml                     # GitHub 源码仓库与固定 Commit Hash
├── resources/
│   ├── users.yaml                      # 初始账号配置
│   ├── roles.yaml                      # 初始角色配置
│   ├── login.sh                        # 登录验证脚本
│   ├── register.sh                     # 用户注册/创建脚本
│   └── initial-data/
│       └── database-seed.sql           # 数据库 Seed 初始化脚本
├── docker/
│   ├── Dockerfile                      # 应用镜像构建文件
│   └── compose.yaml                    # 运行拓扑 Compose 定义
└── scripts/
    ├── build.sh                        # 本地镜像构建脚本
    ├── up.sh                           # Compose 启动与健康等待脚本
    ├── healthcheck.sh                  # 综合健康检查脚本
    └── reset.sh                        # 环境重置清理脚本
```

---

## 8. 官方部署与交付部署差异说明

1. **多容器拓扑固定**: 结合官方 Dockerfile 构建应用镜像，固定使用 MariaDB 10.11.8 作为独立数据库服务。
2. **自动化 Seed 初始化**: 挂载 `database-seed.sql` 至 MariaDB 的 `/docker-entrypoint-initdb.d/` 目录，实现在空数据卷首次启动时自动建表并配置初始管理员账号 `admin/benchmark-only`，达到开箱即用。
3. **环境完整性验证**: 增加包含 HTTP 访问、状态响应及后台 API 登录校验的自动化测试脚本。
