# 可复现应用环境

项目目标、`code/` 中的环境构建代码和人工验证示例见 [docs/README.md](docs/README.md)。

## 初始账号

以下账号仅供本地 benchmark 使用，不是生产账号。访问地址、角色和验证方式请查看对应应用目录中的 `README.md`。

| 应用名与版本 | 镜像名 | 启动指令 | 用户名和密码 |
| --- | --- | --- | --- |
| EspoCRM 8.2.5 | `nnin/sop-espocrm:8.2.5` | `docker run -d --platform linux/amd64 --name espocrm-8.2.5 -p 18092:80 nnin/sop-espocrm:8.2.5` | `admin` / `benchmark-only` |
| AtroPIM 489afea | `nnin/sop-atropim:489afea` | `docker run -d --platform linux/amd64 --name atropim-489afea -p 18083:80 nnin/sop-atropim:489afea` | `admin` / `benchmark-only` |
| WordPress 4.7.4 | `nnin/sop-wordpress:4.7.4` | `docker run -d --platform linux/amd64 --name wordpress-4.7.4 -p 18084:80 nnin/sop-wordpress:4.7.4` | `admin` / `benchmark-only`<br>`editor` / `benchmark-only`<br>`subscriber` / `benchmark-only` |

## 目录说明

- `README.md`：说明应用版本、启动命令、访问地址、初始账号和验证方式。
- `manifest.yaml`：汇总源码版本、运行时、镜像、资源和脚本索引。
- `source/`：保存固定版本源码、来源信息和源码校验和。
- `docker/`：保存 Dockerfile 与单服务 Compose 配置，用于追溯镜像构建方式。
- `resources/`：保存初始用户、角色、登录和普通用户创建脚本。
- `scripts/`：保存构建、容器内部启动、健康检查和重置等辅助脚本。
- `image/`：保存最终的 all-in-one 镜像 tar、镜像元数据和校验和。


## 运行例子

以 EspoCRM 8.2.5 为例，如何运行：

```bash
docker run -d \
  --platform linux/amd64 \
  --name espocrm-8.2.5 \
  -p 18092:80 \
  nnin/sop-espocrm:8.2.5
```

随后访问 <http://localhost:18092>，使用账号 `admin` 和密码 `benchmark-only` 登录（账号密码见 `applications/espocrm_8.2.5/README.md`）。
