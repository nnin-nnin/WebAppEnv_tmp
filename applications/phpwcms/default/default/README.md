# phpwcms default 原生 Docker Compose 环境

本产物为 **phpwcms default** 的原生多容器 Docker Compose 可复现部署环境，符合学术安全评测标准。

> [!NOTE]
> 本环境采用原生多容器拓扑（非 All-in-One 单容器），应用服务与数据库服务各自运行在独立的 Docker 容器中，并通过 Docker Compose 自动创建的私有网络互相通信。

---

## 1. 前置条件

- **Docker Engine**: v20.10+
- **Docker Compose**: v2.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机可访问 Docker Hub 拉取镜像，宿主机分配端口 `18855`。

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

接收者不需要执行源码构建、数据库手工安装、创建 Docker 网络或手动导入 SQL，容器冷启动完成后直接可用。

---

## 3. 服务访问与初始账号

- **前台入口**: [http://localhost:18855/](http://localhost:18855/)
- **后台登录入口**: [http://localhost:18855/login.php](http://localhost:18855/login.php)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `AdminPassword123!`
- **角色类型**: 系统管理员 (Administrator, usr_admin=1, usr_fe=2)

---

## 4. 拓扑与服务说明

| 服务名称 (Service) | 镜像 (Image) | 平台 (Platform) | 职责说明 | 端口映射 |
| :--- | :--- | :--- | :--- | :--- |
| **`app`** | `yorem/phpwcms:default` | `linux/amd64` | phpwcms PHP 8.2 + Apache Web 应用与运行环境 | `18855:80` |
| **`db`** | `mariadb:10.5` | `linux/amd64` | MariaDB 10.5 关系型数据库 | 仅内部 `3306` |

- **网络架构**: Compose 自动创建私有网络，`app` 容器通过服务名 `db:3306` 与 MariaDB 进行通信。
- **持久化存储**:
  - `application-data`: 对应 `/var/www/html/filearchive` 文件存储。
  - `application-content`: 对应 `/var/www/html/content` 媒体与内容数据。
  - `application-upload`: 对应 `/var/www/html/upload` 上传目录。
  - `database-data`: 对应 `/var/lib/mysql` 数据库持久化目录。

---

## 5. 运维与验证脚本

- **启动并等待就绪**: `bash scripts/up.sh`
- **健康状态检查与登录验证**: `bash scripts/healthcheck.sh`
- **管理员登录脚本**: `bash resources/login.sh admin AdminPassword123!`
- **环境重置与清理**: `bash scripts/reset.sh`
