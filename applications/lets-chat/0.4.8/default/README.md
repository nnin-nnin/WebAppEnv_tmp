# Let's Chat 0.4.8

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：lets-chat
- 版本：0.4.8
- 目标平台：linux/amd64
- 部署模式：native_compose
- 交付方式：DOCKERHUB

## 端口与账号
- 访问地址：http://localhost:18631
- 登录页面：http://localhost:18631/login
- 管理员账号：`admin`
- 管理员密码：`AdminPassword123!`

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 健康检查与登录验证
```bash
bash scripts/healthcheck.sh
```

## 登录测试
```bash
bash resources/login.sh
```

## 重置与清理
```bash
bash scripts/reset.sh
```
