# 可复现应用环境

本目录包含三个可独立运行的固定版本应用环境：`espocrm_8.2.5/`、`atropim_489afea/` 和 `wordpress_4.7.4/`。每个应用目录均采用相同的交付结构，并提供已经构建好的 `linux/amd64` all-in-one 镜像。

## 初始账号

以下账号仅供本地 benchmark 使用，不是生产账号。

| 应用 | 访问地址 | 用户名 | 密码 | 角色 |
| --- | --- | --- | --- | --- |
| EspoCRM 8.2.5 | <http://localhost:18092> | `admin` | `benchmark-only` | administrator |
| AtroPIM `489afea` | <http://localhost:18083> | `admin` | `benchmark-only` | administrator |
| WordPress 4.7.4 | <http://localhost:18084> | `admin` | `benchmark-only` | administrator |
| WordPress 4.7.4 | <http://localhost:18084> | `editor` | `benchmark-only` | editor |
| WordPress 4.7.4 | <http://localhost:18084> | `subscriber` | `benchmark-only` | subscriber |

## 目录说明

- `README.md`：说明应用版本、启动命令、访问地址、初始账号和验证方式。
- `manifest.yaml`：汇总源码版本、运行时、镜像、资源和脚本索引。
- `source/`：保存固定版本源码、来源信息和源码校验和。
- `docker/`：保存 Dockerfile 与单服务 Compose 配置，用于追溯镜像构建方式。
- `resources/`：保存初始用户、角色、登录和普通用户创建脚本。
- `scripts/`：保存构建、容器内部启动、健康检查和重置等辅助脚本。
- `image/`：保存最终的 all-in-one 镜像 tar、镜像元数据和校验和。

接收者实际运行时只需查看对应应用的 `README.md`。在线时可直接执行其中的 `docker run` 命令，Docker 会自动从 Docker Hub 拉取镜像；离线交付时先从 `image/` 加载镜像 tar，再执行同一条 `docker run` 命令。无需手动构建源码或配置外部数据库。

## 运行例子

以 EspoCRM 8.2.5 为例，在线运行时可在任意目录执行：

```bash
docker run -d \
  --platform linux/amd64 \
  --name espocrm-8.2.5 \
  -p 18092:80 \
  nnin/sop-espocrm:8.2.5
```

随后访问 <http://localhost:18092>，使用账号 `admin` 和密码 `benchmark-only` 登录。

离线交付时，在本目录执行以下命令加载镜像，再执行上面的 `docker run` 命令：

```bash
docker load -i espocrm_8.2.5/image/espocrm-8.2.5-linux-amd64.tar
```
