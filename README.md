# 可复现 Web 应用安全评测与基准环境库

本仓库专为 **SecSys 安全研究、漏洞挖掘（AEG）与自主智能体（LLM Security Agents）基准评测** 提供开箱即用、一键拉取、凭据闭环且经实机严格检验的真实 Web 应用靶场与环境资产。

每个环境版本完全独立，不内置大型源码与离线镜像本体，所有容器镜像均标准化托管于 Docker Hub，可通过一键命令极速启动。

---

## 📊 核心规模与环境统计 (Environment Scale & Statistics)

- **收录 Web 应用总数**：**132 个** 真实独立应用
- **可运行版本/环境总数**：**146 套** 标准化独立运行环境（涵盖单版本与多版本对照）
- **验证通过率**：**100% 实机全流程验证通过**（包含凭据闭环、数据库迁移、种子数据填充及容器重启容灾测试）
- **统一镜像标准**：统一托管于 Docker Hub [`yorem`](https://hub.docker.com/u/yorem) 命名空间，格式为 `yorem/<应用名>:<版本>`
- **当前发布版本**：`release-2026.09.24`

---

## 🎯 学术顶会基准与分类覆盖 (Coverage & Benchmarks)

### 1. 顶会安全基准环境复现
本仓库重点对齐顶级网络安全学术论文测试靶场，杜绝口径漂移：
- **Black Widow (IEEE S&P '21)**：收录 Drupal (8.6.15), HotCRP (3.3.1), Joomla (5.1.1), osCommerce (2.4.2), phpBB (3.3.17), PrestaShop (9.1.4), WordPress (4.7.4) 等关键靶场。
- **YuraScanner (NDSS '25)**：全面收录 Dolibarr (19.0.2), EspoCRM (8.2.5), GitLab (16.11.2-ce.0), GLPI (10.0.15), iTop (3.1.1), Leantime (3.1.4), LimeSurvey (6.5.3), Mautic (5.0.4), MediaWiki (1.41.1), MintHCM (4.0.4), Monica (4.1.2), Moodle (4.4.0), Nextcloud (29.0.1), OpenCart (4.0.2-3), ownCloud (10.14.0), Redmine (5.1.2), WordPress (6.5.3) 等 20 余个论文环境。

### 2. 覆盖应用类别
| 业务类型 | 代表性开源应用 |
| :--- | :--- |
| **内容管理系统 (CMS)** | WordPress (5个版本), Drupal, Joomla, Ghost, Grav, Bludit, Typo3, OctoberCMS, Concrete5 等 |
| **项目管理与协同** | GitLab, Redmine, Leantime, Kanboard, Codiad, Collabtive, Taiga 等 |
| **企业办公与 CRM/ERP** | EspoCRM, Dolibarr, Odoo, SuiteCRM, MintHCM, OrangeHRM 等 |
| **电子商务平台** | PrestaShop, OpenCart, AbanteCart, ZenCart, Shopware, Magento, newbee-mall 等 |
| **运维监控与平台工具** | Apache Airflow, Grafana, Prometheus, Webmin, ActiveMQ 等 |
| **知识库与网盘存储** | Nextcloud, ownCloud, MediaWiki, DokuWiki, Miniflux 等 |
| **AI 与智能体基础设施** | AutoGPT, ChatDev, Memos 等 |

---

## 📑 索引与核心文档导航 (Index & Documents)

- 📋 **[全部应用环境与版本清单 (146 套)](index/all.md)**：包含全部 132 个应用及各版本的详细端口、变体与目录索引。
- 🔬 **[Black Widow 和 YuraScanner 论文对照表](index/listb.md)**：论文测试靶场与本仓库环境版本的映射对应关系。
- 📘 **[环境构建与人工验证说明手册](docs/README.md)**：规范说明、5类假阳性防范、凭据机制与端到端浏览器人工闭环验收指导。

---

## 📁 目录规范 (Repository Conventions)

每个应用版本独立存放在 `applications/` 目录下：

```text
applications/<应用名>/<版本>/<可选变体>/
├── README.md               # 环境运行说明、镜像名称、访问地址与初始登录凭据
├── manifest.yaml           # 源码 commit、运行时、暴露端口与元数据索引
├── source/source.yaml      # 上游 GitHub 仓库地址与锁定 commit 哈希（不内嵌源码）
├── resources/              # 初始账号配置 (users.yaml)、角色与自动化登录脚本
├── docker/                 # Dockerfile 与 compose.yaml 配置
├── scripts/                # 启动 (up.sh)、健康检查 (healthcheck.sh)、重置 (reset.sh) 等
└── image/image.json        # 锁定的镜像元数据与 Digest（镜像托管于 Docker Hub）
```

---

## 🚀 极速启动与验证示例 (Quick Start)

所有环境镜像均已推送到 Docker Hub，无需本地从源码编译或执行繁琐的 Web 安装向导：

### 示例 1：启动 EspoCRM (All-in-One 镜像)
```bash
docker run -d \
  --name espocrm-demo \
  -p 18092:80 \
  yorem/espocrm:8.2.5
```
- **访问入口**：`http://localhost:18092`
- **默认管理员凭据**：`admin` / `benchmark-only`（详见对应目录下的 `README.md` 与 `resources/users.yaml`）

### 示例 2：一键启动并执行健康检查
```bash
cd applications/abantecart/1.4.4/default
./scripts/up.sh
./scripts/healthcheck.sh
```

---

## 🏷️ 版本发布里程碑 (Release History)

- **`release-2026.09.24`**：扩增并标准化同步至 **132 个应用（146 套运行环境）**，全量镜像命名拉齐为 `yorem/` 规范。
- **`release-2026.08.07`**：初始基线版本，收录面向顶会论文（Black Widow & YuraScanner）的 **27 个应用（28 套环境）**。
