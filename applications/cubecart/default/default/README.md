# CubeCart default 原生多容器 Docker Compose 环境

本交付物为 **CubeCart default** 的原生多容器 Docker Compose 应用环境。

> [!NOTE]
> 本环境为原生多容器 Compose 部署。应用服务（CubeCart / PHP 8.2 Apache）与数据库服务（MariaDB 10.5）分别运行在独立的容器中，并通过 Compose 专有网络通信。接收者无需手动执行 Web 安装向导或手动导入 SQL 脚本，启动即可直接使用。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机需可用端口 `18812`

---

## 2. 快速启动 (Docker Hub 交付方式)

使用已推送到 Docker Hub 锁定的镜像启动：

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

- **前台商城主页**: [http://localhost:18812](http://localhost:18812)
- **后台管理控制台**: [http://localhost:18812/admin.php](http://localhost:18812/admin.php)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `AdminPassword123!`
- **初始角色**: `superadmin`

登录成功后，页面将允许访问 CubeCart 管理控制台（[http://localhost:18812/admin.php](http://localhost:18812/admin.php)），可管理商品、分类、订单、客户、促销与系统设置等。

---

## 4. 服务组成

本环境包含 2 个核心独立服务：

| 服务名称 | 职责说明 | 镜像 / 基础镜像 | 目标平台 |
| :--- | :--- | :--- | :--- |
| **app** | CubeCart Web 商城界面与 PHP 业务逻辑 | `yorem/cubecart:default@sha256:18268962fdf963163921f7dbbae92916a30d408d336e5a038ec92422d82beaee` | `linux/amd64` |
| **db** | MariaDB 10.5 关系型数据库 | `mariadb:10.5@sha256:a530aeeefd82f4fa5150f391b6c75462140904780338766f6b03acecb1cca3ce` | `linux/amd64` |

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
├── README.md                 # 交付物使用说明
├── manifest.yaml             # 交付元数据清单
├── docker/
│   ├── Dockerfile            # 应用镜像构建文件
│   ├── compose.yaml          # Docker Compose 编排文件
│   ├── global.inc.php        # 预设环境配置
│   ├── htaccess              # Apache 重写规则
│   └── ssl-custom.inc.php    # HTTP 端口免强制 SSL 配置
├── image/
│   └── image.json            # 镜像与发布元数据
├── resources/
│   ├── initial-data/         # 初始化种子数据
│   │   └── database-seed.sql # 预置数据库表结构与种子数据
│   ├── login.sh              # 自动化登录校验脚本
│   ├── roles.yaml            # 角色权限定义
│   └── users.yaml            # 预置用户信息
├── scripts/
│   ├── build.sh              # 镜像构建脚本
│   ├── healthcheck.sh        # 一键健康检查脚本
│   ├── reset.sh              # 一键重置与资源清理脚本
│   └── up.sh                 # 一键启动脚本
└── source/
    └── source.yaml           # 上游仓库与版本锁定信息
```
