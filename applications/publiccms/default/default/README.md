# PublicCMS default 原生 Docker Compose 环境

本环境为 **PublicCMS default** 的原生多容器 Docker Compose 可复现评测基准环境。

> [!NOTE]
> 本环境采用原生多容器架构（native_compose），应用服务（PublicCMS / Java Spring Boot / Tomcat）与数据库服务（MySQL 8.0）各自运行在独立的 Docker 容器中，并通过 Docker Compose 自动创建的桥接网络互联互通。初始数据库种子与免安装向导配置已全部预置，启动即可直接使用。

---

## 1. 前置条件

- **Docker Engine**: v20.10+
- **Docker Compose**: v2.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机开放 `18860` 端口。

---

## 2. 快速启动

### 方式一：使用运维脚本启动（推荐）

```bash
bash scripts/up.sh
```

### 方式二：直接使用 Docker Compose 启动

```bash
# 启动服务
docker compose -f docker/compose.yaml up -d
```

---

## 3. 服务访问与初始账号

- **前台首页**: [http://127.0.0.1:18860/](http://127.0.0.1:18860/)
- **管理后台**: [http://127.0.0.1:18860/admin/](http://127.0.0.1:18860/admin/)
- **登录页面**: [http://127.0.0.1:18860/admin/login](http://127.0.0.1:18860/admin/login)
- **管理员用户名**: `admin`
- **管理员密码**: `AdminPassword123!`
- **预设角色**: `admin` (系统管理员，拥有所有权限)

---

## 4. 拓扑与服务说明

| 服务名称 | 镜像引用 | 目标架构 | 端口映射 | 职责描述 |
| :--- | :--- | :--- | :--- | :--- |
| **`application`** | `yorem/publiccms:default@sha256:8586ce021af4b2dff5ff223da913c36a59e6fab91c6243ce22164a814da74507` | `linux/amd64` | `18860:8080` | PublicCMS 核心 Web 应用 (Java 21 / Spring Boot) |
| **`db`** | `mysql:8.0.36@sha256:a532724022429812ec797c285c1b540a644c15e248579c6bfdf12a8fbaab4964` | `linux/amd64` | 内部通信 | MySQL 8.0 关系型数据库 |

---

## 5. 验收与验证

### 5.1 服务健康检查

```bash
bash scripts/healthcheck.sh
```

该脚本将检测容器运行状态、MySQL 数据库健康状态以及 Web 端点响应（HTTP 200/302）。

### 5.2 账号登录验证

```bash
bash resources/login.sh
```

该脚本模拟提交管理员凭据进行后台身份验证，校验重定向及受保护管理面板的可访问性。

---

## 6. 环境重置与清理

```bash
bash scripts/reset.sh
```

该脚本将停止并移除所有容器、专用网络以及挂载卷，彻底清理本地测试状态。
