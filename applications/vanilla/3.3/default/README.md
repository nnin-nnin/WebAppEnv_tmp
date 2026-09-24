# Vanilla Forums 3.3

原生 Docker Compose 应用运行环境。

## 前置条件
- Docker Engine
- Docker Compose v2
- 网络访问 Docker Hub

## 架构说明
- **app**: Vanilla Forums 3.3 Web 应用容器（`yorem/vanilla:3.3`），端口映射 `18603:80`。
- **db**: 独立 MariaDB 数据库容器（`mariadb:10.11`），通过 Compose 内部网络与 Web 应用通信。

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问和账号
- 地址：http://localhost:18603
- 管理员用户名：`admin`
- 管理员密码：`AdminPassword123!`

## 验证
```bash
bash scripts/healthcheck.sh
```

## 登录验证
```bash
bash resources/login.sh
```

## 重置
```bash
bash scripts/reset.sh
```
