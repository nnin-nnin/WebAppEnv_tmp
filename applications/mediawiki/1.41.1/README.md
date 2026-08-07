# MediaWiki 1.41.1 应用环境

这是 MediaWiki 1.41.1 固定源码 commit `36da63d008b7a2f9de929113b99bc7059831cb90` 的 all-in-one `linux/amd64` 应用环境，并包含与 MediaWiki 1.41 兼容的 Vector 皮肤固定 commit `f5d1b9c2d06403d8b82aaae2afe1d238a8ca9dce`。最终镜像为 `asteriskax001/sop-mediawiki:1.41.1`，单个容器内包含 MediaWiki、Vector 浏览器皮肤、Apache、PHP 8.2 和 MariaDB 11.8.6；前端由镜像内的 PHP ResourceLoader 提供。

## 启动

从应用环境仓库根目录执行。镜像内部已经包含应用、依赖、数据库初始数据、初始化和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap 脚本、数据库脚本或 Web Installer：

```bash
cd applications/mediawiki/1.41.1
docker run -d -p 18519:80 asteriskax001/sop-mediawiki:1.41.1
```

如需跨容器删除或重建仍保留数据，可使用 `-v mediawiki-data:/var/www/html/images -v mediawiki-db:/var/lib/mysql`；不加 volume 时，容器重启仍会保留自身文件系统中的数据。

## 访问和账号

- 浏览器入口：<http://127.0.0.1:18519/index.php>
- 登录页：<http://127.0.0.1:18519/index.php/Special:UserLogin>
- API：<http://127.0.0.1:18519/api.php>
- 初始用户名：`admin`
- 初始角色：`sysop`、`bureaucrat`（MediaWiki 管理员）
- 初始管理员密码：`WcWiki!26-eJ5sV9B`

浏览器登录成功后应进入真实的 MediaWiki 页面，可看到主页面、用户菜单、编辑/查看 wiki 内容等应用导航，而不是状态页或 API 文档。

## 验证

宿主机健康检查通过公开 HTTP 入口执行，不依赖容器内路径或 Unix socket：

```bash
MEDIAWIKI_URL=http://127.0.0.1:18519/index.php scripts/healthcheck.sh
```

登录和创建普通用户：

```bash
MEDIAWIKI_ADMIN_PASSWORD='WcWiki!26-eJ5sV9B' resources/login.sh
MEDIAWIKI_ADMIN_PASSWORD='WcWiki!26-eJ5sV9B' resources/register.sh verifier 'Verify-User-2026!'
```

登录其他用户时可用 `MEDIAWIKI_USERNAME` 和 `MEDIAWIKI_PASSWORD` 覆盖默认的管理员账号和密码。
`resources/register.sh` 使用 MediaWiki 真实的 `action=createaccount` AuthManager API，创建结果由 API 返回值确认。容器内的 Docker `HEALTHCHECK` 同时检查公开首页和 MariaDB socket。

## 重置

以下命令清除当前容器中的 wiki 数据并从镜像内置的初始数据库恢复；该操作会删除当前容器数据库和上传文件：

```bash
MEDIAWIKI_CONTAINER=mediawiki-1.41.1 scripts/reset.sh
```

重置后脚本会重启容器，等待健康检查通过后使用初始 `admin` 账号和上文记录的密码登录。

## 文件说明

- `manifest.yaml`：应用、源码、运行时、镜像、端口和运维入口元数据。
- `source/`：仅保存上游仓库链接和固定 commit 哈希的 `source.yaml`；源码快照不随本目录交付。
- `docker/`：最终镜像 Dockerfile、standalone 辅助 Dockerfile 和单 service Compose 配置；Compose 不是启动前置条件。
- `resources/`：账号/角色说明、真实登录与用户创建 API 脚本；`users.yaml` 中记录了初始管理员账号和密码。
- `scripts/`：构建、直接启动、宿主机健康检查、容器入口和重置脚本。
- `image/`：仅保存镜像元数据 `image.json`；镜像本体从 Docker Hub 获取，tar 和校验和不提交到仓库。
