# EspoCRM 8.2.5

这是 EspoCRM 8.2.5 的固定版本Application Environment，交付形式为已经构建好的 `linux/amd64` all-in-one Docker 镜像。

## Quick Start

Execute directly from any directory:

```bash
docker run -d \
  --platform linux/amd64 \
  --name espocrm-8.2.5 \
  -p 18092:80 \
  yorem/espocrm:8.2.5
```

镜像内已经包含 Apache、PHP 8.2、MariaDB 10.6.27、EspoCRM 8.2.5、应用配置和初始数据库。容器启动时会自动启动数据库和 Web server，No need to execute `build.sh`, `bootstrap.sh`, or web installers.

Docker automatically pulls images from Docker Hub if not locally present. Immutable image digests are recorded in `image/image.json`.

## Access & Credentials

- URL: <http://localhost:18092>
- Username: `admin`
- Password: `benchmark-only`
- Role: `administrator`

This account is intended solely for local benchmark evaluation, not for production.

## Verification

After application starts, execute from the application directory:

```bash
./scripts/healthcheck.sh
```
