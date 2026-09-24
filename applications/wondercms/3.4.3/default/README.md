# WonderCMS 3.4.3

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
- 地址：http://localhost:18590
- 密码：初次访问首页自动生成并在页面展示，或可在系统配置中设置
- 默认登录路径：http://localhost:18590/loginURL

## 验证
```bash
bash scripts/healthcheck.sh
```

## 重置
```bash
bash scripts/reset.sh
```
