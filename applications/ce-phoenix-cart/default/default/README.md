# CE Phoenix Cart default 应用环境 (Compose)

本文档说明如何运行和验证 CE Phoenix Cart (default) 标准化可复现应用环境。

## 1. 环境说明

- **应用名称**：CE Phoenix Cart
- **应用版本**：default
- **源码 Commit**：`43c52c27af71ce48a35a77daa78ff640e65bbc33` (HEAD)
- **部署方式**：Docker Compose 多容器 (PHP 7.4 Apache + MariaDB 10.5)
- **对外端口**：`18806`
- **交付镜像**：
  - Web: `yorem/ce-phoenix-cart:default@sha256:e8eae01be7dccbfc83a698cfda355eaf3e8acc60cacbf0eb3154ba0839086d21`
  - DB: `mariadb:10.5@sha256:a530aeeefd82f4fa5150f391b6c75462140904780338766f6b03acecb1cca3ce`

## 2. 启动方式

进入当前应用环境目录并启动：

```bash
cd applications/ce-phoenix-cart/default/default
./scripts/up.sh
```

或直接执行 Docker Compose 命令：

```bash
docker compose -f docker/compose.yaml up -d
```

## 3. 访问与账号信息

- **前台商城地址**：`http://localhost:18806/index.php`
- **后台管理地址**：`http://localhost:18806/admin/login.php`
- **管理员账号**：`admin`
- **管理员密码**：`AdminPassword123!`

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
- `docker/compose.yaml`：服务拓扑定义与健康检查配置
- `image/image.json`：镜像元数据与 sha256 digest
- `resources/`：包含管理员账号角色定义及 init.sql 预填充种子与 login.sh 自动化验证脚本
- `scripts/`：包含一键启动 up.sh、健康检查 healthcheck.sh 及重置 reset.sh 脚本
