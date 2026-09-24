# WordPress 4.7.4

这是 NAVEX 论文中使用的 WordPress 4.7.4 固定版本Application Environment，交付形式为已经构建好的 `linux/amd64` all-in-one Docker 镜像。

## Quick Start

Execute directly from any directory:

```bash
docker run -d \
  --platform linux/amd64 \
  --name wordpress-4.7.4 \
  -p 18084:80 \
  yorem/wordpress:4.7.4
```

镜像内已经包含 Apache、PHP 7.4、MariaDB 10.5、WordPress 4.7.4、应用配置和初始数据库。容器启动时会自动启动数据库和 Web server，并完成 WordPress 安装；不需要执行 `build.sh`、Compose、bootstrap 脚本或 Web Installer。

Docker automatically pulls images from Docker Hub if not locally present. Immutable image digests are recorded in `image/image.json`.

## Access & Credentials

- URL: <http://localhost:18084>
- Admin Username: `admin`
- Admin Password: `benchmark-only`
- 编辑用户名：`editor`
- 订阅者用户名：`subscriber`
- 编辑和订阅者密码：`benchmark-only`

这些都是本地 benchmark 账号，不是生产账号。

## Verification

After application starts, execute from the application directory:

```bash
./scripts/healthcheck.sh
```
