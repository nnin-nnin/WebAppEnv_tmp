# CouchCMS default 原生 Docker Compose 环境

本产物为 **CouchCMS default** (版本 2.4, commit `6048448`) 的原生多容器 Docker Compose 可复现部署环境。

> [!NOTE]
> 本环境采用原生多容器 topology（非 All-in-One 单容器），Web 应用服务与 MariaDB 数据库服务各自运行在独立的容器中，并通过 Docker Compose 自动创建的桥接网络互联。预置初始数据库与免安装向导配置，容器启动后免向导直接可用。

---

## 1. 前置条件

- **Docker Engine**: v20.10+
- **Docker Compose**: v2.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机开放 `18810` 端口。

---

## 2. 快速启动

### 方式一：Docker Compose 直接启动

```bash
docker compose -f docker/compose.yaml up -d
```

### 方式二：使用运维脚本启动

```bash
bash scripts/up.sh
```

接收者不需要执行源码构建、数据库手工安装、创建 Docker 网络或手动导入 SQL，容器启动后即可直接使用。

---

## 3. 服务访问与初始账号

- **浏览器首页入口**: [http://localhost:18810/](http://localhost:18810/)
- **管理后台入口**: [http://localhost:18810/couch/](http://localhost:18810/couch/)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `AdminPassword123!`
- **初始管理员邮箱**: `admin@example.com`
- **角色级别**: 超级管理员 (`superadmin`, access_level=10)

登录后可直接进入 CouchCMS 管理控制面板与各项内容管理功能。

---

## 4. 拓扑与服务说明

| 服务名称 (Service) | 镜像 (Image) | 平台 (Platform) | 职责说明 | 端口映射 |
| :--- | :--- | :--- | :--- | :--- |
| **`app`** | `yorem/couchcms:default` | `linux/amd64` | CouchCMS 2.4 PHP 8.2 + Apache Web 应用 | `18810:80` |
| **`db`** | `mariadb:10.5` | `linux/amd64` | MariaDB 10.5 关系型数据库 | 内部 `3306` |

- **网络架构**: Compose 自动创建项目私有网络，`app` 容器通过 Compose 服务名 `db` 连接 MariaDB 数据库。
- **持久化**:
  - `application-data`: 挂载 `/var/www/html/couch/uploads` 保存上传资源与附件。
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

---

## 6. 环境重置

```bash
bash scripts/reset.sh
```

`reset.sh` 会停止并移除当前 Compose 项目的容器、网络与数据卷，释放所有占用资源。

---

## 7. 目录结构说明

```text
couchcms/default/default/
├── README.md
├── manifest.yaml                      # 环境完整元数据与配置清单
├── source/
│   └── source.yaml                    # GitHub 源码仓库链接与固定 commit
├── resources/
│   ├── users.yaml                     # 用户账号说明
│   ├── roles.yaml                     # 角色权限与层级说明
│   ├── login.sh                       # 登录验证脚本
│   └── initial-data/
│       └── database-seed.sql          # 数据库初始化种子脚本 (含初始管理员)
├── docker/
│   ├── compose.yaml                   # Docker Compose 生产编排文件
│   ├── Dockerfile                     # 应用镜像构建文件
│   ├── config.php                     # CouchCMS 预置配置文件
│   └── index.php                      # 前台默认首页
└── scripts/
    ├── build.sh                       # 本地镜像构建脚本
    ├── up.sh                          # 启动与健康等待脚本
    ├── healthcheck.sh                 # 完整验收脚本
    └── reset.sh                       # 项目重置脚本
```
