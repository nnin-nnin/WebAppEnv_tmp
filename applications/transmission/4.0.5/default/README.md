# Transmission 4.0.5

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：transmission
- 版本：4.0.5
- 上游仓库：https://github.com/transmission/transmission
- 交付镜像：`yorem/transmission:4.0.5@sha256:f722d66f77ea2b73c4bbb34eb7957e603dd590311efce99c28d465a33f7e7d7a`
- 专属端口：18680:9091

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与认证
- 服务地址：http://localhost:18680/transmission/web/
- 初始管理员账号：`admin`
- 初始管理员密码：`Admin123456!`

## 健康检查
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
