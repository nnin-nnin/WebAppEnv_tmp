# AtroPIM 489afea

这是 AtroPIM `489afea` 固定提交的Application Environment，交付形式为已经构建好的 `linux/amd64` all-in-one Docker 镜像。

## Quick Start

Execute directly from any directory:

```bash
docker run -d \
  --platform linux/amd64 \
  --name atropim-489afea \
  -p 18083:80 \
  yorem/atropim:489afea
```

镜像内已经包含 Apache、PHP 7.4、MariaDB 10.5、AtroPIM 固定源码和 Composer 依赖、应用配置及初始数据库。容器首次启动时会自动初始化数据库和管理员，并启动数据库、Web server 和 cron；不需要执行 `build.sh`、Compose 或 Web Installer。

Docker automatically pulls images from Docker Hub if not locally present. Immutable image digests are recorded in `image/image.json`.

## Access & Credentials

- URL: <http://localhost:18083>
- Username: `admin`
- Password: `benchmark-only`
- Role: `administrator`

This account is intended solely for local benchmark evaluation, not for production.

## Verification

After application starts, execute from the application directory:

```bash
./scripts/healthcheck.sh
```
