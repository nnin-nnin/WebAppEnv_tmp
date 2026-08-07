# WordPress 6.5.3 应用环境

这是固定源码 commit `c54b7021fe1ad22ff3ce2b61dd741b3d7e71596a` 构建的完整 Web 应用环境，目标平台为 `linux/amd64`。最终交付是单镜像、单容器 all-in-one 镜像 `asteriskax001/sop-wordpress:6.5.3`，内部包含 WordPress 6.5.3、PHP 8.2、Apache 和 MariaDB。

## 启动

从应用环境仓库根目录执行：

```bash
cd applications/wordpress/6.5.3
docker run -d -p 18513:80 asteriskax001/sop-wordpress:6.5.3
```

接收者只需要执行 `docker run`，Docker 会自动从 Docker Hub 拉取镜像。镜像内部已经包含应用、PHP、Apache、MariaDB、数据库初始化、管理员初始化和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap 脚本、数据库脚本或 Web Installer。

## 访问和账号

- 浏览器前台：<http://127.0.0.1:18513/>
- 管理后台：<http://127.0.0.1:18513/wp-admin/>
- 初始用户名：`admin`
- 初始角色：Administrator
- 初始密码：`WcWord!26-aQ6nT3F`

浏览器打开前台可看到真实 WordPress 页面，登录后进入 Dashboard，并可使用文章、媒体、页面、评论、外观和用户菜单。

## 验证

宿主机健康检查使用公开 HTTP 入口，默认地址不是容器内路径：

```bash
WORDPRESS_URL=http://127.0.0.1:18513 ./scripts/healthcheck.sh
```

使用真实 WordPress 登录表单验证管理员账号：

```bash
WORDPRESS_URL=http://127.0.0.1:18513 WORDPRESS_USER=admin WORDPRESS_PASSWORD='WcWord!26-aQ6nT3F' ./resources/login.sh
```

创建普通用户使用 WordPress 内部用户 API（容器内执行，角色为 Subscriber）：

```bash
WORDPRESS_CONTAINER=<容器名或ID> ./resources/register.sh reader 'Verify-User-2026!' reader@example.local Reader
```

## 重置

重置会删除该容器内的 WordPress 数据库并触发容器重启，应用随后自动恢复初始站点和 `admin` 账号；`wp-content` 文件不删除：

```bash
WORDPRESS_CONTAINER=<容器名或ID> ./scripts/reset.sh
```

## 文件说明

- `manifest.yaml`：固定版本、源码、运行时、镜像和操作入口。
- `source/`：仅保存上游仓库链接和固定 commit 哈希的 `source.yaml`；源码快照不随本目录交付。
- `docker/`：最终 Dockerfile、standalone Dockerfile 和单 service Compose 辅助配置。
- `resources/`：账号角色说明以及真实登录、用户创建辅助脚本。
- `scripts/`：镜像构建、启动、入口、宿主机健康检查和重置脚本。
- `image/`：仅保存镜像元数据 `image.json`；镜像本体从 Docker Hub 获取，tar 和校验和不提交到仓库。
