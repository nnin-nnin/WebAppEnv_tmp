# Nginx Proxy Manager 2.11.3

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：nginx-proxy-manager
- 版本：2.11.3
- 上游仓库：https://github.com/NginxProxyManager/nginx-proxy-manager
- 交付镜像：`yorem/nginx-proxy-manager:2.11.3@sha256:22b978a376beca5e19bb0f492966185964cfb19b8717525b6246882d8c20b47b`
- 专属端口：18662:81

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与健康检查
- 服务地址：http://localhost:18662/
- 管理员用户名：`admin@example.com`
- 管理员密码：`changeme`

## 验证
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
