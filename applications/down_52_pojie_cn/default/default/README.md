# down_52_pojie_cn default 原生 Docker Compose 环境

本交付物为 **down_52_pojie_cn**（吾爱破解爱盘文件列表前端浏览器）的 default 版本原生 Docker Compose 应用环境。

> [!NOTE]
> 本环境为原生 Compose 部署。应用服务（基于 Vue.js 构建并由 Nginx 提供 HTTP 服务）运行在独立容器中，冷启动即用，免安装向导。

---

## 1. 基本信息

- **应用名称**: down_52_pojie_cn
- **版本**: default
- **上游仓库**: https://github.com/ganlvtech/down_52pojie_cn
- **固定 Commit**: `7e0e51ef88477a31d1537c3231de9a3cca9028c8`
- **交付镜像**: `yorem/down_52_pojie_cn:default@sha256:5148a467735e1932c61e96b4c79ed04fa88cedd4d0cf63e5915a1afc22736259`
- **目标平台**: `linux/amd64`
- **专属分配端口**: `18819:80`

---

## 2. 前置条件

- **Docker Engine**: v20.10.0+ (支持 linux/amd64 容器)
- **Docker Compose**: v2.0.0+

---

## 3. 快速启动

使用已推送到 Docker Hub 锁定的镜像启动：

```bash
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d
```

或使用封装好的一键启动脚本：

```bash
bash scripts/up.sh
```

---

## 4. 访问与初始账号

- **Web 访问地址**: [http://localhost:18819](http://localhost:18819)
- **初始管理员账号**: `admin`
- **初始管理员密码**: `AdminPassword123!`
- **预设角色**: `Administrator`

---

## 5. 服务组成

| 服务名称 | 职责说明 | 镜像 | 目标平台 | 端口映射 |
| :--- | :--- | :--- | :--- | :--- |
| **app** | 吾爱破解爱盘前端与 Nginx Web 服务 | `yorem/down_52_pojie_cn:default@sha256:5148a467735e1932c61e96b4c79ed04fa88cedd4d0cf63e5915a1afc22736259` | `linux/amd64` | `18819:80` |

---

## 6. 环境验证与辅助工具

### 自动健康检查

```bash
bash scripts/healthcheck.sh
```

### 接口与访问校验

```bash
bash resources/login.sh
```

---

## 7. 环境重置

清理当前 Compose 环境及其网络与数据卷：

```bash
bash scripts/reset.sh
```

---

## 8. 目录结构说明

```text
default/
├── README.md                 # 交付物使用说明
├── manifest.yaml             # 交付元数据清单
├── docker/
│   └── compose.yaml          # Docker Compose 编排文件
├── image/
│   └── image.json            # 镜像与发布元数据
├── resources/
│   ├── login.sh              # 访问校验脚本
│   ├── roles.yaml            # 角色权限定义
│   └── users.yaml            # 预置用户信息
├── scripts/
│   ├── healthcheck.sh        # 一键健康检查脚本
│   ├── reset.sh              # 一键重置与资源清理脚本
│   └── up.sh                 # 一键启动脚本
└── source/
    ├── SHA256SUMS            # 源码元数据哈希校验
    └── source.yaml           # 上游仓库与版本锁定信息
```
