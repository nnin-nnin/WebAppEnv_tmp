# Apache Airflow 3.3.0 原生多容器 Docker Compose 环境

本交付物是基于 **Apache Airflow 3.3.0** 官方拓扑整理构建的原生多容器 Docker Compose 可复现运行环境。

> [!IMPORTANT]
> **多容器拓扑说明**：  
> 本交付物是**原生多容器 Docker Compose 环境**，不是 all-in-one 单容器环境。  
> Airflow 应用组件、PostgreSQL 数据库及 Redis 缓存/消息 Broker 分别运行在独立的容器中，并通过 Docker Compose 自动创建的项目网络互相连接通信。  
> 接收者**不需要**手动安装数据库、导入 SQL 脚本、手动创建 Docker 网络或配置宿主机环境变量。

---

## 1. 前置条件

- **Docker Engine**: v20.10+
- **Docker Compose**: v2.0+
- **目标平台**: `linux/amd64` (在 ARM64/Apple Silicon 主机上运行时，Docker 将使用 Rosetta / qemu 仿真运行)
- **网络**: 需能够访问 Docker Hub 拉取镜像

---

## 2. 标准启动流程

### 从 Docker Hub 拉取并启动环境

```bash
# 1. 拉取固定版本的镜像
docker compose -f docker/compose.yaml pull

# 2. 后台启动所有容器集群
docker compose -f docker/compose.yaml up -d
```

也可以使用封装好的运维脚本启动：

```bash
./scripts/up.sh
```

---

## 3. 访问与初始账号

- **Web UI / API 地址**: [http://localhost:18010](http://localhost:18010)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `benchmark-only`
- **角色**: `Admin`

访问浏览器入口 `http://localhost:18010`，输入管理员账号密码即可登录进入 Airflow 管理控制台。

---

## 4. 服务架构与拓扑说明

| 服务名称 (`service_name`) | 容器职责描述 | 镜像与版本 | 映射端口 | 依赖关系 |
| :--- | :--- | :--- | :--- | :--- |
| **`postgres`** | PostgreSQL 16 关系型数据库 | `postgres:16` | 无 | 无 (配置 Healthcheck) |
| **`redis`** | Redis 7.2 Celery Broker 缓存服务 | `redis:7.2-bookworm` | 无 | 无 (配置 Healthcheck) |
| **`airflow-apiserver`** | Airflow Web UI 与 REST API 服务 | `yorem/apache-airflow:3.3.0` | `18010:8080` | `postgres`, `redis`, `airflow-init` |
| **`airflow-scheduler`** | Airflow 任务调度器 | `yorem/apache-airflow:3.3.0` | 无 | `postgres`, `redis`, `airflow-init` |
| **`airflow-dag-processor`**| Airflow DAG 解析处理器 | `yorem/apache-airflow:3.3.0` | 无 | `postgres`, `redis`, `airflow-init` |
| **`airflow-worker`** | Celery Worker 任务执行节点 | `yorem/apache-airflow:3.3.0` | 无 | `postgres`, `redis`, `airflow-apiserver`, `airflow-init` |
| **`airflow-triggerer`** | Airflow 异步 Triggerer | `yorem/apache-airflow:3.3.0` | 无 | `postgres`, `redis`, `airflow-init` |
| **`airflow-init`** | 数据库 Migration 与管理员初始化 | `yorem/apache-airflow:3.3.0` | 无 | `postgres`, `redis` |

---

## 5. 验证与运维脚本

项目根目录及 `scripts/` / `resources/` 目录下提供了完整的运维与自动化验证脚本：

### 健康检查

验证 Compose 配置有效性、容器运行状态以及 Web UI HTTP 入口：

```bash
./scripts/healthcheck.sh
```

### 自动化登录验证

调用 Web 界面登录探针：

```bash
./resources/login.sh
```

### 创建普通用户

在容器内调用 Airflow CLI 创建新用户：

```bash
./resources/register.sh newuser newpassword123 newuser@example.com User
```

### 环境重置

停止并删除当前 Compose 项目的所有容器、网络及数据卷：

```bash
./scripts/reset.sh
```

---

## 6. 交付文件说明

```text
apache-airflow/3.3.0/default/
├── README.md                 # 交付环境中文说明文档
├── manifest.yaml             # 环境元数据配置清单
├── source/
│   └── source.yaml           # GitHub 源码仓库及固定 Commit 哈希记录
├── resources/
│   ├── users.yaml            # 初始管理员账户定义
│   ├── roles.yaml            # 系统角色定义
│   ├── login.sh              # 自动登录验证脚本
│   └── register.sh           # 用户创建脚本
├── docker/
│   └── compose.yaml          # 标准 Docker Compose 配置文件
└── scripts/
    ├── up.sh                 # 启动并等待服务就绪脚本
    ├── healthcheck.sh        # 健康检查脚本
    └── reset.sh              # 环境重置清理脚本
```

---

## 7. 镜像来源与固定 Digest

| 服务 | 交付镜像 | Tag | Digest / 识别信息 | 来源说明 |
| :--- | :--- | :--- | :--- | :--- |
| Airflow 组件 | `yorem/apache-airflow:3.3.0` | `3.3.0` | `sha256:977cb287a1f8e70e27e820439a36037c8db52a5e022d67a903f668ba77bd91dd` | 衍生自 `apache/airflow:3.3.0` 并推送至 Docker Hub `yorem` |
| PostgreSQL | `postgres` | `16` | 官方固定版本 | Docker Hub 官方镜像 |
| Redis | `redis` | `7.2-bookworm` | 官方固定版本 | Docker Hub 官方镜像 |

---

## 8. 交付 Compose 与官方 Compose 的差异

1. **镜像推送与标准化**：官方示例使用 `apache/airflow:3.3.0`，交付环境将其打标签为 `yorem/apache-airflow:3.3.0` 并自动推送到 Docker Hub 命名空间 `yorem`，保证镜像源可追溯。
2. **端口固定**：将官方默认的 `8080:8080` 端口映射修改为交付分配的固定宿主机端口 `18010:8080`。
3. **预设管理员凭据**：在 `airflow-init` 环境变量中预设管理员评测凭据为 `admin` / `benchmark-only`。
4. **安全与隔离**：移除了环境变量占位符，固定 Fernet Key 和 JWT Secret，确保 Compose 可一次性免交互幂等启动。
