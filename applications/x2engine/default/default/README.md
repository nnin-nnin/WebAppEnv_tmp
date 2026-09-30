# X2Engine default

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：X2CRM (X2Engine)
- 版本：default (7.1)
- 源码 commit: `e2b1011a2806a3f4efeaaafb60cc70cf39e2ebed`
- 交付镜像：`yorem/x2engine:default`
- 宿主机专属分配端口：`18875`

## 前置条件
- Docker Engine (with Compose v2)
- 网络访问 Docker Hub

## 启动
进入应用目录执行：
```bash
bash scripts/up.sh
```

## 访问与初始账号
- 前台访问：http://127.0.0.1:18875/
- 默认管理员账号：`admin`
- 默认管理员密码：`AdminPassword123!`

## 健康检查与功能验证
```bash
bash scripts/healthcheck.sh
```

## 环境重置
```bash
bash scripts/reset.sh
```
