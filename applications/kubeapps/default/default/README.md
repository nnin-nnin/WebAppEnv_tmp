# Kubeapps default

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：kubeapps
- 版本：default
- 上游仓库：https://github.com/kubeapps/kubeapps
- 交付镜像：`yorem/kubeapps:default@sha256:4f8af29ba4a738e2412501477fb34b66bc0df59b77abc3165a1620e4c33396a2`
- 专属端口：18837:8080

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与健康检查
- 服务地址：http://localhost:18837/
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
