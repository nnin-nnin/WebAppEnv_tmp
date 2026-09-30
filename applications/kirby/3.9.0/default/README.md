# Kirby 3.9.0

原生 Docker Compose 应用运行环境。

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
- 地址：http://127.0.0.1:18740
- 管理面板：http://127.0.0.1:18740/panel
- 管理员账号：admin (或 admin@example.com)
- 管理员密码：benchmark-only

## 验证
```bash
bash scripts/healthcheck.sh
```

## 登录测试
```bash
bash resources/login.sh
```

## 重置
```bash
bash scripts/reset.sh
```
