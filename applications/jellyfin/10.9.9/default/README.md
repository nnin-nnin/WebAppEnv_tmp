# Jellyfin 10.9.9

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：jellyfin
- 版本：10.9.9
- 上游仓库：https://github.com/jellyfin/jellyfin
- 交付镜像：`yorem/jellyfin:10.9.9@sha256:796d4b9ecee733fb205e993ba20c42e5b3eadeb526394f4fe51add6d6b82a837`
- 专属端口：18679:8096

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与健康检查
- 服务地址：http://localhost:18679/
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
