# AdGuard Home 0.107.52

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：adguardhome
- 版本：0.107.52
- 上游仓库：https://github.com/AdguardTeam/AdGuardHome
- 交付镜像：`yorem/adguardhome:0.107.52@sha256:1f9dd7718f03514f86f51d3486dbabd6b58cb5d77cc3932e80c896bc6e726d32`
- 专属端口：18683:3000

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与健康检查
- 服务地址：http://localhost:18683/
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
