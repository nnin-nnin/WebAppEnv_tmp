# bbpress (default)

bbpress 论坛应用原生 Docker Compose 运行环境。

## 基本信息
- **应用名称**: bbpress
- **版本**: default
- **上游仓库**: https://github.com/bbpress/bbPress
- **固定 Commit**: 926192ec6c10d6ad5f009ddc826fc14e069c311f
- **访问地址**: http://127.0.0.1:18803
- **管理员账号**: `admin`
- **管理员密码**: `AdminPassword123!`

## 启动环境
```bash
bash scripts/up.sh
```

## 健康检查
```bash
bash scripts/healthcheck.sh
```

## 登录鉴权测试
```bash
bash resources/login.sh
```

## 重置与清理环境
```bash
bash scripts/reset.sh
```
