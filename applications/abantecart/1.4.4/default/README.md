# AbanteCart 1.4.4 应用环境 (Compose)

本文档说明如何运行和验证 AbanteCart 1.4.4 可复现应用环境。

## 1. 环境说明

- **应用名称**：AbanteCart
- **应用版本**：1.4.4 (最新版本)
- **源码 Commit**：`051a50f373fad8c8955800f881e08f2f7620600e`
- **部署方式**：Docker Compose 多容器 (PHP 8.2 Apache + MariaDB 10.6)
- **对外端口**：`18001`

## 2. 启动方式

进入当前应用环境目录并启动：

```bash
cd applications/abantecart/1.4.4/default
./scripts/up.sh
```

或直接执行 Docker Compose 命令：

```bash
docker compose -f docker/compose.yaml up -d
```

## 3. 访问与账号信息

- **前台商城地址**：`http://localhost:18001`
- **后台管理地址**：`http://localhost:18001/index.php?s=admin`
- **管理员账号**：`admin`
- **管理员密码**：`benchmark-only`

## 4. 验证方法

执行自动化健康检查与登录测试：

```bash
./scripts/healthcheck.sh
```

或单独运行登录测试：

```bash
./resources/login.sh
```

## 5. 数据重置

重置所有容器及持久化数据：

```bash
./scripts/reset.sh
```

## 6. 目录结构与文件说明

- `manifest.yaml`：描述应用版本、源码 Commit、端口及脚本索引
- `source/source.yaml`：固定的 upstream GitHub 源码仓库链接与 Commit
- `docker/`：包含 Dockerfile 与 compose.yaml 服务拓扑定义
- `resources/`：包含管理员账号角色定义及 login.sh / register.sh 自动化验证脚本
- `scripts/`：包含一键启动 up.sh、健康检查 healthcheck.sh 及重置 reset.sh 脚本
