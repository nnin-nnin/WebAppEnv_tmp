# Adminer 4.8.1

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：adminer
- 版本：4.8.1
- 上游仓库：https://github.com/vrana/adminer
- 交付镜像：`yorem/adminer:4.8.1@sha256:34d37131366c5aa84e1693dbed48593ed6f95fb450b576c1a7a59d3a9c9e8802`
- 专属端口：18686:8080

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与认证
- 服务地址：http://localhost:18686/
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
