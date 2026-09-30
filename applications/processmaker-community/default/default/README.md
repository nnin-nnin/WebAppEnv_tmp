# ProcessMaker Community (default)

ProcessMaker Community 是业界广泛使用的开源业务流程管理 (BPM) 与工作流自动化套件。

## 环境规格

- **应用标识**: `processmaker-community`
- **版本规格**: `default`
- **上游仓库**: `https://github.com/ProcessMaker/processmaker` (commit: `dfa352c7fac2a764053fe724372738e4d5228df0`)
- **交付模式**: Native Docker Compose (DOCKERHUB 托管镜像)
- **交付镜像**:
  - `app`: `yorem/processmaker-community:default@sha256:e0e7c068656faf3b49675d5e6a4bd74543f8f2a9c8a3ca77f3fa25ba832673d0` (platform: `linux/amd64`)
  - `db`: `mariadb:10.5@sha256:a530aeeefd82f4fa5150f391b6c75462140904780338766f6b03acecb1cca3ce` (platform: `linux/amd64`)
- **对外暴露端口**: `18859:80`
- **初始管理员凭据**:
  - 用户名: `admin`
  - 密码: `AdminPassword123!`

## 启动与使用指南

### 1. 启动服务

进入当前环境目录后执行：

```bash
./scripts/up.sh
```

脚本将启动包含 MariaDB 10.5 数据库与 ProcessMaker 应用容器的 Compose 集群，并自动等待健康就绪。

### 2. 健康检查

```bash
./scripts/healthcheck.sh
```

检测服务容器运行状态及 `http://127.0.0.1:18859/sysworkflow/en/neoclassic/login/login` 的 HTTP 响应。

### 3. 登录校验

```bash
./resources/login.sh admin AdminPassword123!
```

脚本将携带管理员凭据向 ProcessMaker 身份认证接口发送鉴权请求，并校验管理主控台访问。

### 4. 清理环境

```bash
./scripts/reset.sh
```

清理全部容器、专有网络及数据卷。
