# GitLab 16.11.2-ce.0 应用环境

这是 GitLab 16.11.2-ce.0 的完整 Web 应用 all-in-one 环境，目标平台为 `linux/amd64`。最终镜像为单镜像、单容器；镜像内部包含 GitLab Web 应用、NGINX、Puma、Sidekiq、PostgreSQL、Redis、Gitaly 及初始化逻辑。

## 启动

从应用环境仓库根目录执行：

```bash
cd applications/gitlab/16.11.2-ce.0
docker compose -f docker/compose.yaml up -d
```

Docker 会自动从 Docker Hub 拉取镜像。镜像内部已经包含应用、数据库、初始化和启动逻辑，不需要执行 `build.sh`、bootstrap 脚本或 Web Installer，也不需要单独启动数据库。

## 访问和账号

- 浏览器入口：`http://127.0.0.1:18528/`
- 登录后预期进入 GitLab 的项目/组导航和应用首页，而不是状态页或 API 文档。
- 初始管理员用户名：`admin`
- 角色：实例管理员（Administrator）
- 初始管理员密码：`WcGit!26-lP4yN8C`。该密码由容器启动时的 `GITLAB_INITIAL_ADMIN_PASSWORD` 注入；运行时需传入该环境变量，默认已由 compose.yaml 配置。

## 验证

宿主机 HTTP 验证：

```bash
GITLAB_URL=http://127.0.0.1:18528 ./scripts/healthcheck.sh
```

真实登录接口验证：

```bash
GITLAB_URL=http://127.0.0.1:18528 GITLAB_USERNAME=admin GITLAB_PASSWORD='WcGit!26-lP4yN8C' ./resources/login.sh
```

普通用户创建使用 GitLab 已验证的 REST API，需要管理员在受控渠道提供 API token：

```bash
GITLAB_URL=http://127.0.0.1:18528 GITLAB_ADMIN_TOKEN='<GitLab 个人访问令牌>' \
  ./resources/register.sh ordinary ordinary@example.invalid
```

## 重置

重置是破坏性操作：

```bash
./scripts/reset.sh
```

脚本会停止并删除本交付容器及其命名卷。删除后按“启动”章节重新执行 `docker compose up -d`，应用会重新初始化。

## 文件说明

- `manifest.yaml`：应用、源码、运行时、镜像和脚本元数据。
- `source/`：仅保存上游仓库链接和固定 commit 哈希的 `source.yaml`；源码快照不随本目录交付。
- `docker/`：最终镜像 Dockerfile 与单服务 Compose 辅助配置。
- `resources/`：用户/角色说明、真实登录和注册辅助脚本。
- `scripts/`：构建、入口、宿主机健康检查、启动辅助和重置脚本。
- `image/`：仅保存镜像元数据 `image.json`；镜像本体从 Docker Hub 获取，tar 和校验和不提交到仓库。
