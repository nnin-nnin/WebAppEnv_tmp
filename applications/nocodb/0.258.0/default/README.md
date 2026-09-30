# NocoDB 0.258.0

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
- 地址：http://localhost:18658
- 访问路径：http://localhost:18658/ 或 http://localhost:18658/dashboard/
- 管理员账号：`admin` (邮箱：`admin@example.com`)
- 管理员密码：`Admin123456!`

## 验证
```bash
bash scripts/healthcheck.sh
```

## 认证测试
```bash
bash resources/login.sh
```

## 重置
```bash
bash scripts/reset.sh
```
