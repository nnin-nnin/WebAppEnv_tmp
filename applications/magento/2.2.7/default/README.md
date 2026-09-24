# Magento 2.2.7

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
- 地址：http://localhost:18636
- 安装/登录向导页面：http://localhost:18636/setup/ 或 http://localhost:18636/admin/
- 默认管理员用户名：admin
- 默认管理员密码：admin
- 数据库连接：主机 `mysql`，用户名 `root`，密码 `root`，数据库 `magento`

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
