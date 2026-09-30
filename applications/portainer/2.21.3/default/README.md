# Portainer 2.21.3

原生 Docker Compose 应用运行环境。

- 应用名称：portainer
- 应用版本：2.21.3
- 交付方式：DOCKERHUB
- 目标平台：linux/amd64
- 宿主机专属分配端口：18655:9000
- 初始管理员账号：`admin`
- 初始管理员密码：`Admin123456!`

## 前置条件
- Docker Engine
- Docker Compose v2
- 网络访问 Docker Hub

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问和账号
- 地址：http://localhost:18655
- API 状态：http://localhost:18655/api/status
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
