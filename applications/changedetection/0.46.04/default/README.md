# changedetection 0.46.04

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：changedetection
- 版本：0.46.04
- 上游仓库：https://github.com/dgtlmoon/changedetection.io
- 交付镜像：`yorem/changedetection:0.46.04@sha256:096dae27b5d677b89f0e810fff95a70403271aa3ff3b6437952d2db9be7e74c5`
- 专属端口：18695:5000

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与健康检查
- 服务地址：http://localhost:18695/
- 管理员用户名：`admin`
- 管理员密码：`Admin123456!`

## 验证
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
