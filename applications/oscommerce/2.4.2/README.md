# osCommerce 2.4.2 all-in-one 应用环境

这是固定源码 commit `99fbb604bd1de8d1f13c792d378fd1952f64ca61` 构建的完整 Web 应用环境，目标平台为 `linux/amd64`。单个镜像内包含 osCommerce 前台、Administration Dashboard、PHP 8.3、Apache 和 MariaDB；没有独立数据库容器。

## 启动

在应用环境仓库根目录执行：

```bash
cd oscommerce_2.4.2
sha256sum -c image/SHA256SUMS
docker load -i image/oscommerce-2.4.2-linux-amd64.tar
docker run -d -p 18402:80 yorem/oscommerce:2.4.2
```

接收者只需要 `docker load` 和 `docker run`。镜像内部已经包含应用、数据库、Schema、seed、初始化和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap、Web Installer 或单独启动数据库。

启动后等待首次 MariaDB 建表和 osCommerce 默认模块安装完成，通常不超过 120 秒。

## 访问和账号

- 商城前台：<http://127.0.0.1:18402/>，是可浏览商品、注册客户的真实 osCommerce 页面。
- 管理后台：<http://127.0.0.1:18402/admin/>，登录后预期进入 Dashboard，可看到 Shop、Apps、Legacy 等后台导航。
- 独立 API：无。该版本是 PHP 页面式 Web 应用，登录和注册通过真实页面请求完成，不把状态页当作 API 或前端。
- 管理员用户名：`admin`
- 管理员密码：`benchmark-only`
- 管理员角色：osCommerce Administration Dashboard 管理员。
- 普通客户：通过 `resources/register.sh` 调用真实 `create_account.php` 注册，邮箱作为登录名。

## 验证

```bash
scripts/healthcheck.sh
resources/login.sh
resources/register.sh customer-$(date +%s)@example.test benchmark-customer
```

脚本默认访问 `http://127.0.0.1:18402`，可用 `OSCOMMERCE_URL` 覆盖地址；管理员登录脚本还支持 `OSCOMMERCE_ADMIN_USERNAME` 和 `OSCOMMERCE_ADMIN_PASSWORD`。`register.sh` 使用 osCommerce 页面返回的 session token，不依赖 Compose 或伪造的通用注册 API。

首次启动会自动生成 `Conf/global.php`、两个站点配置，创建 MariaDB 数据库和应用用户，按固定源码 Schema 建表，导入 `resources/initial-data/database-seed.sql`，安装默认模块并创建管理员。重启同一容器时会复用已有数据库，不重复导入。

## 重置

`scripts/reset.sh` 是显式确认的破坏性重置脚本。使用 Compose 或带命名卷的运行方式时执行：

```bash
scripts/reset.sh --yes oscommerce-242
```

这会删除指定容器和 `oscommerce-242-db`、`oscommerce-242-work` 数据卷；随后重新执行启动命令即可恢复初始管理员和 seed 数据。直接使用上面的最简命令时，删除对应容器后重新运行即可；若需要跨容器持久化，建议使用 `docker/compose.yaml` 的两个命名卷。

## 文件说明

- `manifest.yaml`：版本、固定 commit、运行时、all-in-one 组件、入口、归档和脚本元数据。
- `source/`：仅保存官方 GitHub 仓库链接和固定 commit 哈希的 `source/source.yaml`；源码快照不随本目录交付。
- `docker/`：最终镜像 Dockerfile、同一构建契约的 `standalone.Dockerfile` 和单 service 辅助 Compose 配置。
- `resources/`：用户、角色、真实登录/注册脚本，以及固定源码的商城初始数据 seed。
- `scripts/`：构建、入口、初始化、启动、健康检查和重置运维脚本。
- `image/`：最终单镜像 tar、镜像元数据和校验文件。

## 构建

如需从当前交付目录重建归档：

```bash
bash scripts/build.sh
```

构建只导出 `yorem/oscommerce:2.4.2`，归档为 `image/oscommerce-2.4.2-linux-amd64.tar`。镜像运行时不下载源码、依赖或核心远程资源；仓库中原有的可选 Cookie Consent 代码含有外链，但默认商城核心模板不加载该可选组件。
