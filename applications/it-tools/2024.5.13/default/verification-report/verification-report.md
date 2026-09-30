# IT-Tools 2024.5.13/default 验证报告

- 验证状态：**PASS** (100%)
- 验证时间：2026-09-24T09:46:13+08:00
- 宿主机端口：18665:80
- 耗时：3.22s
- 交付方式：DOCKERHUB (yorem/it-tools:2024.5.13)
- 架构：linux/amd64
- 镜像锁定：`yorem/it-tools:2024.5.13@sha256:6f177c156b9466610e0f2093e24668b78da501c66f0054f98bccb582b74ab26b`
- 账号凭据：admin / Admin123456!
- 静态校验：`code/validate_compose_delivery.rb` PASS
- 动态全流程：`scripts/up.sh` -> `scripts/healthcheck.sh` -> `resources/login.sh` -> `scripts/reset.sh` PASS
