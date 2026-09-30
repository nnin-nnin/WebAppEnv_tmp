# File Browser 2.30.0

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：filebrowser
- 版本：2.30.0
- 上游仓库：https://github.com/filebrowser/filebrowser
- 交付镜像：`yorem/filebrowser:2.30.0@sha256:1252d3e3d7c27598765a4cd08d68a8b4dda57753649870dcfd2fdcc2e3622709`
- 专属端口：18667:80

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与认证
- 服务地址：http://localhost:18667/
- 登录页面：http://localhost:18667/login
- 初始管理员账号：`admin`
- 初始管理员密码：`admin`

## 健康检查
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
