# Navidrome 0.52.5/default 验证报告

- 验证状态：**PASS** (100%)
- 验证时间：2026-09-24T10:00:45+08:00
- 宿主机端口：18678:4533
- 耗时：7.64s
- 交付方式：DOCKERHUB (yorem/navidrome:0.52.5)
- 架构：linux/amd64
- 镜像锁定：`yorem/navidrome:0.52.5@sha256:4d42b180d99bfe95e1c058413e504b287559afac7b496606d27e4a89c187c339`
- 账号凭据：admin / Admin123456!
- 静态校验：`code/validate_compose_delivery.rb` PASS
- 动态全流程：`scripts/up.sh` -> `scripts/healthcheck.sh` -> `resources/login.sh` -> `scripts/reset.sh` PASS
