# Gila CMS default 原生多容器 Docker Compose 环境

本交付物为 **Gila CMS (default / commit 0371737)** 的原生多容器 Docker Compose 应用环境，专为学术安全基准评测和漏洞扫描靶场设计。

> [!NOTE]
> 本环境采用原生多容器 Docker Compose 部署。应用服务（Apache/PHP 8.1）与独立数据库服务（MariaDB 10.6）分别运行在独立容器中，并通过 Compose 专有网络通信。接收者无需手动执行安装向导、配置数据库或导入 SQL，直接冷启动即用。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **网络要求**: 宿主机需可用端口 `18828`

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

## 3. 访问与初始账号

- **前台站点地址**: [http://localhost:18828](http://localhost:18828) 或 [http://127.0.0.1:18828](http://127.0.0.1:18828)
- **管理后台地址**: [http://localhost:18828/admin](http://localhost:18828/admin)
- **初始管理员邮箱**: `admin@example.com`
- **初始管理员用户名**: `admin`
- **初始管理员密码**: `AdminPassword123!`
- **角色级别**: `Admin (Level 10)`

登录成功后即可直接进入 Gila CMS Administration 管理面板，具备内容管理 (Pages/Posts/Categories)、插件包管理 (Packages)、外观主题管理 (Themes) 以及系统配置全量权限。

---

## 4. 服务组成

本环境包含 2 个独立解耦的核心服务：

| 服务名 | 容器镜像 | 内部端口 | 暴露端口 | 职责 |
|---|---|---|---|---|
| `app` | `yorem/gila-cms:default` | 80/tcp | `18828:80` | Web 应用与 PHP 8.1 运行时 |
| `db` | `mariadb:10.6` | 3306/tcp | 内部互联 | 关系型数据库存储 |

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
- **管理员登录凭据测试**:
  ```bash
  ./resources/login.sh admin@example.com AdminPassword123!
  # 或使用别名
  ./resources/login.sh admin AdminPassword123!
  ```
- **清理容器与持久化卷**:
  ```bash
  ./scripts/reset.sh
  ```

---

## 6. 定制与工程自愈说明

1. **解决 QEMU/Rosetta 下 PHP 段错误 (SIGSEGV)**:
   - 在 macOS ARM64 环境下以 `linux/amd64` 平台运行 PHP-Apache 时，Zend OPcache 会触发段错误 `child exit signal Segmentation fault (11)`。
   - 本环境在 PHP 运行配置中显式关闭 OPcache (`opcache.enable=0` 与 `opcache.enable_cli=0`)，彻底根除了 Apache 进程崩溃问题。
2. **免向导冷启动 (Zero-Configuration Cold Boot)**:
   - 官方 Gila CMS 默认在无 `config.php` 时重定向至 `/install` 安装向导。
   - 本环境预置了适配容器网络的 `config.php`，并在 MariaDB 启动时通过 `resources/initial-data/database-seed.sql` 自动填充完整数据表、默认文章、基础部件和经过安全哈希处理的初始管理员账户。
