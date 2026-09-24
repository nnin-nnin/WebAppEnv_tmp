# SonarQube 10.7.0 应用环境 (Compose)

本文档说明如何运行和验证 SonarQube 10.7.0 可复现应用环境。

## 1. 环境说明

- **应用名称**：SonarQube
- **应用版本**：10.7.0 (10.7.0.96327)
- **源码 Commit**：`9e1fded16c1dc80f886af1db4413cbe78a245d7f`
- **Docker 镜像**：`yorem/sonarqube:10.7.0@sha256:a6f6e13d2805751f22bbd8f31e18f104fcc87aec14b4ccfb588c5b916c56ee07`
- **部署方式**：Docker Compose 单容器 (Java 17 OpenJDK / Spring Boot / SonarQube Community)
- **对外端口**：`18607` (映射容器内 9000)

## 2. 启动方式

进入当前应用环境目录并启动：

```bash
cd applications/sonarqube/10.7.0/default
./scripts/up.sh
```

或直接执行 Docker Compose 命令：

```bash
docker compose -f docker/compose.yaml up -d
```

## 3. 访问与账号信息

- **Web 控制台地址**：`http://localhost:18607`
- **管理员账号**：`admin`
- **管理员密码**：`admin`

## 4. 验证方法

执行自动化健康检查与状态验证：

```bash
./scripts/healthcheck.sh
```

执行登录认证测试：

```bash
./resources/login.sh
```

## 5. 数据重置

重置所有容器及数据：

```bash
./scripts/reset.sh
```

## 6. 目录结构与文件说明

- `manifest.yaml`：描述应用版本、源码 Commit、端口及脚本索引
- `source/source.yaml`：固定的 upstream GitHub 源码仓库链接与 Commit
- `source/SHA256SUMS`：源码元数据哈希校验
- `docker/compose.yaml`：Docker Compose 服务拓扑定义
- `image/image.json`：Docker 镜像元数据信息
- `resources/`：包含管理员账号角色定义及 login.sh 自动化验证脚本
- `scripts/`：包含一键启动 up.sh、健康检查 healthcheck.sh 及重置 reset.sh 脚本
- `verification-report/`：实机验证与规范性检查报告
