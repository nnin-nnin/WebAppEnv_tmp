# BookStack 24.05 原生多容器 Docker Compose 环境

本交付物为 **BookStack 24.05** 的原生多容器 Docker Compose 应用环境。

> [!NOTE]
> 本环境为原生多容器 Compose 部署，不是 all-in-one 单容器环境。应用服务（BookStack / PHP 8.5 Nginx）与数据库服务（MariaDB 10.5）分别运行在独立的容器中，并通过 Compose 专有网络通信。环境启动后将自动完成数据库表初始化与默认管理员账号预置，开箱即用。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机需可用端口 `18650`

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

- **前台主页地址**: [http://127.0.0.1:18650](http://127.0.0.1:18650)
- **后台登录地址**: [http://127.0.0.1:18650/login](http://127.0.0.1:18650/login)
- **初始管理员账号**: `admin@admin.com`
- **初始管理员密码**: `password`
- **初始角色**: `Administrator`

登录成功后，页面将跳转至 BookStack 控制台首页，可管理书架、书籍、章节、页面、用户与系统设置等。

---

## 4. 服务组成

本环境包含 2 个核心独立服务：

| 服务名称 | 职责说明 | 镜像 / 基础镜像 | 目标平台 |
| :--- | :--- | :--- | :--- |
| **app** | BookStack 24.05 Web 界面与 PHP 业务逻辑 | `yorem/bookstack:24.05@sha256:189c796273469115cf810e53f450e15b93184018e4728cd65fcaef8aa93584bc` | `linux/amd64` |
| **db** | MariaDB 10.5 关系型数据库 | `mariadb:10.5@sha256:a530aeeefd82f4fa5150f391b6c75462140904780338766f6b03acecb1cca3ce` | `linux/amd64` |

---

## 5. 环境验证与辅助工具

### 自动健康检查

```bash
./scripts/healthcheck.sh
```

### 账号登录验证

```bash
./resources/login.sh
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
│   └── compose.yaml          # Docker Compose 编排文件
├── image/
│   └── image.json            # 镜像与发布元数据
├── resources/
│   ├── initial-data/         # 初始化配置文件与种子
│   │   ├── .env              # 预设环境配置
│   │   └── opcache.ini       # PHP 运行参数配置
│   ├── login.sh              # 自动化登录校验脚本
│   ├── roles.yaml            # 角色权限定义
│   └── users.yaml            # 预置用户信息
├── scripts/
│   ├── healthcheck.sh        # 一键健康检查脚本
│   ├── reset.sh              # 一键重置与资源清理脚本
│   └── up.sh                 # 一键启动脚本
├── source/
│   ├── SHA256SUMS            # 源码元数据哈希校验
│   └── source.yaml           # 上游仓库与版本锁定信息
└── verification-report/
    ├── verification-report.json
    └── verification-report.md
```
