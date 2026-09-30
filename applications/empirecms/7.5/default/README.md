# EmpireCMS 7.5

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
- 前台地址：http://localhost:18763/empirecms/
- 后台地址：http://localhost:18763/empirecms/e/admin/
- 管理员账号：`admin`
- 管理员密码：`123456`

## 验证
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
