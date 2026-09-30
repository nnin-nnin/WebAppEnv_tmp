# YOURLS 1.9.2

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：yourls
- 版本：1.9.2
- 目标平台：linux/amd64
- 宿主机专属分配端口：18654:80
- 管理员账号：`admin`
- 管理员密码：`Admin123456!`

## 前置条件
- Docker Engine
- Docker Compose v2
- 网络访问 Docker Hub

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与健康检查
- 访问地址：http://127.0.0.1:18654/admin/
- 执行健康检查：
```bash
bash scripts/healthcheck.sh
```
- 执行登录校验：
```bash
bash resources/login.sh
```

## 重置与清理
```bash
bash scripts/reset.sh
```
