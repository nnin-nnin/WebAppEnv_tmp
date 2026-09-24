# phpBB 3.3.17

这是一个保留了原生多容器 Docker Compose 拓扑的 phpBB 环境交付物，并非 all-in-one 单容器环境。

## 前置条件
- Docker Engine 和 Docker Compose v2 可用。
- 主机架构：linux/amd64（如果为 ARM64 可能会有平台警告但仍可运行）。

## 启动指南

本环境采用 `DOCKERHUB` 交付，应用镜像为 `yorem/phpbb:3.3.17`，接收者无需重新构建源码或加载本地归档。应用、数据库分别运行在独立的容器中，并通过 Compose 自动创建的项目网络进行通信。

1. **拉取固定版本镜像：**
   ```bash
   docker compose -f docker/compose.yaml pull
   ```

2. **启动环境：**
   ```bash
   bash scripts/up.sh
   ```

启动后，`up.sh` 将自动拉起所有服务，并等待状态变更为 healthy。由于应用容器启动时会根据环境变量自动连接并在首次启动时执行自动初始化（自动建表、生成配置文件并创建初始管理员），因此**接收者不需要手动创建 Docker 网络、安装数据库或导入 SQL**。

## 访问和账号
- **浏览器入口：** [http://127.0.0.1:38080](http://127.0.0.1:38080)
- **初始管理员账号：** `admin`
- **初始管理员密码：** `adminpassword`

## 服务说明
- `application`: 运行 PHP 8.3 与 Apache2 以及 phpBB 3.3.17 代码的独立应用容器。
- `db`: 运行 MySQL 8.0.35 数据库的独立容器。

## 验证
验证应用是否正常工作以及依赖连接是否健康：
```bash
bash scripts/healthcheck.sh
bash resources/login.sh
bash resources/register.sh
```

## 重置环境
仅删除当前 Compose 项目的容器和网络，并保留构建好的镜像以及所有挂载了数据的数据卷：
```bash
bash scripts/reset.sh
```
*(注意：目前 `reset.sh` 中执行了 `docker compose down -v` 会清理命名卷。如需保留数据请自行移除 `-v` 参数)*

## 官方 Compose 与交付 Compose 的差异
- 官方项目在根目录下只提供 `.devcontainer`，并未提供面向生产的官方 Compose，因此本项目自行编写了基于 `php:8.3-apache` 的 Dockerfile，并编写了符合规范的 `docker/compose.yaml` 文件。
- 为保证接收者的自动部署体验，我们通过 `docker-entrypoint.sh` 的方式包装，使其在第一次运行时自动等待数据库准备就绪，并调用 `phpbbcli.php install` 静默安装 phpBB，免去了浏览器界面点按安装的操作。
- 对外端口映射到了 8080。
