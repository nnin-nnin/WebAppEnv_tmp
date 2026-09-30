# Monstra (default)

原生 Docker Compose 应用运行环境。

## 应用概况
- **应用名称**: Monstra CMS
- **版本**: default (commit `5f6573f`)
- **上游地址**: https://github.com/monstra-cms/monstra
- **架构拓扑**: 单容器原生编排 (基于 `php:7.4-apache`)
- **存储机制**: 基于轻量级 XML 文件数据库 (无需外部关系型数据库)

## 访问与认证
- **访问地址**: http://localhost:18845/
- **管理后台**: http://localhost:18845/admin/
- **默认管理员**: `admin`
- **默认密码**: `AdminPassword123!`

## 运维管理指令

### 启动服务
```bash
bash scripts/up.sh
```

### 健康检查与登录验证
```bash
bash scripts/healthcheck.sh
```

### 单独测试管理员登录
```bash
bash resources/login.sh admin AdminPassword123!
```

### 重置并清理环境
```bash
bash scripts/reset.sh
```
