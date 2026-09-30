# ClipperCMS default

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：ClipperCMS
- 版本：default (1.3.3)
- 源码 commit: `9787f6c91232cbcd39352c22601102a99be35dcd`
- 交付镜像：`yorem/clippercms:default`
- 宿主机专属分配端口：`18807`

## 前置条件
- Docker Engine (with Compose v2)
- 网络访问 Docker Hub

## 启动
进入应用目录执行：
```bash
bash scripts/up.sh
```

## 访问与初始账号
- 前台访问：http://127.0.0.1:18807/
- 管理后台：http://127.0.0.1:18807/manager/
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
