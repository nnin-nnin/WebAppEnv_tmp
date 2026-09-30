# Mongo Express 1.0.2

原生 Docker Compose 应用运行环境。

- 应用名称：mongo-express
- 应用版本：1.0.2
- 交付方式：DOCKERHUB
- 目标平台：linux/amd64
- 宿主机专属分配端口：18688:8081
- 初始管理员账号：`admin`
- 初始管理员密码：`pass`

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
- 地址：http://127.0.0.1:18688
- 初始管理员账号：`admin`
- 初始管理员密码：`pass`

## 验证
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
