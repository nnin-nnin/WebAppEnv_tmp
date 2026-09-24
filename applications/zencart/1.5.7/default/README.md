# Zen Cart 1.5.7 应用环境 (Compose)

本文档说明如何运行和验证 Zen Cart 1.5.7 可复现应用环境。

## 1. 环境说明

- **应用名称**：Zen Cart
- **应用版本**：1.5.7
- **源码仓库**：`https://github.com/zencart/zencart`
- **源码 Commit**：`0ad1b0990f0d13080fa7c9c79a1c51187ae78afc`
- **部署方式**：Docker Compose (TurnKey Appliance: Apache + MariaDB 10.1 + PHP 7.0)
- **对外端口**：`18625`

## 2. 启动方式

进入当前应用环境目录并启动：

```bash
cd applications/zencart/1.5.7/default
./scripts/up.sh
```

或直接执行 Docker Compose 命令：

```bash
docker compose -f docker/compose.yaml up -d
```

## 3. 访问与账号信息

- **商城前台地址**：`http://localhost:18625/`
- **后台管理地址**：`http://localhost:18625/admin/` (或 `http://localhost:18625/manage/`)
- **客户登录地址**：`http://localhost:18625/index.php?main_page=login`
- **管理员账号**：`admin`
- **管理员密码**：`benchmark-only`

## 4. 验证方法

执行自动化健康检查：

```bash
./scripts/healthcheck.sh
```

执行登录端点测试：

```bash
./resources/login.sh
```

## 5. 数据重置

重置所有容器及持久化数据：

```bash
./scripts/reset.sh
```

## 6. 目录结构与文件说明

- `manifest.yaml`：描述应用版本、源码 Commit、端口及脚本契约索引
- `source/source.yaml`：固定的 upstream GitHub 源码仓库链接与 Commit
- `source/SHA256SUMS`：源码元数据哈希校验文件
- `docker/compose.yaml`：服务拓扑定义及端口映射
- `image/image.json`：镜像元数据定义
- `resources/`：包含管理员账号角色定义及 login.sh 自动化验证脚本
- `scripts/`：包含一键启动 up.sh、健康检查 healthcheck.sh 及重置 reset.sh 脚本
