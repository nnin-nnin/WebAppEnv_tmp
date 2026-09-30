# Excalidraw 0.17.6/default 验证报告

- 验证状态：**PASS** (100%)
- 验证时间：2026-09-24T10:10:07+08:00
- 宿主机端口：18684:80
- 耗时：3.25s
- 交付方式：DOCKERHUB (yorem/excalidraw:0.17.6)
- 架构：linux/amd64
- 镜像锁定：`yorem/excalidraw:0.17.6@sha256:4542f30bea392b833822d0e7db4fa2220e6706ca962c082add2665159fa91758`
- 账号凭据：admin / Admin123456!
- 静态校验：`code/validate_compose_delivery.rb` PASS
- 动态全流程：`scripts/up.sh` -> `scripts/healthcheck.sh` -> `resources/login.sh` -> `scripts/reset.sh` PASS
