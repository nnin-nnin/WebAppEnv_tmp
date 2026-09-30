# OXID eShop (Community Edition) - Environment Package

## 1. 基本信息 (Basic Information)
- **应用名称**: OXID eShop (Community Edition)
- **版本**: default (基于 upstream HEAD: `fb4428902f8a30b8a72903d3b5d0f2c23dfeafbc`)
- **上游仓库**: https://github.com/OXID-eSales/oxideshop_ce
- **运行时环境**: PHP 8.4 (Apache) + MariaDB 10.5
- **交付模式**: Docker Compose (`native_compose`) / Docker Hub 镜像交付

## 2. 端口与访问凭证 (Ports & Credentials)
- **对外暴露端口**: `18851:80`
- **商城首页 (Storefront)**: http://localhost:18851/
- **管理后台 (Admin Console)**: http://localhost:18851/admin/
- **初始管理员账号**:
  - 用户名/邮箱: `admin@example.com` (或 `admin`)
  - 密码: `AdminPassword123!`

## 3. 架构设计与冷启动自愈 (Architecture & Cold Start)
1. **一体化镜像构建**:
   - 镜像标签: `yorem/oxid-eshop:default@sha256:86a69a55d264ac52476b4fa155b969e63dffb136893199a6cc7739d4c02a9056`
   - 集成 `oxid-esales/twig-component`、`oxid-esales/twig-admin-theme` 与 `oxid-esales/apex-theme`。
   - 针对 macOS ARM64 模拟兼容，关闭 OPcache JIT (`opcache.enable=0`, `opcache.jit=0`) 保证 Rosetta 环境高稳定性。
2. **种子数据库与即时就绪**:
   - `resources/database-seed.sql` 挂载至 MariaDB 的 `/docker-entrypoint-initdb.d/01-seed.sql`，空卷首次拉起即自动导入完整表结构、预置管理员和激活主题，无需经历安装向导。
   - 容器启动脚本 `entrypoint.sh` 自带健康检测与自愈补偿机制。

## 4. 生命周期管理脚本 (Scripts)
- **启动环境**:
  ```bash
  ./scripts/up.sh
  ```
- **健康检测与登录验证**:
  ```bash
  ./scripts/healthcheck.sh
  ```
- **单独执行管理员登录校验**:
  ```bash
  ./resources/login.sh
  ```
- **清理与重置环境**:
  ```bash
  ./scripts/reset.sh
  ```
