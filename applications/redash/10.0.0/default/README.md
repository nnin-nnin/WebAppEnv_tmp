# Redash 10.0.0

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：redash
- 版本：10.0.0
- 目标平台：linux/amd64
- 部署模式：native_compose
- 交付方式：DOCKERHUB

## 端口与账号
- 访问地址：http://localhost:18610
- 管理员账号：`admin@example.com`
- 管理员密码：`AdminPassword123!`

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 健康检查与验证
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
