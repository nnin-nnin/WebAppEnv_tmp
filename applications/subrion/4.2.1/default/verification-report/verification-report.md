# Subrion 4.2.1/default 验证报告

- 验证状态：**PASS** (100%)
- 验证时间：2026-09-24T09:07:31+08:00
- 宿主机端口：18643:80
- 耗时：19.57s
- 交付方式：DOCKERHUB (yorem/subrion:4.2.1)
- 架构：linux/amd64
- 账号凭据：admin / Admin123456!
- 静态校验：`code/validate_compose_delivery.rb` PASS
- 动态全流程：`scripts/up.sh` -> `scripts/healthcheck.sh` -> `resources/login.sh` -> `scripts/reset.sh` PASS
