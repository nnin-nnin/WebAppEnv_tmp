# litemall 原生 Docker Compose 环境 (2x2 双层双主体账号矩阵)

本交付物为 **litemall** 的原生 Docker Compose 应用环境。

> [!NOTE]
> 本环境包含 litemall 核心微商城服务（基于 Spring Boot 2 + Vue + 小程序端后端）、MySQL 8.0 关系型数据库。环境内置完整业务初始化数据种子（`init.sql`），启动即可直接进入生产就绪状态，无需任何手动向导操作。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机需可用专属分配端口 `18087`

---

## 2. 快速启动

```bash
./scripts/up.sh
```

---

## 3. 访问与初始账号 (2x2 双层双主体账号矩阵)

- **Web / API 访问地址**: [http://localhost:18087](http://localhost:18087)
- **管理后台鉴权接口**: `POST http://localhost:18087/admin/auth/login`
- **商城微信/用户鉴权接口**: `POST http://localhost:18087/wx/auth/login`

### 预置账号矩阵
| 用户名 | 初始密码 | 角色层级 | 维度 | 评测用途 | 鉴权端点 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **admin** | `AdminPassword123!` | administrator (超级管理员) | 垂直特权 | 全局系统最高管理特权 | `/admin/auth/login` |
| **admin2** | `AdminPassword123!` | administrator (超级管理员) | 横向特权隔离 | 管理员间横向越权与审计隔离 | `/admin/auth/login` |
| **user1** | `UserPassword123!` | standard_user (普通买家) | 横向业务隔离 | IDOR / 水平越权测试主体 A | `/wx/auth/login` |
| **user2** | `UserPassword123!` | standard_user (普通买家) | 横向业务隔离 | IDOR / 水平越权测试主体 B | `/wx/auth/login` |

---

## 4. 服务组成

| 服务名称 | 职责说明 | 镜像 | 目标平台 |
| :--- | :--- | :--- | :--- |
| **application** | litemall 后台及商城 API 核心服务 | `yorem/litemall:default` | `linux/amd64` |
| **db** | MySQL 8.0 关系型数据库（含完整初始化业务种子） | `mysql:8.0` | `linux/amd64` |

---

## 5. 环境验证与生命周期脚本

### 自动健康检查
```bash
./scripts/healthcheck.sh
```

### 账号与可用性多阶验证 (自动校验全部 4 账号)
```bash
./resources/login.sh
```

### 环境重置
```bash
./scripts/reset.sh
```
