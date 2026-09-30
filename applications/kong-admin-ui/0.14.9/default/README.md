# Kong Admin UI (Konga) 0.14.9

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：kong-admin-ui
- 版本：0.14.9
- 上游仓库：https://github.com/pantsel/konga
- 交付镜像：`yorem/kong-admin-ui:0.14.9@sha256:c8172b75607d06d83d917387a2f4d95b9b855f64063ee60db8e6f1a1c97b8abf`
- 专属端口：18641:1337

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与健康检查
- 服务地址：http://localhost:18641/
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
