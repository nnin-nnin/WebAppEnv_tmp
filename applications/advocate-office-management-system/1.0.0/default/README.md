# Advocate Office Management System (1.0.0)

本交付物为 **Advocate Office Management System 1.0.0** 的原生多容器 Docker Compose 可复现运行环境。

> **特别说明**：本环境采用原生多容器 Docker Compose 架构部署，Web 应用服务 (`app`) 和 MySQL 数据库服务 (`db`) 运行于独立的容器中，通过 Docker Compose 网络互相连接通信。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **端口要求**: 宿主机需空闲端口 `18004`

---

## 2. 快速启动

### 从 Docker Hub 拉取镜像并启动

```bash
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d
```

或使用交付脚本启动：

```bash
./scripts/up.sh
```

---

## 3. 访问入口与账号

- **Web 浏览器入口**: [http://localhost:18004/](http://localhost:18004/)
- **登录页面**: [http://localhost:18004/control/login.php](http://localhost:18004/control/login.php)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `benchmark-only`
- **系统角色**: `admin` (系统超级管理员，具备案件管理、客户管理、法律条款管理及系统设置权限)

---

## 4. 服务拓扑说明

| 服务名称 | 角色 | 镜像名称 | 对外端口 | 平台 | 说明 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `app` | 应用服务 | `yorem/advocate-office:1.0.0` | `18004:80` | `linux/amd64` | PHP 8.2 + Apache，运行 Advocate Office 核心 Web 应用 |
| `db` | 数据库服务 | `mysql:8.0.36` | 无 (内部 3306) | `linux/amd64` | MySQL 8.0 数据库，初始数据自动加载 |

---

## 5. 验证与运维命令

### 健康检查

执行自动化健康检查脚本：

```bash
./scripts/healthcheck.sh
```

### 验证登录与注册

测试管理员登录：

```bash
./resources/login.sh
```

测试创建新客户（注册功能）：

```bash
./resources/register.sh "张三" "Male" "1990-01-01" "zhangsan@example.com" "13800138000" "北京市朝阳区"
```

### 重置环境

清理当前 Compose 项目的所有容器、网络和命名卷：

```bash
./scripts/reset.sh
```

---

## 6. 交付文件结构说明

```
.
├── README.md                          # 本文档
├── manifest.yaml                      # 环境元数据清单
├── source/
│   └── source.yaml                    # GitHub 源码仓库及固定 commit 信息
├── resources/
│   ├── users.yaml                     # 初始账号配置说明
│   ├── roles.yaml                     # 角色与权限配置说明
│   ├── login.sh                       # 登录验证脚本
│   ├── register.sh                    # 客户/用户创建脚本
│   └── initial-data/
│       └── database-seed.sql          # 数据库初始化 Seed 脚本
├── docker/
│   ├── compose.yaml                   # 运行配置文件
│   └── Dockerfile                     # 应用镜像 Docker 构建定义
└── scripts/
    ├── build.sh                       # 本地镜像构建脚本
    ├── up.sh                          # 启动及健康等待脚本
    ├── healthcheck.sh                 # 环境健康检查脚本
    └── reset.sh                       # 环境重置清理脚本
```
