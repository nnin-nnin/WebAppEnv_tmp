# Drupal 8.6.9

## 环境说明
- 应用名称: Drupal
- 版本: 8.6.9
- 镜像: `yorem/drupal:8.6.9@sha256:c76b91a7ee54c102dd948553b9cb9b1ea6dd5b47ba4d17d2e7383f74442a1c57`
- 架构平台: `linux/amd64`
- 端口映射: `18771:80`
- 默认凭据: `admin` / `password`

## 运维脚本
- `scripts/up.sh`: 启动 Compose 服务并等待健康就绪
- `scripts/healthcheck.sh`: 检查应用服务运行状态
- `scripts/reset.sh`: 停止并清理容器与环境卷
- `resources/login.sh`: 验证 Web 服务可用性与登录连通性
