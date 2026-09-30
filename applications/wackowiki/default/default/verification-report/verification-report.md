# 交付验证报告: wackowiki (default)

- **应用名称**: wackowiki
- **版本**: default
- **验证时间**: 2026-09-30 21:52:00
- **总评判定**: **PASSED**

## 1. 静态规范核验
- [x] 交付目录契约完整性 (README, manifest.yaml, compose.yaml, image.json, scripts, resources)
- [x] manifest.yaml 声明完整，采用 DOCKERHUB 交付模式
- [x] compose.yaml 锁定服务镜像 digest
- [x] Shell 脚本权限与语法合规 (bash -n 校验通过)
- [x] 宿主机路径脱敏排查通过

## 2. 动态实机验证
- [x] `scripts/up.sh`: 容器编排成功拉起并自愈健康就绪
- [x] `scripts/healthcheck.sh`: 宿主机端口 18873 响应 HTTP 200
- [x] `resources/login.sh`: 管理员 `admin / AdminPassword123!` 登录会话校验通过 (提取动态 login nonce)
- [x] `scripts/reset.sh`: 容器与卷资源清理释放验证通过
