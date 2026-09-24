# AtroPIM 489afea

这是 AtroPIM `489afea` 固定提交的应用环境，交付形式为已经构建好的 `linux/amd64` all-in-one Docker 镜像。

## 启动

在任意目录直接执行：

```bash
docker run -d \
  --platform linux/amd64 \
  --name atropim-489afea \
  -p 18083:80 \
  yorem/atropim:489afea
```

镜像内已经包含 Apache、PHP 7.4、MariaDB 10.5、AtroPIM 固定源码和 Composer 依赖、应用配置及初始数据库。容器首次启动时会自动初始化数据库和管理员，并启动数据库、Web server 和 cron；不需要执行 `build.sh`、Compose 或 Web Installer。

Docker 会在本机没有镜像时自动从 Docker Hub 拉取。精确的不可变镜像 digest 记录在 `image/image.json`。

## 访问和账号

- 地址：<http://localhost:18083>
- 用户名：`admin`
- 密码：`benchmark-only`
- 角色：`administrator`

这是本地 benchmark 账号，不是生产账号。

## 验证

应用启动后，在应用目录执行：

```bash
./scripts/healthcheck.sh
```
