# EspoCRM 8.2.5

这是 EspoCRM 8.2.5 的固定版本应用环境，交付形式为已经构建好的 `linux/amd64` all-in-one Docker 镜像。

## 启动

在仓库根目录执行：

```bash
cd espocrm_8.2.5
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

这是本地 benchmark 账号，不是生产账号。账号定义位于 `resources/users.yaml`，但正常登录不需要先查阅该文件。

## 验证

应用启动后，在应用目录执行：

```bash
./scripts/healthcheck.sh
```

单独验证默认账号：

```bash
./resources/login.sh
```

创建普通测试用户：

```bash
./resources/register.sh test-user test-password
```

## 重置

删除容器及其运行状态：

```bash
./scripts/reset.sh
```

重置后重新执行“启动”部分的 `docker run` 命令即可恢复到初始环境。

## 文件说明

- `manifest.yaml`：应用版本、源码、运行时、镜像和脚本索引。
- `source/`：固定版本源码。
- `docker/`：Dockerfile 和 Compose 配置。
- `resources/`：初始数据、用户角色、登录和注册脚本。
- `scripts/`：构建、启动辅助、健康检查、重置和镜像入口脚本。
- `image/`：Docker Hub 已发布镜像的名称、tag、digest 和平台元数据。
