# Discourse default/default 验证报告

- 验证状态：**PASS** (100%)
- 验证时间：2026-09-30T17:51:49.597713+08:00
- 宿主机端口：18816:80
- 耗时：25.0s
- 交付方式：DOCKERHUB (yorem/discourse:default)
- 架构：linux/amd64
- 账号凭据：admin (admin@example.com) / AdminPassword123!
- 静态校验：`code/validate_compose_delivery.rb` PASS
- 动态全流程：`scripts/up.sh` -> `scripts/healthcheck.sh` -> `resources/login.sh` -> `scripts/reset.sh` PASS
