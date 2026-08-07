# 可复现应用环境

本仓库保存固定版本的 Web 应用环境、构建文件、运行资源和验证脚本。每个环境独立存放，可按其 README 中的说明从 Docker Hub 拉取镜像并运行。

## 索引

- [全部应用环境与版本](index/all.md)
- [Black Widow 和 YuraScanner 应用列表](index/listb.md)
- [构建与人工验证说明](docs/README.md)

## 目录约定

```text
applications/<应用名>/<版本>/<可选变体>/
```

每个环境目录包含：

- `README.md`：镜像、启动命令、访问地址、账号和验证方式。
- `manifest.yaml`：源码、运行时、镜像、资源和脚本索引。
- `source/source.yaml`：GitHub 仓库链接和固定 commit 哈希；不保存源码快照。
- `docker/`、`resources/`、`scripts/`、`image/`：构建、初始化、验证和镜像元数据。

## 使用

从 [全部应用环境与版本](index/all.md) 选择环境，进入对应目录并执行其中 `README.md` 的启动与验证命令。
