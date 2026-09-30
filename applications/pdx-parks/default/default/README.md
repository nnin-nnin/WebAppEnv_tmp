# pdx-parks default

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：pdx-parks
- 版本：default
- 上游仓库：https://github.com/meandavejustice/pdx-parks
- 交付镜像：`yorem/pdx-parks:default@sha256:9e36e03b2478eafff97ec38ee1a6179b1e05e6867473ec1aa937844772627aa3`
- 专属端口：18853:3000

## 前置条件
- Docker Engine (linux/amd64 支持)
- Docker Compose v2

## 启动
进入目录后执行：
```bash
bash scripts/up.sh
```

## 访问与认证
- 服务地址：http://localhost:18853/
- 管理员登录：http://localhost:18853/login
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
