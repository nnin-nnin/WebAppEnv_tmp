# Redis Commander 0.8.0

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：redis-commander
- 版本：0.8.0
- 上游仓库：https://github.com/joeferner/redis-commander
- 交付镜像：`yorem/redis-commander:0.8.0@sha256:19cd0c49f418779fa2822a0496c5e6516d0c792effc39ed20089e6268477e40a`
- 专属端口：18687:8081

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与认证
- 服务地址：http://localhost:18687/
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
