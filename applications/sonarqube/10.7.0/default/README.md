# SonarQube 10.7.0 Application Environment (Compose)

This document describes how to deploy and verify the reproducible SonarQube 10.7.0 application environment.

## 1. Environment Details

- **Application**: SonarQube
- **Version**: 10.7.0 (10.7.0.96327)
- **Source Commit**: `9e1fded16c1dc80f886af1db4413cbe78a245d7f`
- **Docker 镜像**：`yorem/sonarqube:10.7.0@sha256:a6f6e13d2805751f22bbd8f31e18f104fcc87aec14b4ccfb588c5b916c56ee07`
- **Deployment**: Docker Compose 单容器 (Java 17 OpenJDK / Spring Boot / SonarQube Community)
- **Exposed Port**: `18607` (映射容器内 9000)

## 2. Launch Instructions

Navigate to this environment directory and launch:

```bash
cd applications/sonarqube/10.7.0/default
./scripts/up.sh
```

Or execute Docker Compose directly:

```bash
docker compose -f docker/compose.yaml up -d
```

## 3. Access & Credentials

- **Web 控制台地址**：`http://localhost:18607`
- **Admin Username**: `admin`
- **Admin Password**: `admin`

## 4. Verification Methods

执行自动化健康检查与状态验证：

```bash
./scripts/healthcheck.sh
```

执行登录认证测试：

```bash
./resources/login.sh
```

## 5. Data Reset

重置所有容器及数据：

```bash
./scripts/reset.sh
```

## 6. Directory Structure & Files

- `manifest.yaml`: Metadata manifest detailing application version, source commit, ports, and scripts
- `source/source.yaml`: Pinned upstream GitHub repository URL and commit hash
- `source/SHA256SUMS`：源码元数据哈希校验
- `docker/compose.yaml`：Docker Compose 服务拓扑定义
- `image/image.json`：Docker 镜像元数据信息
- `resources/`: Pre-seeded user roles and login.sh verification script
- `scripts/`: Operations scripts (up.sh, healthcheck.sh, reset.sh)
- `verification-report/`：实机验证与规范性检查报告
