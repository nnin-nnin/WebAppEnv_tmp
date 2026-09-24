# Joomla 5.1.1 all-in-one 应用环境

这是 Joomla 5.1.1（源码固定 commit `7dcf9238e9e27ef029833edec7ac4cd9eb78425b`）的 `linux/amd64` 完整 Web 应用镜像。单个镜像和单个容器内同时提供 Apache、PHP、Joomla 前端/后台、MariaDB 和幂等初始化数据。

## 启动

从仓库根目录进入本目录并校验归档，然后只需加载和运行镜像；不需要 build.sh、Compose、bootstrap、Web Installer 或单独数据库容器：

```bash
cd joomla_5.1.1
sha256sum -c image/SHA256SUMS
docker load -i image/joomla-5.1.1-linux-amd64.tar
docker run -d -p 18211:80 --name joomla-5-1-1 yorem/joomla:5.1.1
```

镜像入口会自动初始化 MariaDB、创建 Joomla 数据库和账号、导入 seed，并启动 Apache。数据可通过 `/var/lib/mysql`、`images`、`media`、`cache` 和 `tmp` volume 持久化。

## 访问和账号

- 站点入口：<http://127.0.0.1:18211/>
- 管理员入口：<http://127.0.0.1:18211/administrator/>
- 用户名：`admin`
- 密码：`benchmark-only`
- 角色：Super Users（全部站点和管理员权限）

根路径显示 Joomla 真实站点；管理员登录后进入 Joomla Control Panel，可管理文章、菜单、媒体和用户。

## 验证

```bash
JOOMLA_URL=http://127.0.0.1:18211 ./scripts/healthcheck.sh
JOOMLA_URL=http://127.0.0.1:18211 JOOMLA_USER=admin JOOMLA_PASSWORD=benchmark-only ./resources/login.sh
JOOMLA_CONTAINER=joomla-5-1-1 ./resources/register.sh benchmark-user 'Benchmark-user-123!' benchmark@example.local 'Benchmark User'
```

`scripts/healthcheck.sh` 在宿主机执行时只做 HTTP 层检查（200 且返回真实 Joomla 页面）。需要连同容器内 MariaDB 一起检查时，在容器内执行：

```bash
docker exec joomla-5-1-1 /usr/local/bin/joomla-healthcheck
```

`register.sh` 使用 Joomla 自带 `cli/joomla.php user:add` 创建真实 Registered 用户，而不是伪造通用注册 API。

## 重置

```bash
JOOMLA_CONTAINER=joomla-5-1-1 ./scripts/reset.sh
docker run -d -p 18211:80 --name joomla-5-1-1 yorem/joomla:5.1.1
```

未显式挂载 volume 时容器删除即清除数据；若使用命名卷，请删除对应数据库卷后再运行以获得全新数据库。

## 文件说明

- `manifest.yaml`：版本、固定源码、运行时、镜像、资源和运维入口。
- `source/`：仅保存 GitHub 仓库链接和固定 commit 哈希的 `source/source.yaml`；源码快照和发布包不随本目录交付。已发布镜像内包含运行所需的应用文件。
- `docker/`：最终 Dockerfile、standalone Dockerfile 和仅含一个 service 的可选 Compose 文件。
- `resources/`：用户、角色、登录/注册脚本和数据库 seed。
- `scripts/`：构建、入口、启动、健康检查和重置脚本。
- `image/`：最终单镜像 tar、镜像元数据及 SHA256SUMS。

## 直接启动命令

```bash
docker load -i image/joomla-5.1.1-linux-amd64.tar && docker run -d -p 18211:80 yorem/joomla:5.1.1
```
