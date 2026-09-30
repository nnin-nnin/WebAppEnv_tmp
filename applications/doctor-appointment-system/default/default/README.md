# Doctor Appointment System (default)

本交付物为 **Doctor Appointment System (default)** 的原生多容器 Docker Compose 可复现运行环境。

> **架构说明**：本环境采用原生多容器 Docker Compose 架构部署，Web 应用服务 (`app`) 和 MariaDB 数据库服务 (`db`) 运行于独立的容器中，通过 Docker Compose 网络互相连接通信，数据库预置免安装种子数据，冷启动即可直接使用。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **端口要求**: 宿主机需空闲端口 `18817`

---

## 2. 快速启动

### 从 Docker Hub 拉取镜像并启动

```bash
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d
```

或使用交付启动脚本（支持服务健康轮询检测）：

```bash
./scripts/up.sh
```

---

## 3. 访问入口与账号

- **Web 浏览器前台入口**: [http://localhost:18817/](http://localhost:18817/) (自动重定向至 [Frontend/index.html](http://localhost:18817/Frontend/index.html))
- **管理员登录页面**: [http://localhost:18817/Backend/Login.html](http://localhost:18817/Backend/Login.html)
- **患者登录页面**: [http://localhost:18817/Frontend/login_inc.php](http://localhost:18817/Frontend/login_inc.php)
- **医生登录页面**: [http://localhost:18817/Frontend/dlogin_inc.php](http://localhost:18817/Frontend/dlogin_inc.php)

### 预置系统账号信息

| 角色 | 用户名 / 邮箱 | 初始密码 | 说明 |
| :--- | :--- | :--- | :--- |
| `admin` (管理员) | `admin` | `AdminPassword123!` | 系统超级管理员，管理医生、患者与诊疗记录 |
| `doctor` (医生) | `doc@example.com` | `DocPassword123!` | 预置测试医生账号 |
| `patient` (患者) | `patient@example.com` | `PatientPassword123!` | 预置测试患者账号 |

---

## 4. 服务拓扑说明

| 服务名称 | 角色 | 镜像名称 | 对外端口 | 平台 | 说明 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `app` | 应用服务 | `yorem/doctor-appointment-system:default` | `18817:80` | `linux/amd64` | PHP 5.6 + Apache，运行医院在线预约核心系统 |
| `db` | 数据库服务 | `mariadb:10.5` | 无 (内部 3306) | `linux/amd64` | MariaDB 10.5 数据库，初始数据自动加载 |

---

## 5. 验证与运维命令

### 构建本地镜像（按需）

```bash
./scripts/build.sh
```

### 启动服务

```bash
./scripts/up.sh
```

### 健康检查与自动化登录校验

执行自动化健康检查与身份鉴权闭环检测：

```bash
./scripts/healthcheck.sh
```

### 单独测试管理员登录

```bash
./resources/login.sh
```

### 重置并清理环境

清理当前 Compose 项目的所有容器、网络和命名卷：

```bash
./scripts/reset.sh
```

---

## 6. 交付文件结构说明

```
.
├── README.md                          # 本说明文档
├── manifest.yaml                      # 环境元数据清单
├── source/
│   └── source.yaml                    # GitHub 源码仓库及固定 commit 信息
├── resources/
│   ├── users.yaml                     # 初始账号配置说明
│   ├── roles.yaml                     # 角色与权限配置说明
│   ├── login.sh                       # 登录验证脚本
│   └── initial-data/
│       └── database-seed.sql          # 数据库初始化与预填充数据
├── docker/
│   ├── Dockerfile                     # 容器镜像构建文件
│   ├── compose.yaml                   # 生产 Compose 编排文件
│   └── patches/                       # 容器适配补丁（动态环境配置与根路径重定向）
├── scripts/
│   ├── build.sh                       # 镜像构建脚本
│   ├── up.sh                          # 启动与就绪轮询脚本
│   ├── healthcheck.sh                 # HTTP 与登录健康检测脚本
│   └── reset.sh                       # 环境清理脚本
└── image/
    └── image.json                     # 镜像清单及 Digest 锁定
```
