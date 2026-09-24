# SMF (Simple Machines Forum) 2.0.18

SMF 2.0.18 原生 Docker Compose 应用运行环境。

## 前置条件
- Docker Engine 20.10+
- Docker Compose v2+
- 镜像仓库网络访问（Docker Hub）

## 启动
进入应用目录后执行：
```bash
bash scripts/up.sh
```

## 访问与账号
- 访问地址：http://localhost:18622
- 管理员用户名：`admin`
- 管理员密码：`AdminPassword123!`

## 验证
```bash
bash scripts/healthcheck.sh
```

## 重置与清理
```bash
bash scripts/reset.sh
```
