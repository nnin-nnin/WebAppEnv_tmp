# EspoCRM 8.2.5

这是 EspoCRM 8.2.5 的固定版本应用环境，交付形式为已经构建好的 `linux/amd64` all-in-one Docker 镜像。

## 启动

在任意目录直接执行：

```bash
docker run -d \
  --platform linux/amd64 \
  --name espocrm-8.2.5 \
  -p 18092:80 \
  nnin/sop-espocrm:8.2.5
```

镜像内已经包含 Apache、PHP 8.2、MariaDB 10.6.27、EspoCRM 8.2.5、应用配置和初始数据库。容器启动时会自动启动数据库和 Web server，不需要执行 `build.sh`、`bootstrap.sh` 或 Web Installer。

Docker 会在本机没有镜像时自动从 Docker Hub 拉取。精确的不可变镜像 digest 记录在 `image/image.json`。

## 访问和账号

- 地址：<http://localhost:18092>
- 用户名：`admin`
- 密码：`benchmark-only`
- 角色：`administrator`

这是本地 benchmark 账号，不是生产账号。

## 验证

应用启动后，在应用目录执行：

```bash
./scripts/healthcheck.sh
```
