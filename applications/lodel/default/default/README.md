# lodel (default)

Lodel 电子学术出版内容管理系统原生 Docker Compose 运行环境。

## 基本信息
- **应用名称**: lodel
- **版本**: default
- **上游仓库**: https://github.com/OpenEdition/lodel
- **固定 Commit**: b3c30be6a60683d8e0f79eee259d792b5482956e
- **访问地址**: http://127.0.0.1:18839
- **后台登录地址**: http://127.0.0.1:18839/lodeladmin/login.php
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
