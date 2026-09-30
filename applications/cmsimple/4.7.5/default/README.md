# CMSimple 4.7.5

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：cmsimple
- 版本：4.7.5
- 官方网站：https://www.cmsimple.org/
- 交付镜像：`yorem/cmsimple:4.7.5@sha256:d3a3e0da4c4fc2861680e860a4c48342854c2b994f33eb80d8d647d8ccdda18f`
- 专属端口：18753:80

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与认证
- 服务地址：http://localhost:18753/
- 初始管理员账号：`admin`
- 初始管理员密码：`test`

## 健康检查
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
