# MoonBox (月光宝盒) default

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：vivo-moonbox
- 版本：default
- 上游仓库：https://github.com/vivo/MoonBox.git
- 交付镜像：
  - 应用服务：`yorem/vivo-moonbox:default@sha256:66f9c4226a1d7f30932e31d058d9751f760f84e4fa9dfc4b54b52ced44cc04ce`
  - 数据库：`mariadb:10.5@sha256:a530aeeefd82f4fa5150f391b6c75462140904780338766f6b03acecb1cca3ce`
  - 搜索引擎：`docker.elastic.co/elasticsearch/elasticsearch:7.16.2@sha256:055ab3c3466c6bd72ef42f7773c5fa224db4fb7cd6a9a5588ebe46642a15abf5`
- 专属端口：18872:8080

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与认证
- 服务地址：http://localhost:18872/
- 初始管理员账号：`admin`
- 初始管理员密码：`AdminPassword123!`

执行登录验证：
```bash
bash resources/login.sh admin AdminPassword123!
```

## 健康检查
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
