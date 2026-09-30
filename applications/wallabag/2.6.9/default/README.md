# wallabag 2.6.9

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
- 地址：http://127.0.0.1:18671
- 登录页：http://127.0.0.1:18671/login
- 管理员用户名：`wallabag`
- 管理员密码：`wallabag`

## 验证
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
