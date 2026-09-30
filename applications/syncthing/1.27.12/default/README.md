# Syncthing 1.27.12

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：syncthing
- 版本：1.27.12
- 上游仓库：https://github.com/syncthing/syncthing
- 交付镜像：`yorem/syncthing:1.27.12@sha256:278f187b99ba3bd287250ce6e605c811680ef94dd9d2059892dd7373647b400e`
- 专属端口：18677:8384

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与认证
- 服务地址：http://localhost:18677/
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
