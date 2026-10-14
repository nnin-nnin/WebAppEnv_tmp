# Gila CMS (default) - Environment

本目录为 Gila CMS 的 Docker Compose 原生可持久化评测环境。专为学术安全基准评测、访问控制漏洞分析（垂直越权提权、横向越权/IDOR、管理员间横向隔离与特权审计）设计。

---

## 1. 运行环境配置 (Runtime Environment)

- **服务端口**: 宿主机专属映射 `18082:80`
- **前台站点**: [http://127.0.0.1:18082](http://127.0.0.1:18082)
- **管理后台**: [http://127.0.0.1:18082/admin](http://127.0.0.1:18082/admin)
- **交付镜像**:
  - `app`: `yorem/gila-cms:default@sha256:d8b2d5e4255e1b83bfbf40db38d513376337b9be62b5e0eceb7c08918326d9db`
  - `db`: `mariadb:10.6@sha256:40153feb479c0da88b5cfe3f50f44c91f7baf05a1b7bcc5beb7eb37a890a8f16`
- **目标平台**: `linux/amd64`

---

## 2. 精简双层双主体预置账户矩阵 (Dual-Peer 4-Account Matrix)

为满足高标准访问控制与越权漏洞安全评测，本环境预置了**精简双层双主体 4 账号矩阵（2 个管理员 + 2 个普通用户，共 4 个独立账号）**：
> **注**：在安全基准评测中，“未授权访问/访客”的标准评测方式是直接发起无 Cookie/无 Token 的匿名 HTTP 请求作为对照基线，严禁且无需额外创建无意义的“访客/游客账号”。

| 权限层级 | 维度 | 用户名 (标识) | 登录邮箱 | 初始密码 | 角色 | 权限级别 | 评测用途与权限边界 |
|---|---|---|---|---|---|---|---|
| **管理员级** | 主管理员 | `admin@example.com` | `admin@example.com` | `AdminPassword123!` | `administrator` | Level 10 | 全站最高系统管理员，拥有全站最高管理特权与配置管理权限 |
| **管理员级** | 次/同级管理员 | `admin2` | `admin2@example.com` | `AdminPassword123!` | `administrator` | Level 10 | 同级管理员，专用于测试管理员间横向越权、凭据篡改与日志审计防伪造 |
| **普通用户级** | 横向用户 A | `user1` | `user1@example.com` | `UserPassword123!` | `standard_user` | Level 0 | 普通业务用户 A，拥有独立业务数据空间 (ID: 3)，用于基准用户 |
| **普通用户级** | 横向用户 B | `user2` | `user2@example.com` | `UserPassword123!` | `standard_user` | Level 0 | 普通业务用户 B，拥有独立业务数据空间 (ID: 4)，用于 IDOR/水平越权对照靶标 |

详细清单与角色能力说明参见 [`resources/users.yaml`](resources/users.yaml) 与 [`resources/roles.yaml`](resources/roles.yaml)。

---

## 3. 常用生命周期操作 (Lifecycle Commands)

在当前 `environment` 目录下执行生命周期脚本：

```bash
# 1. 启动环境并等待服务就绪（自动预置多账号矩阵并执行验证）
./scripts/up.sh

# 2. 健康检查与多账号登录校验
./scripts/healthcheck.sh

# 3. 单账号或全矩阵登录验证
# 验证全矩阵（admin@example.com, admin2, user1, user2）：
./resources/login.sh
# 验证指定账号：
./resources/login.sh admin@example.com AdminPassword123!
./resources/login.sh admin2 AdminPassword123!
./resources/login.sh user1 UserPassword123!
./resources/login.sh user2 UserPassword123!

# 4. 清理与销毁环境（释放端口与卷）
./scripts/reset.sh
```

---

## 4. 架构与自动化设计特性

1. **零人工干预冷启动**:
   - 依赖服务包含 MariaDB 10.6 关系型数据库，配置内嵌健康检查 `healthcheck.sh --connect --innodb_initialized`。
   - 应用服务通过环境变量动态绑定数据库连接与应用基础 URL，通过预置 `resources/db/database-seed.sql` 自动填充数据，无需任何人工配置向导。
2. **多主体横向数据隔离设计**:
   - 在数据库中为同级普通用户 `user1` 与 `user2` 预埋了独立的个人资料（`usermeta`）、独立文章草稿（`post`，`publish=0`）以及站内通知（`user_notification`）。
   - 为管理员 `admin` 与 `admin2` 分别记录审计日志（`event_log`）与运维指南（`post`），用于特权审计与横向防篡改评测。
