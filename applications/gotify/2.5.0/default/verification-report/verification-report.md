# Gotify 2.5.0/default 验证报告

- 验证状态：**PASS** (100%)
- 验证时间：2026-09-24T09:44:14+08:00
- 宿主机端口：18663:80
- 耗时：7.80s
- 交付方式：DOCKERHUB (yorem/gotify:2.5.0)
- 架构：linux/amd64
- 镜像锁定：`yorem/gotify:2.5.0@sha256:87761c6884bab9169699111bc542c0d29ae785247e2129ac9b3a07e54b686281`
- 账号凭据：admin / Admin123456!
- 静态校验：`code/validate_compose_delivery.rb` PASS
- 动态全流程：`scripts/up.sh` -> `scripts/healthcheck.sh` -> `resources/login.sh` -> `scripts/reset.sh` PASS
