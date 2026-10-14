# WebChess default 原生多容器 Docker Compose 环境

本交付物为 **WebChess (default / commit ee3e343)** 的原生多容器 Docker Compose 应用环境，专为学术安全基准评测和访问控制漏洞扫描靶场设计。

> [!NOTE]
> 本环境采用原生多容器 Docker Compose 部署。应用服务（PHP 7.4 Apache）与独立数据库服务（MariaDB 10.5）分别运行在独立容器中，并通过 Compose 专有网络通信。通过预埋数据库 SQL 种子与配置文件，接收者无需手动执行安装向导、配置数据库或导入 SQL，直接冷启动免向导即启即用。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机专属映射端口 `18083`

---

## 2. 快速启动

使用封装好的启动脚本（自动执行 Compose 编排并轮询健康状态）：

```bash
./scripts/up.sh
```

或者使用原生 Docker Compose 命令：

```bash
docker compose -f docker/compose.yaml up -d
```

---

## 3. 访问与初始账号矩阵

- **站点地址**: [http://127.0.0.1:18083](http://127.0.0.1:18083)

### 精简双层双主体 4 账号矩阵：
1. **主系统管理员 (Admin)**: `admin` / `AdminPassword123!` (全站最高管理员，角色: `administrator`，维度: `vertical_admin`)
2. **次/同级管理员 (Admin2)**: `admin2` / `AdminPassword123!` (同级管理员，角色: `administrator`，维度: `horizontal_admin`)
3. **横向测试用户 A**: `user1` / `UserPassword123!` (标准玩家用户，角色: `standard_user`，维度: `horizontal_user`)
4. **横向测试用户 B**: `user2` / `UserPassword123!` (标准玩家用户，角色: `standard_user`，维度: `horizontal_user`)

---

## 4. 服务组成

| 服务名 | 容器镜像 | 内部端口 | 暴露端口 | 职责 |
|---|---|---|---|---|
| `app` | `yorem/webchess:default@sha256:4741fd66247d6af41995c2d5ca89f20af5367f309e9b55fcf05b41f757b91e9b` | 80/tcp | `18083:80` | Web 应用与 PHP 7.4 Apache 运行时 |
| `db` | `mariadb:10.5@sha256:a530aeeefd82f4fa5150f391b6c75462140904780338766f6b03acecb1cca3ce` | 3306/tcp | 内部互联 | MariaDB 关系型数据库存储 |

---

## 5. 自动化脚本与测试验证

所有运维与测试脚本位于 `scripts/` 与 `resources/` 目录，均已赋予执行权限：

- **启动并等待健康就绪**:
  ```bash
  ./scripts/up.sh
  ```
- **自动化健康检查与端点校验**:
  ```bash
  ./scripts/healthcheck.sh
  ```
- **多账号登录凭据测试**:
  ```bash
  # 验证全矩阵（默认 4 账号全量遍历与防假阳性校验）
  ./resources/login.sh
  # 验证指定账号
  ./resources/login.sh admin AdminPassword123!
  ./resources/login.sh user1 UserPassword123!
  ```
- **清理容器与持久化卷**:
  ```bash
  ./scripts/reset.sh
  ```
