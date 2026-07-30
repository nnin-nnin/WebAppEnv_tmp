# 可复现应用环境

本仓库保存固定版本的 Web 应用环境、源码追溯信息、Docker 构建文件、运行资源和验证脚本。每个应用都是一个独立目录，最终运行镜像发布在 Docker Hub；下表列出默认测试账号，具体访问地址、角色和验证方式以对应应用目录中的 `README.md` 为准。

项目目标、构建流程和人工验证说明见 [`docs/README.md`](docs/README.md)。

## 应用目录

| 应用名与版本 | 镜像名 | 启动指令 | 用户名和密码 |
| --- | --- | --- | --- |
| [`AtroPIM 489afea`](applications/atropim_489afea/) | `nnin/sop-atropim:489afea` | `docker run -d --platform linux/amd64 --name atropim-489afea -p 18083:80 nnin/sop-atropim:489afea` | `admin` / `benchmark-only` |
| [`EspoCRM 8.2.5`](applications/espocrm_8.2.5/) | `nnin/sop-espocrm:8.2.5` | `docker run -d --platform linux/amd64 --name espocrm-8.2.5 -p 18092:80 nnin/sop-espocrm:8.2.5` | `admin` / `benchmark-only` |
| [`mall 1.0.3`](applications/mall_1.0.3/) | `nnin/sop-mall:1.0.3` | `docker run -d -p 18085:80 nnin/sop-mall:1.0.3` | `admin` / `123456` |
| [`ruoyi-vue-pro 2026.06-jdk8`](applications/ruoyi-vue-pro_2026.06-jdk8/) | `yorem/sop-ruoyi-vue-pro:2026.06-jdk8` | `docker run -d -p 18087:80 yorem/sop-ruoyi-vue-pro:2026.06-jdk8` | `admin` / `admin123` |
| [`WordPress 4.7.4`](applications/wordpress_4.7.4/) | `nnin/sop-wordpress:4.7.4` | `docker run -d --platform linux/amd64 --name wordpress-4.7.4 -p 18084:80 nnin/sop-wordpress:4.7.4` | `admin` / `benchmark-only`<br>`editor` / `benchmark-only`<br>`subscriber` / `benchmark-only` |
| [`Monica 4.1.2`](applications/monica_4.1.2/) | `native_compose`：`yorem/sop-monica-app:4.1.2` + `yorem/sop-monica-web:4.1.2` | `cd applications/monica_4.1.2 && bash scripts/up.sh` | `admin@example.com` / `benchmark-only` |

请先进入对应应用目录并阅读其中的 README。表格中的账号用于快速启动验证，应用 README 还包含访问地址、角色和完整验证方式。

Monica 4.1.2 是原生 Docker Compose 类型，启动方式与上面的 all-in-one 单容器应用不同。它由 app、web、MariaDB、Redis、cron、queue 和 MailHog 7 个独立服务组成；`scripts/up.sh` 会在缺少本地镜像时从 Docker Hub 拉取镜像，然后等待全部服务健康。

## 仓库结构

- `applications/`：保存所有应用环境，每个子目录对应一个固定版本的应用。
- `docs/`：保存项目目标、构建流程和人工验证说明。
- `prompts/`：保存用于生成应用环境的提示词和流程模板。
- `README.md`：说明仓库组织方式和各应用入口。

## 单个应用目录结构

- `README.md`：应用版本、镜像名称、启动命令、访问地址、初始账号和验证方式。
- `manifest.yaml`：源码版本、运行时、镜像、资源和脚本索引。
- `source/`：固定版本源码、来源信息和源码校验和。
- `docker/`：Dockerfile 与单服务 Compose 配置，用于追溯镜像构建方式。
- `resources/`：初始用户、角色、数据库种子、登录和注册脚本等资源。
- `scripts/`：构建、启动、健康检查和重置等辅助脚本。
- `image/`：按应用类型保存 all-in-one 镜像或 Compose 服务镜像的元数据和校验和；镜像本体按应用 README 中的地址从 Docker Hub 获取。

## 运行示例

以 EspoCRM 8.2.5 为例，先进入对应应用目录，再按照该应用 README 中记录的镜像和端口启动：

```bash
cd applications/espocrm_8.2.5
docker run -d \
  --platform linux/amd64 \
  --name espocrm-8.2.5 \
  -p 18092:80 \
  nnin/sop-espocrm:8.2.5
```

启动后的访问地址、账号密码和验证命令见 [`applications/espocrm_8.2.5/README.md`](applications/espocrm_8.2.5/README.md)。

### Monica 4.1.2 原生 Compose 示例

```bash
cd applications/monica_4.1.2
docker compose -f docker/compose.yaml pull
bash scripts/up.sh
```

启动后访问 <http://localhost:18086/>。账号密码和健康检查方式见 [`applications/monica_4.1.2/README.md`](applications/monica_4.1.2/README.md)。
