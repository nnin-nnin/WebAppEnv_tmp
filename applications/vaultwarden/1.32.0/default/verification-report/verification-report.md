# Vaultwarden 1.32.0/default 验证报告

- 验证状态：**PASS** (100%)
- 验证时间：2026-09-24T09:25:00+08:00
- 宿主机端口：18651:80
- 耗时：7.41s
- 交付方式：DOCKERHUB (yorem/vaultwarden:1.32.0)
- 架构：linux/amd64
- 镜像锁定：`yorem/vaultwarden:1.32.0@sha256:c1ac298c3f1803e87d719ac882f01ccb1f0385c403bdb94db3e09e24dcbdfe7d`
- 账号凭据：admin@example.com / Admin123456! (ADMIN_TOKEN: Admin123456!)
- 静态校验：`code/validate_compose_delivery.rb` PASS
- 动态全流程：`scripts/up.sh` -> `scripts/healthcheck.sh` -> `resources/login.sh` -> `scripts/reset.sh` PASS
