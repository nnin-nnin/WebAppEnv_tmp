# Uptime Kuma 1.23.16

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：uptime-kuma
- 版本：1.23.16
- 上游仓库：https://github.com/louislam/uptime-kuma
- 交付镜像：`yorem/uptime-kuma:1.23.16@sha256:b4c3a4d186b4612b3a7bbb39c56a634626276615c21871c837a86e4a43d8e047`
- 专属端口：18656:3001

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与健康检查
- 服务地址：http://localhost:18656/
- 管理员用户名：`admin`
- 管理员密码：`Admin123456!`

## 验证
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
