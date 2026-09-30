# HedgeDoc 1.9.9

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：hedgedoc
- 版本：1.9.9
- 上游仓库：https://github.com/hedgedoc/hedgedoc
- 交付镜像：`yorem/hedgedoc:1.9.9@sha256:53a21ddeb2ed0f9b9be67cf143d9429f9f7480d997d5e5533ab11bee32a4e876`
- 专属端口：18670:3000

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与认证
- 服务地址：http://localhost:18670/
- 登录页面：http://localhost:18670/
- 初始管理员账号：`admin@example.com`
- 初始管理员密码：`Admin123456!`

## 健康检查
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
