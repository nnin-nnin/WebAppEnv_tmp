# WordPress 7.0.3-aio

原生 Docker Compose 应用运行环境。

- 应用名称：wordpress
- 应用版本：7.0.3-aio
- 交付方式：DOCKERHUB
- 目标平台：linux/amd64
- 宿主机专属分配端口：18755:80
- 初始管理员账号：`admin`
- 初始管理员密码：`password`

## 前置条件
- Docker Engine
- Docker Compose v2
- 网络访问 Docker Hub

## 启动
进入当前应用目录后执行：
```bash
bash scripts/up.sh
```

## 访问和账号
- 前台访问地址：http://localhost:18755/
- 管理后台地址：http://localhost:18755/wp-admin/
- 初始管理员用户名：`admin`
- 初始管理员密码：`password`

## 验证
```bash
bash scripts/healthcheck.sh
bash resources/login.sh
```

## 重置
```bash
bash scripts/reset.sh
```
