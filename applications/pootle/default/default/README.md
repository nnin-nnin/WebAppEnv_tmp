# Pootle (default)

Pootle 是一个基于 Python/Django 构建的开源协同本地化与在线翻译管理平台。

## 环境规格

- **应用版本**: `default` (`2.9.0rc1`, commit `5a35cc958e9b65bd762433880b862c3838311894`)
- **部署模式**: `native_compose` (多容器 Docker Compose)
- **交付方式**: `DOCKERHUB`
- **容器镜像**:
  - Web 应用: `yorem/pootle:default@sha256:29eecaacdcd7d246f9a6d205c15bdea91c5fb63a03f716e0cc2aa55fe2b065e4`
  - 数据库: `yorem/pootle:default-db@sha256:b5377667cb404e1299a5a13136bf28b85c78a701f2071a247c0239b4ce28978f`
  - 缓存: `redis:7-alpine@sha256:858f009f9709ce576febc734aa78b8f6d624b82571f9ddb6bda4377c833b3499`
- **目标平台**: `linux/amd64`
- **宿主机端口**: `18858:8000`

## 默认账号凭证

- **管理员账号**: `admin`
- **管理员密码**: `AdminPassword123!`
- **邮箱**: `admin@example.com`

## 快速使用说明

1. 启动环境：
   ```bash
   bash scripts/up.sh
   ```

2. 状态健康检测：
   ```bash
   bash scripts/healthcheck.sh
   ```

3. 模拟登录校验：
   ```bash
   bash resources/login.sh
   ```

4. 清理环境与数据卷：
   ```bash
   bash scripts/reset.sh
   ```
