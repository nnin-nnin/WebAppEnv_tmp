# ECCube3 default 应用环境 (Compose)

本文档说明如何运行和验证 ECCube3 (default) 标准化可复现应用环境。

## 1. 环境说明

- **应用名称**：ECCube3
- **应用版本**：default
- **源码 Commit**：`7abd390a53d5b6c7ce922057a54ae722bc902522` (HEAD)
- **部署方式**：Native Docker Compose
- **对外端口**：`18820`
- **交付镜像**：
  - Web: `yorem/eccube3:default@sha256:b9b4724736400a51a8ff1db5f6bf8cd49a60aeb19095c75dc10ddd16ce7cdbc1`

## 2. 启动方式

进入当前应用环境目录并启动：

```bash
cd applications/eccube3/default/default
./scripts/up.sh
```

或直接执行 Docker Compose 命令：

```bash
docker compose -f docker/compose.yaml up -d
```

## 3. 访问与账号信息

- **前台商城地址**：`http://localhost:18820/`
- **后台管理地址**：`http://localhost:18820/admin/`
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
- `source/SHA256SUMS`：源码元数据校验哈希
- `docker/compose.yaml`：服务拓扑定义与健康检查配置
- `image/image.json`：镜像元数据与 sha256 digest
- `resources/`：包含管理员账号角色定义及 init.sql 预填充种子与 login.sh 自动化验证脚本
- `scripts/`：包含一键启动 up.sh、健康检查 healthcheck.sh 及重置 reset.sh 脚本
- `verification-report/`：全自动化静态与动态验证报告
