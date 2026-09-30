# Duplicati 2.0.8

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：duplicati
- 版本：2.0.8
- 上游仓库：https://github.com/duplicati/duplicati
- 交付镜像：`yorem/duplicati:2.0.8@sha256:d2d98870f324e1912534cbe147b25cf638828493cce52524ca82e93fcea54421`
- 专属端口：18682:8200

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与认证
- 服务地址：http://localhost:18682/ngax/index.html
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
