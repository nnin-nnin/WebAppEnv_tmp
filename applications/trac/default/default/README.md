# Trac default

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
- 地址：http://127.0.0.1:18871
- 登录认证接口：http://127.0.0.1:18871/login (HTTP Basic Auth)
- 管理员用户名：`admin`
- 管理员密码：`AdminPassword123!`

## 验证
```bash
bash scripts/healthcheck.sh
```

## 登录验证
```bash
bash resources/login.sh
```

## 重置
```bash
bash scripts/reset.sh
```
