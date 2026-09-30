# pgAdmin 4 8.9

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：pgadmin4
- 版本：8.9
- 上游仓库：https://github.com/pgadmin-org/pgadmin4
- 交付镜像：`yorem/pgadmin4:8.9@sha256:33eb7d070ee7500d1513453773f61df1256fdea08257d4a3f4aebd8cf1cc87cf`
- 专属端口：18699:80

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与认证
- 服务地址：http://localhost:18699/
- 登录页面：http://localhost:18699/login
- 初始管理员账号：`admin@example.com`
- 初始管理员密码：`Admin123456!`

## 健康检查
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
