# Apache Kylin (default)

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：apache-kylin
- 版本：default (4.0.0-bin-spark2)
- 上游仓库：https://github.com/apache/kylin
- 交付镜像：`yorem/apache-kylin:default`
- 专属端口：18802:7070

## 初始凭据
- 管理员账号：`admin` (或 `ADMIN`)
- 管理员密码：`AdminPassword123!`

## 启动说明
进入当前目录后执行：
```bash
bash scripts/up.sh
```

## 访问与健康检查
- 根重定向入口：http://localhost:18802/ (HTTP 302 -> /kylin/)
- Web 控制台界面：http://localhost:18802/kylin/ (HTTP 200)
- 执行健康检查与登录接口校验：
```bash
bash scripts/healthcheck.sh
```
- 单独验证登录认证：
```bash
bash resources/login.sh
```

## 环境重置
清理容器与临时网络：
```bash
bash scripts/reset.sh
```
