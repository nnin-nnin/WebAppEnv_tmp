# code-server 4.90.3/default 验证报告

- 验证状态：**PASS** (100%)
- 验证时间：2026-09-24T13:58:18+08:00
- 宿主机端口：18698:8080
- 耗时：7.33s
- 交付方式：DOCKERHUB (yorem/code-server:4.90.3)
- 架构：linux/amd64
- 镜像锁定：`yorem/code-server:4.90.3@sha256:81706b71ace316157850cbcfb574714d1067249c107a415b3a03dc6b613ebfbc`
- 账号凭据：admin / Admin123456!
- 静态校验：`code/validate_compose_delivery.rb` PASS
- 动态全流程：`scripts/up.sh` -> `scripts/healthcheck.sh` -> `resources/login.sh` -> `scripts/reset.sh` PASS
