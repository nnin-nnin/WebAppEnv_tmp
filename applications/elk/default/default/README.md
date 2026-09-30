# elk (default)

ELK (Elasticsearch & Kibana) 栈原生 Docker Compose 运行环境。

## 基本信息
- **应用名称**: elk
- **版本**: default
- **上游仓库**: https://github.com/deviantony/docker-elk
- **固定 Commit**: 16f6720f7100ec1d0c9c8b3e0fa0079fa895eb92
- **访问地址**: http://127.0.0.1:18821
- **管理员账号**: `elastic`
- **管理员密码**: `changeme`

## 启动环境
```bash
bash scripts/up.sh
```

## 健康检查
```bash
bash scripts/healthcheck.sh
```

## 登录鉴权/主控面板测试
```bash
bash resources/login.sh
```

## 重置与清理环境
```bash
bash scripts/reset.sh
```
