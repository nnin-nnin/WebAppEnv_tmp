# Thelia (default)

Thelia 是基于 Symfony 组件构建的开源电子商务系统与 CMS 框架。

## 环境信息

- **应用名称**: Thelia
- **版本**: default (2.5.4)
- **部署方式**: native_compose
- **交付方式**: DOCKERHUB
- **镜像服务**:
  - `app`: `yorem/thelia:default@sha256:0a53e9433a0aefec7afbfe789bb0e20e87340deedd7f382e31d5affd2a2a6583`
  - `db`: `mariadb:10.5@sha256:a530aeeefd82f4fa5150f391b6c75462140904780338766f6b03acecb1cca3ce`
- **专属分配端口**: `18869:80`
- **默认管理员账号**: `admin`
- **默认管理员密码**: `AdminPassword123!`

## 快速启动

```bash
# 启动环境
./scripts/up.sh

# 健康检查
./scripts/healthcheck.sh

# 登录验证
./resources/login.sh admin AdminPassword123!

# 重置环境
./scripts/reset.sh
```
