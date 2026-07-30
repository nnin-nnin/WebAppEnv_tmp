# ruoyi-vue-pro 2026.06-jdk8

这是 `ruoyi-vue-pro` 固定版本 `2026.06-jdk8` 的完整 Web 应用环境，目标平台为 `linux/amd64`。最终交付物是单个 all-in-one Docker 镜像：镜像内部包含 Vue3 管理后台、Nginx、Spring Boot 后端、Java 8、MySQL、Redis、数据库初始化数据和启动入口。

## 启动

以下命令从应用目录执行。接收者只需要从 Docker Hub 拉取镜像并执行 `docker run`；镜像内部已经包含应用、数据库、初始化和启动逻辑，不需要执行 `build.sh`、Docker Compose、bootstrap 脚本、Web Installer、手动 SQL 或单独的数据库容器。

```bash
cd ruoyi-vue-pro_2026.06-jdk8
docker pull yorem/sop-ruoyi-vue-pro:2026.06-jdk8
docker run -d -p 18087:80 yorem/sop-ruoyi-vue-pro:2026.06-jdk8
```

本地完整交付目录中如果存在 `image/ruoyi-vue-pro-2026.06-jdk8-linux-amd64.tar`，也可以使用该归档加载镜像；GitHub 仓库不保存这个大文件，Docker Hub 镜像是公开交付来源。

启动后，容器会自动启动内部 Redis 和 MySQL，等待数据库完成初始化，再启动 Spring Boot 和 Nginx。数据库第一次初始化可能需要几十秒；后续重启会复用 Docker 自动创建的数据卷，不会重复导入 seed。

## 访问和账号

- 浏览器入口：<http://localhost:18087/>
- 预期页面：真实的“芋道管理系统” Vue3 登录页；登录成功后进入管理后台首页，可看到侧边栏菜单、工作台和系统管理内容。
- 后端 API：<http://localhost:18087/admin-api/>
- 初始租户：`芋道源码`，内部租户编号为 `1`
- 初始管理员：`admin`
- 初始密码：`admin123`
- 初始角色：`超级管理员`（`super_admin`）

为保证离线验收可重复，镜像配置关闭了可选的滑块验证码校验；这不会替代真实认证，账号密码仍通过项目实际的 `/admin-api/system/auth/login` 接口校验。前端 API 使用同源 `/admin-api`，核心 JS、CSS、字体和图片均随镜像提供，不依赖 CDN 或远程后端。

## 验证

检查 shell 脚本语法：

```bash
bash -n scripts/*.sh
```

检查运行状态和真实前端入口：

```bash
RUOYI_BASE_URL=http://127.0.0.1:18087 scripts/healthcheck.sh
```

使用真实登录接口验证管理员账号。脚本默认使用 `admin/admin123`，也支持环境变量覆盖地址、租户和账号：

```bash
RUOYI_BASE_URL=http://127.0.0.1:18087 resources/login.sh
```

使用应用公开注册接口创建普通用户。该接口来自项目的 `/admin-api/system/auth/register`，不是通用伪造接口；注册开关由 seed 中的 `system.user.register-enabled=true` 开启。参数依次为用户名、昵称和密码：

```bash
RUOYI_BASE_URL=http://127.0.0.1:18087 resources/register.sh sopuser01 SOP 普通用户123
```

也可以直接使用浏览器打开根路径，填写 `芋道源码`、`admin`、`admin123`，完成真实浏览器登录并检查首页菜单。验收时应确认容器内同时存在 `mysqld`、`redis-server`、Java 和 Nginx 进程，并检查：

```bash
docker ps
docker logs <container-id>
docker exec <container-id> mysqladmin --protocol=TCP -h127.0.0.1 -uroot -p123456 ping
docker exec <container-id> redis-cli -h127.0.0.1 ping
```

## 重置

`docker run` 未显式指定卷时，Docker 会为 `/var/lib/mysql`、`/var/lib/redis` 和 `/var/lib/yudao` 自动创建匿名卷。要保留已有数据，直接 `docker restart <container-id>` 即可；重启后管理员账号和已创建用户仍然可用。

如果使用 `scripts/up.sh` 启动的容器名 `ruoyi-vue-pro`，确认要删除全部数据库和缓存数据后执行：

```bash
RUOYI_CONTAINER_NAME=ruoyi-vue-pro scripts/reset.sh --yes
docker run -d --name ruoyi-vue-pro -p 18087:80 yorem/sop-ruoyi-vue-pro:2026.06-jdk8
```

`reset.sh` 会删除目标容器及其 MySQL/Redis 数据卷；这是有意的破坏性重置，不能恢复。只删除容器而不删除数据卷不会恢复到初始 seed。

## 文件说明

- `manifest.yaml`：记录固定源码、运行时、前端构建方式、单容器拓扑、镜像和交付命令。
- `source/`：后端固定 commit、独立前端固定 commit、源码元数据和源码校验和。
- `docker/`：最终 all-in-one Dockerfile、兼容名称的 `standalone.Dockerfile` 和单服务 Compose 辅助配置；Compose 不是启动前提。
- `resources/`：用户、角色、应用配置、真实登录/注册脚本和 MySQL 初始 seed。
- `scripts/`：镜像构建、容器入口、辅助启动、健康检查和重置脚本。
- `image/`：保存最终 `linux/amd64` all-in-one 镜像的元数据和校验和；镜像本体发布在 Docker Hub，GitHub 不保存大 tar 归档。

源码固定为后端 `23c8c608af9da8f08bca5c62d096d4253bcce93f`，前端 `94459770d622303802c465510b1124ab794a6338`。运行时不下载源码、依赖、初始化组件或核心远程资源。
