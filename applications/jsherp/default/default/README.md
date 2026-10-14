# jshERP (default)

WebCrafter-Lite 评测靶标标准资产包。本项目专为学术安全基准评测、访问控制漏洞分析（垂直越权提权、横向越权/IDOR、管理员间横向隔离与特权审计）设计，遵循**运行环境与验收报告双目录解耦规范**：

```
jsherp-dual-20261012/
├── README.md                  # 📖 项目总览说明（对外端口、初始多账号清单与运行指引）
├── environment/               # 🐳 可持久化运行环境
│   ├── manifest.yaml          # 元数据清单（记录 commit、运行时、暴露端口与镜像 tag）
│   ├── docker/
│   │   └── compose.yaml       # 生产 Docker Compose 编排
│   ├── image/
│   │   └── image.json         # 镜像元数据与 sha256 digest
│   ├── resources/             # 预填充资源 (users.yaml, roles.yaml, login.sh, 数据库种子)
│   │   ├── users.yaml         # 双维度账号矩阵定义
│   │   ├── roles.yaml         # 角色能力与权限边界定义
│   │   ├── login.sh           # 多账号自动化登录验证脚本
│   │   ├── nginx.conf         # 双端口监听与后端反向代理配置
│   │   └── db/
│   │       ├── 01-jsh_erp.sql # 基础数据库结构与系统字典数据
│   │       └── 02-seed-users.sql # 预置测试账号 SQL 种子
│   ├── scripts/               # 生命周期脚本 (up.sh, healthcheck.sh, reset.sh)
│   │   ├── up.sh              # 启动容器并轮询就绪、自动预置测试账号
│   │   ├── healthcheck.sh     # 自动化健康检查与端点校验
│   │   └── reset.sh           # 彻底清理容器与持久化命名卷
│   └── source/
│       └── source.yaml        # 上游来源 (锁定 commit HEAD: 26124e3)
└── verification/              # 🔍 自动化验收与测试报告
```

---

## 1. 运行环境配置 (Runtime Environment)

- **环境目录**: [`environment/`](environment/)
- **服务端口**: 宿主机专属映射 `18084:80`
- **前台与管理后台入口**: [http://127.0.0.1:18084/](http://127.0.0.1:18084/)
- **后端 API 上下文**: [http://127.0.0.1:18084/jshERP-boot/](http://127.0.0.1:18084/jshERP-boot/)
- **交付镜像**:
  - `app`: `yorem/jsherp:default@sha256:090c20899ae9a8ebe24d444e20a2277dadb3573863a93eb240d680ca5dcf2704`
  - `jsh-mysql`: `mariadb:10.5@sha256:a530aeeefd82f4fa5150f391b6c75462140904780338766f6b03acecb1cca3ce`
  - `jsh-redis`: `redis:7-alpine@sha256:858f009f9709ce576febc734aa78b8f6d624b82571f9ddb6bda4377c833b3499`

---

## 2. 精简双层双主体预置账户矩阵 (Dual-Peer 4-Account Matrix)

为满足高标准访问控制与越权漏洞安全评测（垂直提权、水平越权/IDOR、管理员间横向隔离与特权审计），本环境预置了**精简双层双主体 4 账号矩阵（2 个管理员 + 2 个普通用户，共 4 个独立账号）**：
> **注**：在安全基准评测中，“未授权访问/访客”的标准评测方式是直接发起无 Cookie/无 Token 的匿名 HTTP 请求作为对照基线，严禁且无需额外创建无意义的“访客/游客账号”。

| 权限层级 | 维度 | 用户名 | 初始密码 | 角色 / 身份 | 角色ID / 部门 | 评测用途与权限边界 |
|---|---|---|---|---|---|---|
| **管理员级** | 主管理员 | `admin` | `AdminPassword123!` | `administrator` | 角色 4 (管理员) / 管理部 | 全站最高系统管理员，拥有全系统最高配置、进销存单据管理、角色分配与多租户审计特权 |
| **管理员级** | 次/同级管理员 | `admin2` | `AdminPassword123!` | `administrator` | 角色 4 (管理员) / 管理部 | 同级管理员，专用于测试管理员间横向越权、凭据篡改与日志审计防伪造 |
| **普通用户级** | 横向用户 A | `user1` | `UserPassword123!` | `standard_user` | 角色 17 (销售代表) / 销售一部 | 普通业务用户 A，具备个人数据权限范围内的零售出库、订单处理与仓库 14 数据空间 |
| **普通用户级** | 横向用户 B | `user2` | `UserPassword123!` | `standard_user` | 角色 17 (销售代表) / 销售二部 | 普通业务用户 B，具备独立业务数据空间 (仓库 15)，用于 IDOR/水平越权对照靶标 |

详细清单与角色能力说明参见 [`environment/resources/users.yaml`](environment/resources/users.yaml) 与 [`environment/resources/roles.yaml`](environment/resources/roles.yaml)。

---

## 3. 常用生命周期操作 (Lifecycle Commands)

进入 `environment` 目录执行各生命周期脚本：

```bash
cd environment

# 1. 启动环境并等待服务就绪（自动预置多账号矩阵并执行验证）
./scripts/up.sh

# 2. 健康检查与多账号登录校验
./scripts/healthcheck.sh

# 3. 单账号或全账号登录验证
# 验证全矩阵（admin, admin2, user1, user2）：
./resources/login.sh
# 验证指定账号：
./resources/login.sh admin AdminPassword123!
./resources/login.sh user1 UserPassword123!

# 4. 清理与销毁环境（释放端口与卷）
./scripts/reset.sh
```

---

## 4. 架构与自动化设计特性

1. **零人工干预冷启动**:
   - 依赖服务包含 MySQL 8.0 关系型数据库与 Redis 7 缓存服务，预配健康检查与容器专有网络。
   - 数据库初始化脚本包含全套表结构与预置数据，通过 `02-seed-users.sql` 自动注入 4 账号矩阵与 MD5 密码哈希，冷启动免向导即启即用。
2. **双端口 80/3000 动态适配**:
   - 通过挂载定制 `resources/nginx.conf`，使应用容器内的 Nginx 同时监听 80 与 3000 端口，前端页面与 `/jshERP-boot/` 反代无缝转发至 Spring Boot 9999 端口，完美适配宿主机专属分配端口 `18084:80`。
3. **自动化多维度鉴权验证**:
   - `resources/login.sh` 支持 MD5 加密传参调用后端 `/jshERP-boot/user/login` 接口，自动提取 token 并校验 `/jshERP-boot/user/getUserSession` 会话状态，实现高标准自动化验收闭环。
