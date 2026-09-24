# Collabtive 0.8 原生多容器 Docker Compose 环境

这是一个保留官方服务拓扑结构的 Collabtive 0.8 多容器 Docker Compose 环境。该应用包含独立的数据库和应用服务器，并未合并为一个 all-in-one 容器。

## 前置条件
- Docker Engine
- Docker Compose v2
- 支持 linux/amd64 架构

## 启动方式

本环境采用 **DOCKERHUB** 交付方式，应用镜像已上传到 `yorem/collabtive:1.2@sha256:9d4e1521e31e7880407f151ae310c8d0c07be257d220b9c2a03f8c871a163e96

1. **拉取固定镜像**：
   ```bash
   docker compose -f docker/compose.yaml pull
   ```
2. **启动服务**：
   ```bash
   docker compose -f docker/compose.yaml up -d
   ```
3. 应用和数据库会分别在独立的容器中启动并连接，接收者**不需要手动创建 Docker 网络，也不需要手动导入 SQL**。数据库初始化已经通过 `database-seed.sql` 挂载实现。

## 访问与账号
- **浏览器入口**：[http://localhost:8080](http://localhost:8080)
- **初始管理员账号**：`admin`
- **初始管理员密码**：`123456`

## 服务说明
- `application`：应用容器，基于 PHP 5.6 和 Apache，提供 Collabtive Web 页面和 API。
- `db`：数据库容器，基于 MySQL 5.7，通过 Compose service name `db` 暴露给应用。

## 验证
可以使用配套脚本验证服务：
- 检查服务和 HTTP：`bash scripts/healthcheck.sh`
- 检查管理员登录：`bash resources/login.sh admin 123456`
- 创建普通用户：`bash resources/register.sh newuser newpass user@example.com`

## 重置
若需要彻底删除当前 Compose 项目的数据和环境：
```bash
bash scripts/reset.sh
```
这只会清理当前环境的容器、网络和命名卷，不会影响宿主机的其他项目。

## 差异说明
由于 Collabtive 是基于传统 PHP/MySQL 架构的软件，官方并没有提供 Docker Compose 配置文件。我们提供了一份标准的多容器 Compose 配置，以便能在现代容器环境中可靠地运行。
- 为满足“自动初始化”需求，提取了安装脚本的 SQL 转化为 `database-seed.sql` 供 MySQL 镜像的 standard entrypoint 使用。
- 添加了基础 `config.php`，以避免需要手工访问 `install.php` 导致的不稳定。
