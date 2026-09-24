# OrangeHRM 5.7.0 原生多容器 Docker Compose 环境

本交付物为 **OrangeHRM 5.7.0** 的原生多容器 Docker Compose 应用环境。

> [!NOTE]
> 本环境为原生多容器 Compose 部署，不是 all-in-one 单容器环境。应用服务（Web/PHP）与数据库服务（MariaDB）分别运行在独立的容器中，并通过 Compose 专有网络通信。首次启动时数据库自动加载 Seed 数据，开箱即用。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机需可用端口 `18566`

---

## 2. 快速启动 (Docker Hub 交付方式)

使用已拉取/推送至 Docker Hub 的镜像直接启动：

```bash
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d
```

或者使用封装好的启动脚本：

```bash
bash scripts/up.sh
```

---

## 3. 访问与初始账号

- **浏览器访问地址**: [http://127.0.0.1:18566](http://127.0.0.1:18566)
- **登录页面地址**: [http://127.0.0.1:18566/web/index.php/auth/login](http://127.0.0.1:18566/web/index.php/auth/login)
- **初始管理员账号**: `Admin`
- **初始管理员密码**: `Ohrm@1423`
- **初始角色**: `Admin`

登录成功后，页面将跳转至 OrangeHRM 控制台首页，可使用组织人事（PIM）、考勤、假期等系统功能。

---

## 4. 服务组成

本环境包含 2 个核心独立服务：

| 服务名称 | 职责说明 | 镜像 | 目标平台 |
| :--- | :--- | :--- | :--- |
| **app** | OrangeHRM 5.7.0 Web 界面与 PHP 业务逻辑 | `yorem/orangehrm:5.7.0` | `linux/amd64` |
| **db** | MariaDB 10.11 关系型数据库 | `mariadb:10.11.8` | `linux/amd64` |

---

## 5. 环境验证与辅助工具

- **健康检查**:
  ```bash
  bash scripts/healthcheck.sh
  ```
- **登录鉴权验证**:
  ```bash
  bash resources/login.sh
  ```
- **环境重置与清理**:
  ```bash
  bash scripts/reset.sh
  ```
