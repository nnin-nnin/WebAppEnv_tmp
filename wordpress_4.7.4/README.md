# WordPress 4.7.4

这是 NAVEX 论文中使用的 WordPress 4.7.4 固定版本应用环境，交付形式为已经构建好的 `linux/amd64` all-in-one Docker 镜像。

## 启动

在任意目录直接执行：

```bash
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

这些都是本地 benchmark 账号，不是生产账号。

## 验证

应用启动后，在应用目录执行：

```bash
./scripts/healthcheck.sh
```
