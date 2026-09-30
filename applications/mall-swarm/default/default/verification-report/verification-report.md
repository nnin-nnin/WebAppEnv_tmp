# mall-swarm default 验证报告

- 验证状态：**PASS** (100%)
- 验证时间：2026-09-30T19:08:00+08:00
- 宿主机专属端口：`18840:8080`
- 交付方式：DOCKERHUB (`yorem/mall-swarm:default`)
- 平台架构：`linux/amd64`
- 镜像锁定：`yorem/mall-swarm:default@sha256:c7431e2c0035800b55d8d00e30107fc183612894239e843c38f19c268dd127ff`
- 初始管理员账号：`admin` / `macro123`
- 静态契约校验：`code/validate_compose_delivery.rb` PASS
- 动态全流程验证：`up.sh -> healthcheck.sh -> login.sh -> reset.sh` PASS
  - Swagger UI: `http://127.0.0.1:18840/swagger-ui.html` (HTTP 200 / 302)
  - Actuator Health: `http://127.0.0.1:18840/actuator/health` (status: UP, DB: UP, Redis: UP)
  - Core REST API Login: `POST /admin/login` (返回 JWT Token 与 Bearer TokenHead)
  - RBAC Admin Session: `GET /admin/info` (成功识别用户 `admin` 与角色 `超级管理员`)
