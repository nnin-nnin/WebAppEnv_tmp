# HotCRP 3.3.1 应用环境

这是固定源码 commit `718e6f4be324c3bd4a7515b894665d69407780c4` 构建的完整 Web 应用环境，目标平台为 `linux/amd64`。最终交付是单镜像、单容器的 all-in-one 产物，镜像内包含 HotCRP、Apache/PHP、MariaDB、数据库 schema、初始化账号和启动逻辑。

## 启动

从应用环境目录执行：

```sh
sha256sum -c image/SHA256SUMS
docker load -i image/hotcrp-3.3.1-linux-amd64.tar
docker run -d -p 18403:80 asteriskax001/sop-hotcrp:3.3.1
```

接收者只需要执行 `docker load` 和 `docker run`。镜像内部已经包含应用、数据库、初始化和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap 脚本、数据库初始化脚本或 Web Installer。

如需使用可读的命名卷，也可以将最后一条替换为：

```sh
docker run -d --name hotcrp -p 18403:80 -v hotcrp-db:/var/lib/mysql -v hotcrp-docs:/var/www/html/docs asteriskax001/sop-hotcrp:3.3.1
```

## 访问和账号

- 浏览器入口：<http://127.0.0.1:18403/>
- 登录页：<http://127.0.0.1:18403/signin>
- API 入口：<http://127.0.0.1:18403/api>
- 初始账号：`admin`（HotCRP 本地登录标识为 `admin@hotcrp.local`）
- 初始密码：`benchmark-only`
- 角色：sysadmin（HotCRP `ROLE_ADMIN`，系统管理员）

登录后应看到 HotCRP 的真实会议管理首页、管理菜单和用户/设置入口，而不是状态页或 Swagger 页面；首次登录若浏览器仍停留在账户设置页，也属于真实应用页面，可从顶部菜单进入 Users、Settings 或首页。

## 验证

```sh
HOTCRP_BASE_URL=http://127.0.0.1:18403 scripts/healthcheck.sh
HOTCRP_BASE_URL=http://127.0.0.1:18403 resources/login.sh
HOTCRP_BASE_URL=http://127.0.0.1:18403 resources/register.sh user@example.com Example User
```

`register.sh` 使用管理员登录后调用 HotCRP 真实的 `/profile.php/bulk` 用户批量管理表单创建普通用户；它不是伪造的通用注册 API。新用户的登录密码需要由管理员在 HotCRP 用户页面设置或通过应用支持的密码流程完成。

## 重置

重置会删除明确指定的 HotCRP 容器、数据库卷和文档卷。确认后执行：

```sh
HOTCRP_RESET_CONFIRM=yes scripts/reset.sh
docker run -d --name hotcrp -p 18403:80 -v hotcrp-db:/var/lib/mysql -v hotcrp-docs:/var/www/html/docs asteriskax001/sop-hotcrp:3.3.1
```

如果使用了其他容器或卷名，可通过 `HOTCRP_CONTAINER_NAME`、`HOTCRP_DB_VOLUME` 和 `HOTCRP_DOCS_VOLUME` 覆盖。重置后的初始账号恢复为 `admin@hotcrp.local` / `benchmark-only`。

## 文件说明

- `manifest.yaml`：应用版本、固定源码、运行时、镜像和运维入口的机器可读清单。
- `source/`：固定 commit 的 HotCRP 源码、源码元数据和校验和。
- `docker/`：实际 Dockerfile、兼容用 standalone Dockerfile 和单服务 Compose 辅助配置。
- `resources/`：用户、角色、真实登录/用户创建验证脚本以及初始配置和数据库 seed。
- `scripts/`：镜像构建、容器入口、健康检查和重置脚本。
- `image/`：最终 all-in-one 镜像 tar、镜像元数据和 tar 校验和。
