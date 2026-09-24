# Microweber 2.0.0

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
- 地址：http://localhost:18545
- 管理员用户名：`admin@benchmark.local`
- 管理员密码：`AdminPassword123!`

## 验证
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
