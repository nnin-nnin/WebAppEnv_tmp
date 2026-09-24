# parse-server 7.0.0

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：parse-server
- 版本：7.0.0
- 上游仓库：https://github.com/parse-community/parse-server
- 交付镜像：`yorem/parse-server:7.0.0@sha256:60cf7ec922406b9998a688fb5ca5d800d95ed8baaf7be7a689de65db36e63744`
- 数据库镜像：`mongo:5.0@sha256:41108d183e972dcbf98d09ed83f6cfc89a471a3f15d06f9d64a95e45d9db8dd2`
- 专属端口：18558:1337

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与健康检查
- 服务地址：http://localhost:18558
- 健康检查：http://localhost:18558/parse/health
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
