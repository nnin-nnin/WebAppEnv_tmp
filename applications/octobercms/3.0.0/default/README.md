# October CMS 3.0.0

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
- 前台地址：http://localhost:18605
- 管理后台：http://localhost:18605/backend
- 管理员用户名：`admin`
- 管理员密码：`admin`

## 验证
```bash
bash scripts/healthcheck.sh
bash resources/login.sh
```

## 重置
```bash
bash scripts/reset.sh
```
