# Alfresco Community Edition 原生多容器 Docker Compose 环境

本环境为 **Alfresco Community Edition (ACS)** 的原生多容器 Docker Compose 部署环境，固定版本为 `26.3.0.19` (Alfresco Repository) / `26.2.0` (Alfresco Content Services 拓扑)。

---

## 声明

- 本交付物是**原生多容器 Docker Compose 环境**，不是 all-in-one 单容器环境。
- 应用 (Alfresco Content Repository)、Web 管理前端 (Alfresco Share)、数据库 (PostgreSQL)、搜索引擎 (Elasticsearch)、消息队列 (ActiveMQ)、转换引擎 (Transform Core AIO) 和反向代理 (Nginx) 分别运行在独立容器中。
- 各容器通过 Docker Compose 自动创建的项目内部网络直接连接，应用通过 Compose 服务名称（如 `postgres`、`elasticsearch`、`activemq`）通信。
- 接收者**不需要**手动创建 Docker 网络、手动安装数据库或导入 SQL 初始化脚本。

---

## 1. 前置条件

- **Docker Engine**: v24.0.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64` (ARM64 架构下通过 Docker 仿真平台自动运行)
- **内存要求**: 建议宿主机至少分配 6GB 以上内存可用给 Docker

---

## 2. 快速启动

在项目根目录下，使用 Docker Hub 镜像拉取并启动环境：

```bash
# 1. 拉取所有固定版本的容器镜像
docker compose -f docker/compose.yaml pull

# 2. 后台启动所有服务
docker compose -f docker/compose.yaml up -d
```

启动命令也可以直接调用脚本：

```bash
bash scripts/up.sh
```

---

## 3. 访问与账号信息

- **服务总入口 / Nginx 代理**: `http://localhost:18006/`
- **Alfresco Share Web 管理界面**: `http://localhost:18006/share/`
- **Alfresco Content Repository API / ReST 探针**: `http://localhost:18006/alfresco/`
- **Alfresco Content App**: `http://localhost:18006/content-app/`
- **Alfresco Control Center**: `http://localhost:18006/control-center/`

### 初始管理员账号
- **用户名**: `admin`
- **密码**: `admin`
- **角色**: `ALFRESCO_ADMINISTRATORS` (超级管理员)

---

## 4. 拓扑与服务说明

| 服务名称 (`service`) | 职责说明 | 镜像 (`image`) | 映射端口 |
| :--- | :--- | :--- | :--- |
| `proxy` | Nginx 反向代理网关 | `nginx:1.27-alpine` | `18006:8080` |
| `alfresco` | Alfresco 内容存储库应用主服务 | `yorem/alfresco:26.3.0.19` | 内部 8080 |
| `share` | Alfresco Share Web 客户端界面 | `docker.io/alfresco/alfresco-share:26.2.0` | 内部 8080 |
| `postgres` | PostgreSQL 关系型数据库 | `postgres:17.4-alpine` | 内部 5432 |
| `elasticsearch` | 搜索引擎 (Elasticsearch) | `elasticsearch:8.17.10` | 内部 9200 |
| `activemq` | ActiveMQ 消息队列 | `docker.io/alfresco/alfresco-activemq:6.2.6-jre17-rockylinux8` | 内部 61616/8161 |
| `transform-core-aio` | 文档格式转换引擎 | `alfresco/alfresco-transform-core-aio:5.4.3` | 内部 8090 |
| `batch-indexing` | Elasticsearch 批量索引服务 | `docker.io/alfresco/alfresco-elasticsearch-batch-indexing:5.7.0` | 内部 |
| `content-app` | Content App 新版 Web UI | `alfresco/alfresco-content-app:8.0.0` | 内部 8080 |
| `control-center` | Control Center 管理控制台 | `quay.io/alfresco/alfresco-control-center:11.0.0` | 内部 8080 |

---

## 5. 验证与运维命令

### 健康检查
验证服务启动与探针接口：
```bash
bash scripts/healthcheck.sh
```

### 登录测试
测试初始管理员 `admin` 账号登录并获取 Ticket：
```bash
bash resources/login.sh
```

### 注册 / 创建普通用户
创建新的 Alfresco 用户：
```bash
bash resources/register.sh newuser Password123! newuser@example.com
```

### 环境重置
停止并清理当前项目的所有容器、网络和命名卷：
```bash
bash scripts/reset.sh
```

---

## 6. 交付文件结构

```text
.
├── README.md                 # 部署与运维说明文档
├── manifest.yaml             # 应用环境元数据与清单
├── source/
│   └── source.yaml           # GitHub 源码仓库及固定 commit 信息
├── docker/
│   ├── compose.yaml          # 标准 Docker Compose 配置文件
│   └── nginx.conf            # Nginx 反向代理路由配置
├── resources/
│   ├── users.yaml            # 初始用户定义
│   ├── roles.yaml            # 角色与权限映射
│   ├── login.sh              # 登录验证脚本
│   └── register.sh           # 用户注册/创建脚本
└── scripts/
    ├── up.sh                 # 环境启动与等待健康脚本
    ├── healthcheck.sh        # 完整健康检查脚本
    └── reset.sh              # 项目清理重置脚本
```

---

## 7. 官方 Compose 差异说明

1. **镜像托管与固定**: 主应用镜像构建打标签并推送到 Docker Hub `yorem/alfresco:26.3.0.19`（Digest: `sha256:bddb4e96b0452208ae836993b12b35afad596e9fabf71ccb814d4f86383c18db`）。
2. **安全代理替代**: 使用标准 Nginx 替代了官方默认需要挂载宿主机 `/var/run/docker.sock` 的 Traefik 代理，消除了容器安全隐患，完全符合规范要求。
3. **端口映射集中**: 将对外访问入口映射为指定端口 `18006`。
4. **配置文件整合**: 整合了官方模板中的 `commons/base.yaml`，统一呈现在单一 `docker/compose.yaml` 中，避免接收者混合查找。
