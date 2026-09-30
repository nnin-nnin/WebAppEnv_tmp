# Pico default

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：pico
- 版本：default
- 上游仓库：https://github.com/picocms/Pico
- 交付镜像：`yorem/pico:default@sha256:df32459c0015dbec56fe5297128d787049168fceef3a47e74604b1e956b7ef4e`
- 专属端口：18856:80

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与认证
- 服务地址：http://localhost:18856/
- 初始管理员账号：`admin`
- 初始管理员密码：`AdminPassword123!`

## 健康检查
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
