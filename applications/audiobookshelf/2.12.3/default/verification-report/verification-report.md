# Audiobookshelf 2.12.3/default 验证报告

- 验证状态：**PASS** (100%)
- 验证时间：2026-09-24T16:33:39+08:00
- 宿主机端口：18741:13378
- 耗时：5.64s
- 交付方式：DOCKERHUB (yorem/audiobookshelf:2.12.3)
- 架构：linux/amd64
- 镜像锁定：`yorem/audiobookshelf:2.12.3@sha256:3528a93b6442ffe54bd46771bbbab7c97084e1101071586d9dc2254f30bb4358`
- 账号凭据：root / benchmark-only
- 静态校验：`code/validate_compose_delivery.rb` PASS
- 动态全流程：`scripts/up.sh` -> `scripts/healthcheck.sh` -> `resources/login.sh` -> `scripts/reset.sh` PASS
