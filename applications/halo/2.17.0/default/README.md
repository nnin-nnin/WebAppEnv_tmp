# Halo 2.17.0

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

## 访问和控制台
- 地址：http://localhost:18582
- 管理控制台：http://localhost:18582/console
- 初始管理员用户名：`admin`
- 初始管理员密码：`AdminPassword123!`

## 验证
```bash
bash scripts/healthcheck.sh
bash resources/login.sh
```

## 重置
```bash
bash scripts/reset.sh
```
