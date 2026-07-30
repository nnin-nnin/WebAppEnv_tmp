# 可复现应用环境

## 目录说明

- `README.md`：说明应用版本、启动命令、访问地址、初始账号和验证方式。
- `manifest.yaml`：汇总源码版本、运行时、镜像、资源和脚本索引。
- `source/`：保存固定版本源码、来源信息和源码校验和。
- `docker/`：保存 Dockerfile 与单服务 Compose 配置，用于追溯镜像构建方式。
- `resources/`：保存初始用户、角色、登录和普通用户创建脚本。
- `scripts/`：保存构建、容器内部启动、健康检查和重置等辅助脚本。
- `image/`：保存最终的 all-in-one 镜像 tar、镜像元数据和校验和。

接收者实际运行时只需查看对应应用的 `README.md`，无需手动构建源码或配置外部数据库。

## 运行例子

以 EspoCRM 8.2.5 为例，如何运行：

```bash
docker run -d \
  --platform linux/amd64 \
  --name espocrm-8.2.5 \
  -p 18092:80 \
  nnin/sop-espocrm:8.2.5
```

随后访问 <http://localhost:18092>，使用账号 `admin` 和密码 `benchmark-only` 登录（账号密码在espocrm_8.2.5的 readme 中有写）
