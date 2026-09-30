# WebChess default

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：webchess
- 版本：default
- 上游仓库：https://github.com/halojoy/PHP7-Webchess
- 交付镜像：
  - 应用服务：`yorem/webchess:default@sha256:4741fd66247d6af41995c2d5ca89f20af5367f309e9b55fcf05b41f757b91e9b`
  - 数据库：`mariadb:10.5@sha256:a530aeeefd82f4fa5150f391b6c75462140904780338766f6b03acecb1cca3ce`
- 专属端口：18874:80

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与认证
- 服务地址：http://localhost:18874/
- 初始管理员账号：`admin`
- 初始管理员密码：`AdminPassword123!`

执行登录验证：
```bash
bash resources/login.sh admin AdminPassword123!
```

## 健康检查
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
