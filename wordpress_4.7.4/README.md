# WordPress 4.7.4

这是 NAVEX 论文中使用的 WordPress 4.7.4 固定版本应用环境，交付形式为已经构建好的 `linux/amd64` all-in-one Docker 镜像。

## 启动

在仓库根目录执行：

```bash
cd wordpress_4.7.4
docker run -d \
  --platform linux/amd64 \
  --name wordpress-4.7.4 \
  -p 18084:80 \
  nnin/sop-wordpress:4.7.4
```

镜像内已经包含 Apache、PHP 7.4、MariaDB 10.5、WordPress 4.7.4、应用配置和初始数据库。容器启动时会自动启动数据库和 Web server，并完成 WordPress 安装；不需要执行 `build.sh`、Compose、bootstrap 脚本或 Web Installer。

Docker 会在本机没有镜像时自动从 Docker Hub 拉取。精确的不可变镜像 digest 记录在 `image/image.json`。

## 访问和账号

- 地址：<http://localhost:18084>
- 管理员用户名：`admin`
- 管理员密码：`benchmark-only`
- 编辑用户名：`editor`
- 订阅者用户名：`subscriber`
- 编辑和订阅者密码：`benchmark-only`

这些都是本地 benchmark 账号，不是生产账号。账号与角色定义位于 `resources/`，但正常登录不需要先查阅这些文件。

## 验证

应用启动后，在应用目录执行：

```bash
./scripts/healthcheck.sh
```

单独验证管理员登录：

```bash
./resources/login.sh
```

创建一个普通订阅者：

```bash
./resources/register.sh test-user test-password test-user@example.test
```

## 重置

删除容器及其匿名运行状态：

```bash
./scripts/reset.sh
```

重置后重新执行“启动”部分的 `docker run` 命令即可恢复到初始环境。

## 文件说明

- `manifest.yaml`：应用版本、论文关联、源码、运行时、镜像和脚本索引。
- `source/`：WordPress 4.7.4 的固定版本源码、来源元数据和校验文件。
- `docker/`：all-in-one Dockerfile 和单服务 Compose 配置。
- `resources/`：初始用户角色、登录和普通用户创建脚本。
- `scripts/`：镜像构建、启动辅助、健康检查、重置和镜像入口脚本。
- `image/`：Docker Hub 已发布镜像的名称、tag、digest 和平台元数据。
