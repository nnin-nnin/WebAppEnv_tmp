# ResourceSpace default 原生多容器 Docker Compose 环境

本交付物为 **ResourceSpace default** 的原生多容器 Docker Compose 生产就绪型应用环境。

> [!NOTE]
> 本环境为原生多容器 Compose 部署，不是 all-in-one 单容器环境。应用服务（Web/PHP 8.2 Apache）与数据库服务（MariaDB 10.5）分别运行在独立的容器中，并通过 Compose 专有网络通信。接收者无需手动安装数据库、手动创建网络或手动执行网页安装向导。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机需可用端口 `18863`

---

## 2. 快速启动 (Docker Hub 交付方式)

使用已发布至 Docker Hub 的镜像直接启动：

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

- **浏览器访问地址**: [http://localhost:18863](http://localhost:18863)
- **登录页面地址**: [http://localhost:18863/login.php](http://localhost:18863/login.php)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `AdminPassword123!`
- **初始角色**: `Super Admin`

登录成功后，页面将跳转至 ResourceSpace 数字资产管理控制台首页，展现资源搜索、集合管理、元数据字段配置与系统管理后台。

---

## 4. 服务组成

本环境保留官方服务边界，包含 2 个核心独立服务：

| 服务名称 | 职责说明 | 镜像 / 基础镜像 | 目标平台 |
| :--- | :--- | :--- | :--- |
| **app** | ResourceSpace Web 界面与 PHP 8.2 业务运行时 | `yorem/resourcespace:default` | `linux/amd64` |
| **db** | MariaDB 10.5 关系型数据库 | `mariadb:10.5` | `linux/amd64` |

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
├── README.md                           # 环境交付与使用说明
├── manifest.yaml                       # 部署清单元数据
├── source/
│   ├── source.yaml                     # GitHub 源码仓库与固定 Commit Hash
│   └── SHA256SUMS                      # 源码元数据校验和
├── resources/
│   ├── users.yaml                      # 初始账号配置
│   ├── roles.yaml                      # 初始角色配置
│   ├── login.sh                        # 登录验证脚本
│   └── initial-data/
│       └── database-seed.sql           # 数据库 Seed 初始化脚本
├── docker/
│   ├── Dockerfile                      # 应用镜像构建定义
│   ├── config.php                      # 预置本地配置
│   └── compose.yaml                    # 运行拓扑 Compose 定义
├── image/
│   └── image.json                      # 交付镜像元数据清单
└── scripts/
    ├── build.sh                        # 本地镜像构建脚本
    ├── up.sh                           # Compose 启动与健康等待脚本
    ├── healthcheck.sh                  # 综合健康检查脚本
    └── reset.sh                        # 环境重置清理脚本
```

---

## 8. 官方部署与交付部署差异说明

1. **容器化解耦拓扑**: 采用 PHP 8.2 Apache 官方镜像构建应用镜像，使用 MariaDB 10.5 作为独立数据库服务，通过 Docker Compose 专有网络连接。
2. **自动化 Seed 初始化与免向导**: 预置 `include/config.php`，挂载 `database-seed.sql` 至 MariaDB 的 `/docker-entrypoint-initdb.d/` 目录，实现在首次冷启动时自动建表并写入初始管理员账号 `admin/AdminPassword123!`，完全免除人工向导配置。
3. **架构兼容优化**: 明确禁用 opcache 以规避 macOS ARM64 模拟运行环境下的潜在崩溃问题，并内置完整依赖工具链（ImageMagick、FFmpeg、Ghostscript、ExifTool）。
4. **自动化测试与验证闭环**: 增加完整的服务健康探针与后台 API / Web 登录自动校验脚本。
