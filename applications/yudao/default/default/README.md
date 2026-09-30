# Yudao (芋道源码 / ruoyi-vue-pro) 原生 Docker Compose 环境交付说明

本交付物包含 **Yudao (芋道源码 / ruoyi-vue-pro)** 的原生 Docker Compose 部署配置及自动化运维与验证脚本。

---

## 1. 环境架构

本环境基于全容器化一体服务拓扑：

- **application**: Yudao 统一运行环境（包含 MySQL 8、Redis、Nginx 与 Spring Boot 2.7 yudao-server 后端及 Vue3 管理端前端），对外暴露端口 `18877`。

---

## 2. 前置条件

- Docker Engine 20.10+
- Docker Compose v2+
- 目标架构：`linux/amd64` (ARM64 主机可通过 Rosetta 2 或 qemu 运行)

---

## 3. 标准启动流程

### 从 Docker Hub 拉取并启动

```bash
# 1. 拉取固定版本镜像
docker compose -f docker/compose.yaml pull

# 2. 启动环境
docker compose -f docker/compose.yaml up -d
```

也可以直接使用交付运维脚本启动：

```bash
bash scripts/up.sh
```

---

## 4. 访问入口与默认账号

- **前台管理首页**: [http://127.0.0.1:18877/](http://127.0.0.1:18877/)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `admin123`
- **默认租户名称**: `芋道源码` (tenant_id: 1)

---

## 5. 运维与测试脚本

- **启动环境**: `bash scripts/up.sh`
- **健康检查与登录验证**: `bash scripts/healthcheck.sh`
- **管理员登录脚本**: `bash resources/login.sh`
- **环境重置**: `bash scripts/reset.sh`

---

## 6. 文件与目录说明

```text
.
├── README.md                 # 交付环境说明文档
├── manifest.yaml             # 环境元数据与架构定义
├── source/
│   ├── source.yaml           # GitHub 源码仓库与固定 Commit 哈希
│   └── SHA256SUMS            # 源码元数据校验和
├── docker/
│   └── compose.yaml          # 核心 Docker Compose 配置文件
├── resources/
│   ├── users.yaml            # 默认初始账号信息定义
│   ├── roles.yaml            # 角色与权限映射定义
│   └── login.sh              # 模拟管理员登录测试脚本
├── scripts/
│   ├── up.sh                 # Compose 启动与健康等待脚本
│   ├── healthcheck.sh        # 全流程健康检查脚本
│   └── reset.sh              # 容器与卷重置脚本
└── image/
    └── image.json            # 交付镜像元数据清单
```

---

## 7. 差异与变动说明

1. **预置开箱即用**: 容器内自动完成 Redis、MySQL 种子库与 Spring Boot `yudao-server` 联动，并配置 Nginx 反向代理 `/admin-api/`，免除任何复杂的手动部署与向导。
2. **全自动健康检测与登录闭环**: 提供 `healthcheck.sh` 与 `login.sh`，可自动完成租户查询与 JWT 访问令牌获取验证。
