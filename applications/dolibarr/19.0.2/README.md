# Dolibarr 19.0.2 应用环境

这是固定源码 commit `f12378d732ff3f35ff0a5e5c8467fe522f7385ba` 构建的完整 Web 应用环境，目标平台为 `linux/amd64`。最终交付物是单镜像、单容器的 all-in-one 镜像 `yorem/dolibarr:19.0.2`，内部包含 Dolibarr、Apache、PHP 8.2 和 MariaDB 10.11。

## 启动

从应用环境仓库根目录执行：

```bash
cd applications/dolibarr/19.0.2
docker compose -f docker/compose.yaml up -d
```

接收者也可以使用 `scripts/up.sh` 启动，脚本会自动拉取并等待服务就绪。

## 访问和账号

- 浏览器入口：`http://localhost:18527/`
- 登录后预期进入 Dolibarr Home/仪表盘，可使用顶部菜单访问第三方、产品、商业、财务和管理等业务区域。
- 初始用户名：`admin`
- 初始密码：`WcDoli!26-gK8tP3Y`
- 角色：超级管理员（内部用户，拥有管理权限）。

## 验证

```bash
DOLIBARR_URL=http://localhost:18527 bash scripts/healthcheck.sh
DOLIBARR_PASSWORD='WcDoli!26-gK8tP3Y' bash resources/login.sh
bash resources/register.sh demo-user DemoUser 'Verify-User-2026!'
```

`login.sh` 使用 Dolibarr 真实的登录表单及 CSRF token。Dolibarr 没有公开的通用注册 API；`register.sh` 使用管理员会话访问真实的“创建内部用户”页面并提交其表单，参数为 `login lastname password [firstname]`。脚本不会回显密码。

## 重置

```bash
bash scripts/reset.sh
docker compose -f docker/compose.yaml up -d
```

重置会删除该容器的数据卷，不能恢复；需要保留数据时不要执行此命令，应先备份 Docker volume。

## 文件说明

- `manifest.yaml`：应用、源码、运行时、镜像和脚本元数据。
- `source/`：仅保存上游仓库链接和固定 commit 哈希的 `source.yaml`；源码快照不随本目录交付。
- `docker/`：Dockerfile 与单服务 Compose 辅助配置。
- `resources/`：用户、角色、登录和注册辅助文件；受控密码不落盘。
- `scripts/`：构建、入口、健康检查和重置等运维脚本。
- `image/`：仅保存镜像元数据 `image.json`；镜像本体从 Docker Hub 获取，tar 和校验和不提交到仓库。
