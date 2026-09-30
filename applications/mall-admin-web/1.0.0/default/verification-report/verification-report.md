# mall-admin-web 1.0.0/default 验证报告

- 验证状态：**PASS** (100%)
- 验证时间：2026-09-24T17:01:00+08:00
- 宿主机端口：`18752:80`
- 耗时：3.28s
- 交付方式：DOCKERHUB (`yorem/mall-admin-web:1.0.0`)
- 平台架构：`linux/amd64`
- 镜像锁定：`yorem/mall-admin-web:1.0.0@sha256:f9891ddc7031c2159c90de5eb10a45f950d065a0aef2385c1e2f8a6ed3abc7d0`
- 初始管理员账号：`admin` / `macro123`
- 静态契约校验：`code/validate_compose_delivery.rb` PASS
- 动态全流程验证：`verify_runner.py` (up.sh -> healthcheck.sh -> login.sh -> reset.sh) PASS
