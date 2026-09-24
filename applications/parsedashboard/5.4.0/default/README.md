# Parse Dashboard 5.4.0

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：parsedashboard
- 版本：5.4.0
- 上游仓库：https://github.com/parse-community/parse-dashboard
- 交付镜像：`yorem/parsedashboard:5.4.0@sha256:f5137e104f09ce484ceede1890d28b885c7923a71d1e3777dcb59bb2e6d544cd`
- 专属端口：18592:4040

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与健康检查
- 服务地址：http://localhost:18592
- 登录页面：http://localhost:18592/login
- 管理员用户名：`admin`
- 管理员密码：`AdminPassword123!`

## 验证
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
