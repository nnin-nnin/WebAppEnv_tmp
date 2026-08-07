# FluxBB 1.5.11 应用环境

本目录交付 FluxBB 1.5.11 的完整 Web 应用 all-in-one `linux/amd64` 镜像。镜像内包含真实 FluxBB 论坛页面、PHP、Apache、MariaDB、初始化数据库和启动入口；不需要独立数据库容器、Compose 或 Web Installer。

## 启动

从仓库根目录进入本目录后执行：

```bash
cd fluxbb_1.5.11
(cd image && sha256sum -c SHA256SUMS)
docker load -i image/fluxbb-1.5.11-linux-amd64.tar
docker run -d --name fluxbb-1.5.11 -p 18311:80 asteriskax001/sop-fluxbb:1.5.11
```

接收者只需要 `docker load` 和 `docker run`。镜像已经包含应用、数据库、初始数据、初始化和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap 脚本、数据库导入或 Web Installer。

## 访问和账号

- 浏览器入口：<http://127.0.0.1:18311/>
- 登录入口：<http://127.0.0.1:18311/login.php>
- API 地址：FluxBB 1.5.11 未提供独立 REST API；浏览器页面和表单接口均使用同一地址。
- 初始用户名：`admin`
- 初始密码：`benchmark-only`
- 角色：`Administrators`，拥有论坛和管理后台权限

首页是 FluxBB 的真实论坛首页，登录后会显示论坛导航、默认分类/论坛和管理员入口，而不是状态页或 API 文档。

## 验证

```bash
FLUXBB_URL=http://127.0.0.1:18311 scripts/healthcheck.sh
FLUXBB_URL=http://127.0.0.1:18311 FLUXBB_USERNAME=admin FLUXBB_PASSWORD=benchmark-only resources/login.sh
FLUXBB_URL=http://127.0.0.1:18311 resources/register.sh benchmark-user benchmark-password-1 user@example.invalid
```

`login.sh` 会先取得 FluxBB 登录页中的真实 CSRF token，再提交真实登录表单。`register.sh` 使用 FluxBB 公开的 `register.php` 表单创建普通 Members 用户；密码至少 9 个字符。两者都不依赖 Docker Compose。

## 重置

重置会删除指定容器内的 FluxBB 数据库并重新运行内置安装器，属于破坏性操作：

```bash
scripts/reset.sh fluxbb-1.5.11
```

容器重启完成后恢复为 `admin` / `benchmark-only`，默认论坛数据也会恢复。未使用外部 Docker volume 时无法恢复被删除的数据；使用 volume 的数据也会被该命令主动清除。

## 文件说明

- `manifest.yaml`：应用、源码、运行时、组件、镜像和脚本元数据。
- `source/`：仅保存 GitHub 仓库链接和固定 commit 哈希的 `source/source.yaml`；源码快照不随本目录交付。
- `docker/`：最终 Dockerfile、辅助 standalone Dockerfile 和单服务 Compose 配置。
- `resources/`：账号、角色、真实登录/注册脚本；初始化数据库已作为镜像内预初始化数据交付。
- `scripts/`：构建、单容器入口、初始化、健康检查、启动辅助和重置脚本。
- `image/`：最终单镜像 tar、镜像元数据和校验和。
