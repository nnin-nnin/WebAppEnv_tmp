# Neos CMS (default)

## 概述

Neos CMS 是基于 Flow 框架开发的企业级开源内容应用平台与内容管理系统（CMS）。本项目提供符合学术安全评测与基准测试标准的 Docker Compose 原生编排环境。

- **应用名称**: Neos CMS
- **版本**: default (8.3 LTS)
- **上游仓库**: https://github.com/neos/neos
- **固定 Commit**: `e2a96a3990249da59586ff3ea2f1514f837d03dd`
- **运行时环境**: PHP 8.1 Apache + MariaDB 10.5
- **部署模式**: 原生 Docker Compose (native_compose)

---

## 端口与凭据分配

| 项目 | 配置值 |
|---|---|
| 宿主机访问端口 | `18847` (映射至容器内 `80`) |
| 前台首页 URL | `http://127.0.0.1:18847/` |
| 后台登录 URL | `http://127.0.0.1:18847/neos` (或 `/neos/login`) |
| 管理员账号 | `admin` |
| 管理员密码 | `AdminPassword123!` |
| 初始演示站点 | `Neos.Demo` (预导入并就绪) |

---

## 目录结构

```text
.
├── README.md               # 启动说明、对外端口、初始账号与测试说明
├── manifest.yaml           # 元数据清单（记录 commit、运行时、暴露端口与镜像 tag 及 digest）
├── docker/
│   ├── Dockerfile          # 容器构建文件 (linux/amd64)
│   ├── compose.yaml        # 生产 Docker Compose 编排
│   ├── entrypoint.sh       # 容器启动入口与配置初始化
│   └── Settings.yaml       # Neos Flow 运行时持久化与代理配置
├── image/
│   └── image.json          # 镜像元数据与 sha256 digest
├── resources/
│   ├── login.sh            # 管理员自动化登录验证脚本
│   ├── roles.yaml          # 系统角色清单
│   ├── users.yaml          # 预设用户清单
│   └── initial-data/       # 初始预置数据库种子 (database-seed.sql)
├── scripts/
│   ├── healthcheck.sh      # 服务健康与登录接口检测
│   ├── reset.sh            # 清理与环境重置
│   └── up.sh               # 环境启动与等待就绪
└── source/
    ├── source.yaml         # 上游源码与锁定 commit 元数据
    └── SHA256SUMS          # 源码元数据校验和
```

---

## 运维管理命令

### 1. 启动服务
```bash
bash scripts/up.sh
```
该脚本将通过 `docker compose -f docker/compose.yaml up -d` 启动服务，并轮询等待容器健康检查就绪。

### 2. 健康与登录检测
```bash
bash scripts/healthcheck.sh
```
检测 Web 端口响应状态（200/302），并调用 `resources/login.sh` 校验管理员身份凭据。

### 3. 环境重置与清理
```bash
bash scripts/reset.sh
```
停止并清理所有容器、数据卷及孤立网络。
