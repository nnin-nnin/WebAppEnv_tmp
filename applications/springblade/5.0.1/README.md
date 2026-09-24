# SpringBlade

本应用环境是 SpringBlade 5.0.1 版本的 all-in-one `linux/amd64` 镜像环境。前端采用 Saber，后端采用 SpringBlade-boot；Java 21、MySQL 8、Redis 和 Nginx 已集成在同一个容器中。当前镜像已上传到 Docker Hub，并通过首次冷启动、重启、管理员登录和普通用户创建验收。

## 启动

推荐使用 Docker Hub 固定 digest 启动：

```bash
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d
```

也可以使用随交付物提供的 `linux/amd64` 归档：

```bash
docker load -i image/springblade-5.0.1-linux-amd64.tar
docker run -d --platform linux/amd64 --name springblade-all-in-one -p 8080:80 yorem/springblade:5.0.1@sha256:fd84a9b745d7928818e89ca3ee64ff6dab8c7c6c550666071485d836f0cc2509
```

不需要执行源码构建、手动安装数据库、导入 SQL 或创建网络；容器首次启动时会自动初始化 MySQL 和应用数据。该交付明确采用 all-in-one 单容器方案，应用服务、数据库、Redis 和 Nginx 不拆分为独立容器。

## 访问和账号

- **前端地址**：`http://127.0.0.1:8080`
- **后端 API**：`http://127.0.0.1:8080/api/`
- **初始管理员账号**：`admin`
- **初始管理员密码**：`admin`
- **租户ID**：`000000`
- **Docker Hub 镜像**：`yorem/springblade:5.0.1@sha256:fd84a9b745d7928818e89ca3ee64ff6dab8c7c6c550666071485d836f0cc2509

## 验证

验证应用状态和 API 可用性：

```bash
bash scripts/healthcheck.sh
bash resources/login.sh 8080 admin admin
bash resources/register.sh 8080 testuser testpass
docker compose -f docker/compose.yaml ps
```

## 重置

如需重置当前项目容器和数据：

```bash
bash scripts/reset.sh
```

## 文件说明

- `manifest.yaml`: 部署记录和配置清单。
- `source/`: 包含后端（SpringBlade）和前端（Saber）的固定 commit 信息。
- `docker/`: 构建用的 Dockerfile 和 Nginx 配置文件。
- `resources/`: 存放用户账号、角色配置、测试脚本及数据库种子 `initial-data/database-seed.sql`。
- `scripts/`: 构建、启动、重置和健康检查的运维脚本。
- `image/`: 构建生成的 all-in-one 镜像压缩包及其校验文件。

## 交付和验证记录

- 源码固定 commit：SpringBlade `e4c98e4f8c07e57f16ece5ea50d00a697515d1eb`，Saber `8da0528a1dd3849c052a129d032430bf6ebdaeb3`。
- 目标平台：`linux/amd64`。
- 镜像 digest：`sha256:fd84a9b745d7928818e89ca3ee64ff6dab8c7c6c550666071485d836f0cc2509`。
- 本地归档校验值见 `image/SHA256SUMS`。
- 已验证：首次启动主页 HTTP 200、MySQL/Redis 可用、管理员登录、普通用户创建、重启后再次登录，以及容器未被 OOM 杀死。
