# 可复现应用环境

本仓库保存固定版本的 Web 应用环境、源码追溯信息、Docker 构建文件、运行资源和验证脚本。每个应用都是一个独立目录，最终运行镜像发布在 Docker Hub；应用的具体账号、密码、访问地址和验证方式以对应应用目录中的 `README.md` 为准。

项目目标、构建流程和人工验证说明见 [`docs/README.md`](docs/README.md)。

## 应用目录

| 应用与版本 | 应用目录 | 使用说明 |
| --- | --- | --- |
| AtroPIM 489afea | [`applications/atropim_489afea/`](applications/atropim_489afea/) | [`README.md`](applications/atropim_489afea/README.md) |
| EspoCRM 8.2.5 | [`applications/espocrm_8.2.5/`](applications/espocrm_8.2.5/) | [`README.md`](applications/espocrm_8.2.5/README.md) |
| mall 1.0.3 | [`applications/mall_1.0.3/`](applications/mall_1.0.3/) | [`README.md`](applications/mall_1.0.3/README.md) |
| ruoyi-vue-pro 2026.06-jdk8 | [`applications/ruoyi-vue-pro_2026.06-jdk8/`](applications/ruoyi-vue-pro_2026.06-jdk8/) | [`README.md`](applications/ruoyi-vue-pro_2026.06-jdk8/README.md) |
| WordPress 4.7.4 | [`applications/wordpress_4.7.4/`](applications/wordpress_4.7.4/) | [`README.md`](applications/wordpress_4.7.4/README.md) |

请先进入对应应用目录并阅读其中的 README。根 README 不重复维护各应用的账号密码，避免应用版本或初始化数据变化时出现不一致。

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
- `image/`：最终 all-in-one 镜像的元数据和校验和；镜像本体按应用 README 中的地址从 Docker Hub 获取。

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
