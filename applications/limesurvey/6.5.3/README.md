# LimeSurvey 6.5.3 应用环境

本目录交付 LimeSurvey 6.5.3 的完整 Web 应用环境，固定源码 commit 为 `0eb5ddce58511fee183f7ed98096931e38e94939`，目标平台为 `linux/amd64`。最终产物是单镜像、单容器 all-in-one 环境：镜像内包含 LimeSurvey 真实浏览器管理界面、PHP、Apache、Composer 依赖、MariaDB、数据库初始化和启动逻辑。

## 启动

从应用环境仓库根目录执行：

```bash
cd applications/limesurvey/6.5.3
docker run -d -p 18517:80 asteriskax001/sop-limesurvey:6.5.3
```

接收者只需要执行 `docker run`，Docker 会自动从 Docker Hub 拉取镜像。镜像内部已经包含应用、数据库、初始化和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap 脚本、安装脚本、数据库脚本或 Web Installer。首次启动会在同一容器内初始化 MariaDB 和 LimeSurvey 数据库，可能需要等待一段时间。

## 访问和账号

- 浏览器登录入口：`http://127.0.0.1:18517/index.php?r=admin/authentication/sa/login`
- 登录后预期页面：LimeSurvey 管理首页，可看到 Surveys、配置、用户管理等真实应用导航和业务内容。
- 初始用户名：`admin`
- 初始角色：LimeSurvey 超级管理员（superadmin）。
- 初始密码：`WcLime!26-sP7yD2H`
- 应用后端入口：`http://127.0.0.1:18517/index.php`；本版本为服务端渲染 Web 应用，不依赖独立前端仓库或远程 API。

## 验证

宿主机公开 HTTP 健康检查使用 `LIMESURVEY_URL` 覆盖默认地址：

```bash
LIMESURVEY_URL=http://127.0.0.1:18517 ./scripts/healthcheck.sh
```

使用真实 LimeSurvey 管理登录页面验证管理员登录：

```bash
LIMESURVEY_URL=http://127.0.0.1:18517 LIMESURVEY_USERNAME=admin LIMESURVEY_PASSWORD='WcLime!26-sP7yD2H' ./resources/login.sh
```

LimeSurvey 没有面向匿名访客的普通用户注册接口。`resources/register.sh` 使用管理员真实登录后调用 LimeSurvey 的 `userManagement/applyEdit` 用户管理 POST 接口创建普通后台用户：

```bash
LIMESURVEY_PASSWORD='WcLime!26-sP7yD2H' LIMESURVEY_NEW_PASSWORD='Verify-User-2026!' ./resources/register.sh testuser testuser@example.invalid
```

## 重置

`reset.sh` 会删除匹配 LimeSurvey 镜像的目标容器及其匿名数据卷。执行后重新运行启动章节中的 `docker run` 命令：

```bash
LIMESURVEY_CONTAINER=<容器名或ID> ./scripts/reset.sh
docker run -d -p 18517:80 asteriskax001/sop-limesurvey:6.5.3
```

## 文件说明

- `manifest.yaml`：应用、固定源码、运行时、镜像、资源和脚本元数据。
- `source/`：仅保存上游仓库链接和固定 commit 哈希的 `source.yaml`；源码快照不随本目录交付。
- `docker/`：all-in-one Dockerfile、辅助 standalone Dockerfile 和单服务 Compose 配置；Compose 不是启动前置条件。
- `resources/`：账号、角色、真实登录脚本、真实用户创建脚本和应用初始配置。
- `scripts/`：构建、容器入口、宿主机健康检查、容器健康检查、启动和重置脚本。
- `image/`：仅保存镜像元数据 `image.json`；镜像本体从 Docker Hub 获取，tar 和校验和不提交到仓库。
