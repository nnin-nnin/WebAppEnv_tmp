# qBittorrent 4.6.5

原生 Docker Compose 应用运行环境。

## 前置条件
- Docker Engine
- Docker Compose v2
- 目标平台: `linux/amd64`
- 宿主机专属分配端口: `18681`
- 网络访问 Docker Hub

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问和账号
- 地址：http://127.0.0.1:18681
- 初始管理员用户名：`admin`
- 初始管理员密码：`adminadmin`

## 验证
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
