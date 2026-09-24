# Apache RocketMQ 5.3.4

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

## 访问和配置
- NameServer 地址：localhost:18594 (容器端口 9876)
- 协议：RocketMQ Remoting Protocol / TCP

## 验证
```bash
bash scripts/healthcheck.sh
bash resources/login.sh
```

## 重置
```bash
bash scripts/reset.sh
```
