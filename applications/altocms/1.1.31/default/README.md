# AltoCMS 1.1.31 原生 Docker Compose 环境

本产物为 **AltoCMS 1.1.31** 的原生多容器 Docker Compose 可复现部署环境。

> [!NOTE]
> 本环境采用原生多容器 topology（非 All-in-One 单容器），应用服务与数据库服务各自运行在独立的 Docker 容器中，并通过 Docker Compose 自动创建的私有网络互相通信。

---

## 1. 前置条件

- **Docker Engine**: v20.10+
- **Docker Compose**: v2.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机可访问 Docker Hub 拉取镜像，宿主机开放 `18007` 端口。

---

## 2. 快速启动

### 方式一：Docker Hub 方式（推荐）

```bash
# 1. 拉取固定版本镜像
docker compose -f docker/compose.yaml pull

# 2. 启动环境
docker compose -f docker/compose.yaml up -d
```

### 方式二：使用运维脚本启动

```bash
bash scripts/up.sh
```

接收者不需要执行源码构建、数据库手工安装、创建 Docker 网络或手动导入 SQL，容器启动后即可直接使用。

---

## 3. 服务访问与初始账号

- **浏览器入口**: [http://localhost:18007/](http://localhost:18007/)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `benchmark-only`
- **初始管理员邮箱**: `admin@example.com`
- **角色类型**: 系统管理员 (administrator, user_role=3)

登录后可直接进入 AltoCMS 管理后台及全功能社区主页。

---

## 4. 拓扑与服务说明

| 服务名称 (Service) | 镜像 (Image) | 平台 (Platform) | 职责说明 | 端口映射 |
| :--- | :--- | :--- | :--- | :--- |
| **`app`** | `yorem/altocms:1.1.31` | `linux/amd64` | AltoCMS 1.1.31 PHP 7.4 + Apache Web 应用 | `18007:80` |
| **`db`** | `mariadb:10.6` | `linux/amd64` | MariaDB 10.6 关系型数据库 | 仅内部 `3306` |

- **网络架构**: Compose 自动创建项目私有网络，`app` 容器通过 Compose 服务名 `db` 连接 MariaDB 数据库。
- **持久化**:
  - `application-data`: 挂载 `/var/www/html/uploads` 保存上传资源。
  - `database-data`: 挂载 `/var/lib/mysql` 保存数据库数据。

---

## 5. 验收与验证

### 5.1 环境健康检查

```bash
bash scripts/healthcheck.sh
```

### 5.2 登录验证

```bash
bash resources/login.sh
```

### 5.3 用户注册与创建验证

```bash
bash resources/register.sh testuser benchmark-only testuser@example.com
```

---

## 6. 环境重置

```bash
bash scripts/reset.sh
```

`reset.sh` 只清理当前 Compose 项目的容器、网络与命名卷，不会删除镜像或干扰宿主机其他容器。

---

## 7. 目录结构说明

```text
altocms_1.1.31/
├── README.md
├── manifest.yaml                      # 环境完整元数据与配置
├── source/
│   └── source.yaml                    # GitHub 源码仓库链接与固定 commit
├── resources/
│   ├── users.yaml                     # 用户账号说明
│   ├── roles.yaml                     # 角色权限说明
│   ├── login.sh                       # 登录验证脚本
│   ├── register.sh                    # 用户注册验证脚本
│   └── initial-data/
│       └── database-seed.sql          # 数据库初始化 Seed 脚本
├── docker/
│   ├── compose.yaml                   # 运行 Docker Compose 配置
│   └── Dockerfile                     # 应用镜像构建文件
└── scripts/
    ├── build.sh                       # 本地镜像构建脚本
    ├── up.sh                          # 启动与健康等待脚本
    ├── healthcheck.sh                 # 完整验收脚本
    └── reset.sh                       # 项目重置脚本
```

---

## 8. 官方 Compose 与交付 Compose 的差异

1. **补全 Compose 配置**: 官方仓库未包含 Dockerfile 与 Docker Compose 文件，本交付物定义了标准的 `app` + `db` 多容器 native topology。
2. **零手动初始化**: 预置 `database-seed.sql`，在数据库数据卷首次创建时自动完成数据库 Schema 建立与管理员账号配置。
3. **固定平台与版本**: 镜像统一标注为 `linux/amd64` 平台，并固定 `1.1.31` 版本 tag，消除浮动 tag 风险。
