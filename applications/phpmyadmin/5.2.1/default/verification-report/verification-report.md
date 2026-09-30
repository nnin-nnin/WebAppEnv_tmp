# phpMyAdmin 5.2.1/default 验证报告

- 验证状态：**PASS** (100%)
- 验证时间：2026-09-24T14:00:00+08:00
- 宿主机端口：18691:80
- 耗时：5.04s
- 交付方式：DOCKERHUB (yorem/phpmyadmin:5.2.1)
- 架构：linux/amd64
- 镜像锁定：`yorem/phpmyadmin:5.2.1@sha256:9e915766488a0f603183367a4b51f5db6309ea801f3eaa25138a83815772b14f`
- 账号凭据：admin / Admin123456!
- 静态校验：`code/validate_compose_delivery.rb` PASS
- 动态全流程：`scripts/up.sh` -> `scripts/healthcheck.sh` -> `resources/login.sh` -> `scripts/reset.sh` PASS
