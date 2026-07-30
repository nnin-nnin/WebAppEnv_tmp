# Monica 4.1.2 原生多容器 Docker Compose 环境

本目录交付 Monica 4.1.2 的完整 Web 应用环境。后端源码固定为
`https://github.com/monicahq/monica.git` commit
`50c266f7beb9d8fe6cd8c8929a759529275143f`，部署模式是
`native_compose`。

这是原生多容器 Docker Compose 环境，不是 all-in-one 单容器环境。应用、Nginx
Web 入口、数据库、Redis、定时任务、队列 worker 和 MailHog 分别运行在独立容器
中。Compose 会创建项目网络，应用通过 `db`、`redis`、`mail` 等 Compose service
name 访问依赖服务。接收者不需要手动创建 Docker 网络，不需要手动安装数据库，
也不需要手动导入 SQL。

## 前置条件

- Docker Engine 24 或更高版本，Docker Compose v2。
- 目标平台为 `linux/amd64`。当前交付在 ARM64 主机上也可以由 Docker 运行，可能出现
  平台不匹配警告；该警告不代表服务失败。
- 宿主机可以访问 Docker 镜像仓库以完成首次构建或镜像归档获取；使用本地归档启动
  时，运行阶段不需要访问外部包仓库。
- 宿主机端口 `18086` 和 `18087` 未被占用。

## 启动

本应用是 `native_compose` 类型，不是 all-in-one 单容器应用。标准方式从 Docker Hub
获取自建的 app/web 镜像，并由 Compose 拉取 MariaDB、Redis 和 MailHog 官方镜像：

```bash
cd applications/monica_4.1.2
docker compose -f docker/compose.yaml pull
bash scripts/up.sh
```

`scripts/up.sh` 会等待 7 个 Compose service 全部健康后返回。接收者不需要构建源码、
手动创建数据库或运行 Composer、npm、Yarn。

如果使用的是包含本地归档的构建工作目录，也可以先校验并加载全部服务镜像：

```bash
cd applications/monica_4.1.2
sha256sum -c image/SHA256SUMS
docker load -i image/monica-app-4.1.2-linux-amd64.tar
docker load -i image/monica-web-4.1.2-linux-amd64.tar
docker load -i image/mariadb-11.4.2-linux-amd64.tar
docker load -i image/redis-7.2.5-linux-amd64.tar
docker load -i image/mailhog-1.0.1-linux-amd64.tar
```

也可以使用已经验收过的加载脚本，它会先校验 `image/SHA256SUMS`，任一归档失败
都会返回非零退出码：

```bash
bash scripts/load-images.sh
```

然后使用 Compose 启动全部服务：

```bash
docker compose -f docker/compose.yaml up -d
```

推荐使用带健康等待和失败诊断的包装脚本：

```bash
bash scripts/up.sh
```

## 访问和账号

- 浏览器入口：<http://localhost:18086/>
- 登录页：<http://localhost:18086/login>
- 登录后预期页面：`/dashboard`，显示 Monica 的 Dashboard、People、Journal 等业务菜单。
- API 根地址：<http://localhost:18086/api>；API 使用 Monica 自身的认证机制，
  OAuth 入口为同源的 `/oauth/token`。本交付不另设宿主机 API 服务。
- 初始管理员请求名：`admin`。
- Monica 实际登录用户名：`admin@example.com`。
- 初始密码：`benchmark-only`。
- 角色用途：首个 Monica account 的管理员用户，拥有该 account 的完整业务管理权限。

Monica 4.1.2 的注册校验要求登录标识是合法邮箱，因此不能把字面量 `admin` 作为
用户名。`admin@example.com` 是与请求名 `admin` 对应的固定基准账号，已在
`resources/users.yaml` 中记录。应用容器启动时使用 Monica 官方支持的
`php artisan account:create` 命令创建该账号；如果账号已经存在，启动不会重复创建
或覆盖数据。

## 服务拓扑

| Compose service | 固定镜像 | 职责 | 对外端口 |
| --- | --- | --- | --- |
| `app` | `yorem/sop-monica-app:4.1.2` | Monica PHP-FPM 应用、迁移和初始化 | 不映射 |
| `web` | `yorem/sop-monica-web:4.1.2` | Nginx 静态资源和 FastCGI Web 入口 | `18086:80` |
| `db` | `mariadb:11.4.2` | Monica 主数据库 | 不映射 |
| `redis` | `redis:7.2.5-alpine` | 缓存、session 和 Redis queue | 不映射 |
| `cron` | `yorem/sop-monica-app:4.1.2` | Monica schedule worker | 不映射 |
| `queue` | `yorem/sop-monica-app:4.1.2` | Monica Redis queue worker | 不映射 |
| `mail` | `mailhog/mailhog:v1.0.1` | 本地 SMTP 捕获和邮件调试界面 | `18087:8025` |

`cron` 和 `queue` 复用同一个固定 app 镜像，但它们是独立的 Compose 容器和进程，
不是把多个核心服务塞进一个容器。应用、数据库和 Redis 使用 named volume 保存状态。
Compose 通过健康条件表达启动顺序；应用入口仍会重试数据库连接并执行 Monica 官方
迁移流程。

## 验证

先执行脚本语法和 Compose 配置检查：

```bash
bash -n scripts/*.sh resources/*.sh
docker compose -f docker/compose.yaml config --quiet
```

启动后执行完整服务、HTTP 页面和真实登录检查：

```bash
bash scripts/healthcheck.sh
APP_URL=http://localhost:18086 bash resources/login.sh
```

`healthcheck.sh` 会检查七个服务均处于 `running/healthy`，跟随根路径重定向并确认
真实 Monica 登录页面，再调用 `resources/login.sh` 检查管理员登录后 dashboard 页面。

使用 Monica 真实支持的 CLI 创建普通用户，不伪造一个通用注册 API：

```bash
bash resources/register.sh benchmark-user@example.com benchmark-user-password Benchmark User
APP_URL=http://localhost:18086 \
  APP_USERNAME=benchmark-user@example.com \
  APP_PASSWORD=benchmark-user-password \
  bash resources/login.sh
```

`APP_DISABLE_SIGNUP=true` 是交付配置，公共注册页面在首个账号创建后关闭。普通用户
通过 `php artisan account:create` 创建，脚本使用 `docker compose exec -T app` 按 service
name 定位应用容器，不依赖手工容器名。

检查服务和日志：

```bash
docker compose -f docker/compose.yaml ps
docker compose -f docker/compose.yaml logs --tail=100 app web db redis cron queue mail
```

重启后再次验证数据和账号：

```bash
docker compose -f docker/compose.yaml restart
bash scripts/healthcheck.sh
APP_URL=http://localhost:18086 bash resources/login.sh
```

## 重置

下面的脚本只操作 `monica_4_1_2` Compose 项目，会停止并删除该项目的容器、网络和
named volumes；数据库、session、上传文件、Passport 密钥和管理员账号都会被删除，
不能恢复。它不会删除其他 Compose 项目、镜像或宿主机目录：

```bash
bash scripts/reset.sh
bash scripts/up.sh
```

## 版本和镜像来源

交付方式是 `REGISTRY_WITH_LOCAL_ARCHIVE`。标准启动从 Docker Hub 使用
`yorem/sop-monica-app:4.1.2` 和 `yorem/sop-monica-web:4.1.2`；服务清单、镜像 ID/digest
和本地归档路径见 `image/image.json`。构建工作目录还可以使用 `image/` 中的本地归档，
其 SHA256 见 `image/SHA256SUMS`。app 镜像和 web 镜像从固定后端源码构建；数据库、
Redis、MailHog 使用固定 tag 的官方镜像。所有最终服务均声明 `linux/amd64`。

构建定义中的 Composer、Node 和 PHP 依赖只在 `scripts/build.sh` 的镜像构建阶段
使用。接收者的标准启动流程不会运行 Composer、npm、Yarn 或其他依赖下载，也不会在
容器启动时下载依赖。前端静态资源已经构建进 app/web 镜像，不依赖运行时 CDN 或
宿主机开发服务器。

## 文件说明

- `manifest.yaml`：应用类型、native Compose 拓扑、固定源码、服务、镜像、卷、脚本、
  交付方式、差异和残余风险。
- `source/`：固定 commit 的 Monica 后端源码、来源元数据和 `source/SHA256SUMS`。
  Monica 的前端与后端同仓库，没有独立前端仓库。
- `docker/`：最终唯一 Compose 文件、固定源码构建 Dockerfile、Nginx 配置和官方
  4.x entrypoint/cron/queue 脚本。
- `resources/`：用户、角色、登录、普通用户创建脚本及 Compose 使用的 benchmark secrets。
  本应用不需要 `database-seed.sql`，首次 schema 由官方 `monica:update` 迁移完成。
- `scripts/`：镜像构建、镜像加载、启动、健康检查和重置脚本。
- `image/`：Docker Hub 服务镜像元数据；构建工作目录可额外保存五个独立的
  `linux/amd64` 服务镜像归档和 SHA256 校验文件。归档 tar 不提交到 GitHub。

## 官方 Compose 与交付 Compose 的差异

官方后端仓库的 `docker-compose.dev.yml` 明确标注为 development only，定义了
源码 bind mount 的 `app`、`mysql:8`、未固定 tag 的 `phpmyadmin` 和 MailHog。它适合
开发，不足以直接作为可复现交付。官方 `monicahq/docker` 仓库的 4.x `full` 示例提供
了本交付采用的 `fpm + nginx + db + redis + cron + queue` 多容器边界。

交付 Compose 做了以下可追溯修改：

1. 将开发 Compose 合并整理为唯一入口 `docker/compose.yaml`，并采用官方 4.x full
   示例的 app/web/db/redis/cron/queue 拓扑。
2. 用固定后端 commit 构建 app 镜像，而不是直接使用官方 v4.1.2 release tar；这是
   为了满足本任务指定的 `50c266f7...` commit。
3. 将 `mysql:8` 替换为官方 full 示例使用的 MariaDB 服务，并固定为 `11.4.2`；将
   Redis 固定为 `7.2.5-alpine`，避免 `latest` 或浮动 tag。
4. 删除开发专用 phpMyAdmin、源码 bind mount 和 `container_name`；数据库、缓存和
   应用状态改用 named volumes。
5. 增加 `depends_on` 健康条件、服务 healthcheck、固定 `linux/amd64` platform 和
   180 秒启动诊断。
6. 使用 Compose file secrets 传递 app key、hash salt 和数据库密码，避免把这些值
   写入 Compose environment；它们是 benchmark-only 的本地 secrets，不是生产凭据。
7. 将官方默认的外部 SMTP 改为 Compose 内的 MailHog，避免核心运行依赖外部邮件服务；
   MailHog UI 仅用于验证，地址为 <http://localhost:18087/>。
8. 关闭 `CHECK_VERSION`、天气和地理定位等可选外部功能；应用登录、dashboard、数据
   库迁移和核心前端静态资源不依赖远程 URL。
9. 增加幂等的首个管理员创建步骤。它调用 Monica 自己的 `account:create` CLI，首次
   启动创建账号，后续重启只检查账号存在性。

## 已知限制和残余风险

- 这是 benchmark-only 的可复现环境，不是生产安全配置。Compose secrets 文件中的
  密钥是交付目录内的固定测试值，部署到生产前必须替换并重新生成 app key、hash salt
  和数据库密码。
- 当前平台目标是 `linux/amd64`；ARM64 主机依赖 Docker 的跨架构运行能力，性能取决于
  宿主机的虚拟化实现。
- Monica 4.1.2 的登录名必须是邮箱，所以请求的 `admin` 通过
  `admin@example.com` 实现，不能使用单独的 `admin` 字符串。
- MailHog 不发送真实邮件；邮件只保存在 MailHog 容器内，删除卷或重置项目后不保留。
- 官方应用仍包含用户主动触发的外部链接和可选功能文档链接；它们不是核心启动依赖。
- 本交付不包含外部对象存储、真实 SMTP、天气 API、地理定位 API 或搜索服务；固定
  commit 的 Monica 4.1.2 默认不要求搜索服务才能使用主要联系人和 dashboard 功能。
