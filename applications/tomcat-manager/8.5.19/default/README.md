# Apache Tomcat Manager 8.5.19

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

## 访问和账号
- 首页地址：http://127.0.0.1:18772/
- 管理后台地址：http://127.0.0.1:18772/manager/html
- 管理员用户名：`admin` / `tomcat`
- 管理员密码：`admin` / `tomcat`

## 验证
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
