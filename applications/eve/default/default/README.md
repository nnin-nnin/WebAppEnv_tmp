# Eve (default)

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：eve
- 版本：default
- 上游仓库：https://github.com/pyeve/eve
- 上游 Commit：fe7d9c919bf35fe149feb42e51ba9c5c337e3119 (v2.3.1)
- 目标平台：linux/amd64
- 部署模式：native_compose
- 交付方式：DOCKERHUB

## 端口与账号
- API 根入口：http://localhost:18823/
- 健康检查：http://localhost:18823/health
- 认证网关：http://localhost:18823/login
- 核心资源：http://localhost:18823/people
- 受保护资源：http://localhost:18823/users
- 管理员账号：`admin`
- 管理员密码：`AdminPassword123!`

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 健康检查与服务校验
```bash
bash scripts/healthcheck.sh
```

## 认证与 API 登录测试
```bash
bash resources/login.sh
```

## 重置与清理
```bash
bash scripts/reset.sh
```
