# Gitea 1.22.0 原生 Docker Compose 环境

本交付物为 **Gitea 1.22.0** 的原生 Docker Compose 应用环境。

> [!NOTE]
> 本环境遵循原生 Compose 交付规范，镜像已构建并锁定推送到 Docker Hub (`yorem/gitea:1.22.0@sha256:ff5addffde6abf6e57a7def08f45281eab2a86d2ff6cd92ac88ff84263a87547`)。启动即可直接使用，无需任何手动初始化向导。

---

## 1. 前置条件

- **Docker Engine**: v20.10.0+
- **Docker Compose**: v2.0.0+
- **目标平台**: `linux/amd64`
- **宿主机专属分配端口**: `18655`

---

## 2. 快速启动 (Docker Hub 交付方式)

使用已锁定推送至 Docker Hub 的镜像直接启动：

```bash
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d
```

或使用封装好的启动脚本（自动完成健康检测与管理员账号初始化）：

```bash
./scripts/up.sh
```

---

## 3. 访问与初始账号

- **浏览器访问地址**: [http://127.0.0.1:18655/](http://127.0.0.1:18655/)
- **登录页面地址**: [http://127.0.0.1:18655/user/login](http://127.0.0.1:18655/user/login)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `Admin123456!`
- **角色**: `Administrator`

登录成功后，即可直接使用完整的代码仓库管理、组织团队、代码评审及个人设置等核心功能。

---

## 4. 服务组成

| 服务名称 | 职责说明 | 镜像 / 摘要 | 目标平台 | 端口映射 |
| :--- | :--- | :--- | :--- | :--- |
| **app** | Gitea 1.22.0 Git 服务与 Web 界面 | `yorem/gitea:1.22.0@sha256:ff5addffde6abf6e57a7def08f45281eab2a86d2ff6cd92ac88ff84263a87547` | `linux/amd64` | `18655:3000` |

---

## 5. 环境验证与辅助工具

### 自动健康检查

```bash
./scripts/healthcheck.sh
```

### 账号登录验证

```bash
./resources/login.sh admin Admin123456!
```

---

## 6. 环境重置

重置环境并清理当前 Compose 项目的容器、网络和数据卷：

```bash
./scripts/reset.sh
```

或手动执行：

```bash
docker compose -f docker/compose.yaml down -v --remove-orphans
```

---

## 7. 目录结构说明

```text
default/
├── README.md                           # 环境交付与使用说明
├── manifest.yaml                       # 部署清单元数据
├── source/
│   ├── source.yaml                     # GitHub 源码仓库元数据
│   └── SHA256SUMS                      # 源码元数据校验哈希
├── image/
│   └── image.json                      # 交付镜像元数据与摘要锁定
├── resources/
│   ├── users.yaml                      # 初始账号配置
│   ├── roles.yaml                      # 初始角色配置
│   └── login.sh                        # 登录验证脚本
├── docker/
│   └── compose.yaml                    # 运行拓扑 Compose 定义
└── scripts/
    ├── up.sh                           # Compose 启动与健康等待脚本
    ├── healthcheck.sh                  # 综合健康检查脚本
    └── reset.sh                        # 环境重置清理脚本
```

---

## 8. 官方部署与交付部署差异说明

1. **安装向导锁定**: 通过注入 `GITEA__security__INSTALL_LOCK=true` 环境变量，免除首次访问需要人工填写表单的安装向导，直接进入开箱可用状态。
2. **自动化管理员初始化**: 通过 `up.sh` 与 Gitea 内置工具自动化配置初始管理员账号 `admin / Admin123456!`。
3. **平台与摘要锁死**: Compose 文件中固定目标平台为 `linux/amd64`，并锁定精确的 Docker Hub sha256 镜像摘要以确保学术安全评测的可复现性。
