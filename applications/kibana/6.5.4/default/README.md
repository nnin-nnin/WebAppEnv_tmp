# Kibana 6.5.4

原生 Docker Compose 应用运行环境。

## 基本信息
- 应用名称：kibana
- 版本：6.5.4
- 部署模式：native_compose
- 目标平台：linux/amd64
- 宿主机服务端口：18649
- 内部服务端口：5601
- 初始管理员账号：`admin`
- 初始管理员密码：`benchmark-only`

## 服务架构
- `app`: Kibana 6.5.4 Web 应用前端 (`yorem/kibana:6.5.4@sha256:0209a5433ed49346858507bdccca1c5afc99a540f34f0d8a86eca8197ddd8aca`)
- `db`: Elasticsearch 6.5.4 后端搜索引擎数据库 (`elasticsearch:6.5.4@sha256:7053b3979a1dd709f2a225d52bc53622714790b13d88cf08164d252291ab8b61`)

## 快速开始

### 启动服务
```bash
bash scripts/up.sh
```

### 健康检查
```bash
bash scripts/healthcheck.sh
```

### 访问验证
```bash
bash resources/login.sh
```
或直接通过浏览器访问：`http://localhost:18649/app/kibana`

### 环境重置
```bash
bash scripts/reset.sh
```
