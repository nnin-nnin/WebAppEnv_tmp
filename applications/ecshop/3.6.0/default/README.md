# ECShop 3.6.0

原生 Docker Compose 应用运行环境。

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2
- 访问 Docker Hub

## 启动
进入应用目录执行：
```bash
bash scripts/up.sh
```

## 访问和账号
- 应用主页：http://localhost:18645/
- 管理后台：http://localhost:18645/admin/
- 默认管理员用户名：admin
- 默认管理员密码：Admin123456!

## 验证
健康检查：
```bash
bash scripts/healthcheck.sh
```

登录端点检查：
```bash
bash resources/login.sh
```

## 重置
环境清理与重置：
```bash
bash scripts/reset.sh
```
