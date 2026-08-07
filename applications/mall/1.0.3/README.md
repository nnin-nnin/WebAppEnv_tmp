# mall 1.0.3 应用环境

本目录交付 `mall` 1.0.3 的完整后台 Web 应用环境。后端固定为 `macrozheng/mall` commit `dd617ac3fe89c8083af56bee3364b1e812cda3ed`，前端固定为 `macrozheng/mall-admin-web` tag `v1.0.0`、commit `2e4a79f10ed55bda7e5452026e76b6f85e87e053`。最终产物是 `linux/amd64` 的单镜像、单容器 all-in-one 环境，镜像为 `nnin/sop-mall:1.0.3`。

镜像内部包含 mall-admin-web 前端静态文件、Java 8、Spring Boot 内置 Tomcat、mall-admin、MariaDB、Redis、初始化 SQL、配置和初始账号。接收者只需要执行 `docker load` 和 `docker run`，不需要执行 `build.sh`、Docker Compose、bootstrap 脚本、数据库初始化脚本、Web Installer 或单独的数据库容器。

## 启动

从仓库根目录进入本应用目录，并校验最终归档：

```bash
cd applications/mall/1.0.3
sha256sum -c image/SHA256SUMS
docker load -i image/mall-1.0.3-linux-amd64.tar
docker run -d -p 18085:80 nnin/sop-mall:1.0.3
```

启动后，MariaDB 和 Redis 由镜像内部入口程序自动启动，数据库和用户初始化只在首次使用对应数据卷时执行。宿主机是 ARM64 时 Docker 可能提示 `linux/amd64` 平台不匹配；只要容器能启动并通过下面的 HTTP/API 检查，该提示不影响本交付物。

## 访问和账号

- 地址：<http://localhost:18085/>
- 浏览器入口：<http://localhost:18085/>
- 初始用户名：`admin`
- 初始密码：`123456`
- 角色：超级管理员，拥有 mall-admin 全部后台 API 权限
- 登录接口：`POST /admin/login`
- 注册接口：`POST /admin/register`

根路径提供真实的 mall-admin-web 管理后台登录页面，登录后进入 mall 管理首页。前端通过同源路径访问同一容器内的 mall-admin API。

## 验证

在应用目录执行脚本语法检查：

```bash
bash -n scripts/*.sh
```

容器启动后执行 HTTP、Actuator 和管理员 JWT 登录检查：

```bash
MALL_URL=http://localhost:18085 bash scripts/healthcheck.sh
MALL_URL=http://localhost:18085 MALL_ADMIN_USERNAME=admin MALL_ADMIN_PASSWORD=123456 bash resources/login.sh
```

使用浏览器验收真实前端：

1. 打开 <http://localhost:18085/>；
2. 确认页面显示 `mall-admin-web` 登录界面；
3. 输入用户名 `admin` 和密码 `123456`；
4. 点击“登录”；
5. 确认登录后进入 mall 管理首页并显示后台菜单。

使用应用真实注册接口创建普通后台账号。注册接口在 mall 源码中是公开接口，脚本不伪造其他应用的认证方式：

```bash
MALL_URL=http://localhost:18085 bash resources/register.sh benchmark-user-1 benchmark-pass-1 benchmark-user-1@example.com
```

检查同一容器内的核心进程和日志：

```bash
docker ps
docker exec <container-id-or-name> sh -c 'ps -eo pid,comm,args | grep -E "(java|mysqld|redis-server)" | grep -v grep'
docker logs <container-id-or-name>
```

验证容器重启后的恢复：

```bash
docker restart <container-id-or-name>
MALL_URL=http://localhost:18085 bash scripts/healthcheck.sh
```

## 重置

`scripts/up.sh` 使用固定名称和 Docker volumes，适合需要明确持久化数据的本地运行。重置该辅助启动方式创建的容器和数据卷：

```bash
bash scripts/reset.sh
bash scripts/up.sh
```

直接使用上面的最简 `docker run` 时，如果没有显式指定容器名，先将容器名或 ID 传给重置脚本；脚本会同时删除该容器的匿名卷：

```bash
MALL_CONTAINER=<container-id-or-name> bash scripts/reset.sh
docker run -d -p 18085:80 nnin/sop-mall:1.0.3
```

重置会删除 mall 专用数据库、Redis 和日志卷，不能恢复被删除的数据。

## 文件说明

- `manifest.yaml`：记录固定源码、运行时、all-in-one 拓扑、镜像、归档、资源和脚本索引。
- `source/`：仅保存 mall 后端和 mall-admin-web 前端的 GitHub 仓库链接及固定 commit 哈希，见 `source/source.yaml`；源码快照不随本目录交付。
- `docker/`：保存编译阶段 Dockerfile、最终 all-in-one Dockerfile 和单服务 Compose 辅助配置。
- `resources/`：保存用户、角色、真实登录/注册脚本、应用配置和数据库 seed。
- `scripts/`：保存镜像构建、入口进程监督、辅助启动、健康检查和重置脚本。
- `image/`：保存唯一最终镜像的 `linux/amd64` tar、镜像元数据和 SHA256 校验文件。

最终 tar 只导出 `nnin/sop-mall:1.0.3`，不包含基础编译镜像、独立数据库镜像或其他应用镜像；前端静态文件已经包含在最终镜像中。
