# WebAppEnv: Reproducible Web Application Security Benchmark Environments

**WebAppEnv** is an open-source, highly standardized repository of reproducible real-world Web application environments tailored for **cybersecurity research, automated exploit generation (AEG), SWE benchmarks, and autonomous security agent evaluation (LLM Security Agents)**.

Every environment is decoupled, self-contained, and pre-seeded with credential closure and ground-truth databases. Artifacts are distributed as pre-built container images hosted under Docker Hub [`yorem`](https://hub.docker.com/u/yorem), requiring **zero manual installation, zero setup wizards, and zero database configuration**.

---

## 📊 Scale & Environment Statistics

- **Total Applications**: **132** unique real-world Web applications
- **Deployable Environment Suites**: **146** independent versioned environments (including multi-version comparative baselines)
- **Verification Guarantee**: **100% full-stack live verified** (cold start convergence, Tier-1 credential closure, database seed fidelity, and reboot persistence)
- **Container Registry**: Hosted uniformly on Docker Hub under the [`yorem`](https://hub.docker.com/u/yorem) namespace (`yorem/<app>:<version>`)
- **Current Release**: [`release-2026.09.24`](https://github.com/nnin-nnin/WebAppEnv_tmp/releases/tag/release-2026.09.24)

---

## 🎯 Academic Benchmarks & Category Coverage

### 1. Academic Security Paper Baselines
WebAppEnv directly reproduces and solidifies experimental target environments from leading top-tier security conferences (IEEE S&P, USENIX Security, ACM CCS, NDSS):
- **Black Widow (IEEE S&P '21)**: Includes core target ranges such as Drupal (8.6.15), HotCRP (3.3.1), Joomla (5.1.1), osCommerce (2.4.2), phpBB (3.3.17), PrestaShop (9.1.4), WordPress (4.7.4), and more.
- **YuraScanner (NDSS '25)**: Comprehensive coverage of Dolibarr (19.0.2), EspoCRM (8.2.5), GitLab (16.11.2-ce.0), GLPI (10.0.15), iTop (3.1.1), Leantime (3.1.4), LimeSurvey (6.5.3), Mautic (5.0.4), MediaWiki (1.41.1), MintHCM (4.0.4), Monica (4.1.2), Moodle (4.4.0), Nextcloud (29.0.1), OpenCart (4.0.2-3), ownCloud (10.14.0), Redmine (5.1.2), WordPress (6.5.3), etc.

### 2. Diverse Application Categories
| Domain Category | Representative Applications |
| :--- | :--- |
| **Content Management (CMS)** | WordPress (5 versions), Drupal, Joomla, Ghost, Grav, Bludit, Typo3, OctoberCMS, Concrete5, etc. |
| **Project Management & Collaboration** | GitLab, Redmine, Leantime, Kanboard, Codiad, Collabtive, Taiga, Tasklink, etc. |
| **Enterprise Office & CRM / ERP** | EspoCRM, Dolibarr, Odoo, SuiteCRM, MintHCM, OrangeHRM, vTiger, etc. |
| **E-Commerce & Digital Storefronts** | PrestaShop, OpenCart, AbanteCart, ZenCart, Shopware, Magento, newbee-mall, etc. |
| **Infrastructure & DevOps Tooling** | Apache Airflow, Grafana, Prometheus, Webmin, ActiveMQ, Portainer, etc. |
| **Knowledge Base & Cloud Storage** | Nextcloud, ownCloud, MediaWiki, DokuWiki, Miniflux, FreshRSS, etc. |
| **LLM & Autonomous Agent Frameworks** | AutoGPT, ChatDev, Memos, etc. |

---

## 📑 Index & Documentation Navigator

- 📋 **[All 146 Environment Suites (all.md)](index/all.md)**: Exhaustive table of all 132 applications, ports, variants, and direct directory links.
- 🔬 **[Paper Benchmark Mapping (listb.md)](index/listb.md)**: Academic mapping between Black Widow / YuraScanner paper targets and repository environments.
- 📘 **[Artifact Specification & Verification Manual (docs/README.md)](docs/README.md)**: Detailed manual on All-in-One container architecture, mitigating 5 classes of environmental false positives, credential machines, and human browser closure verification.

---

## 📁 Repository Structure Conventions

Each application suite resides in a dedicated directory under `applications/`:

```text
applications/<app-name>/<version>/<variant>/
├── README.md               # Quickstart guide, exposed ports, and pre-seeded login credentials
├── manifest.yaml           # Source commit, runtime spec, image tags, and operational metadata
├── source/source.yaml      # Upstream Git repository URL and locked commit hash (no bulky source snapshot)
├── resources/              # Pre-seeded users (users.yaml), roles, SQL migrations, and login scripts
├── docker/                 # Production Dockerfile and docker-compose.yaml definitions
├── scripts/                # Life-cycle operations: up.sh, healthcheck.sh, reset.sh, entrypoint.sh
└── image/image.json        # Immutable image digest and registry metadata
```

---

## 🚀 Quick Start & Live Verification

All images are pre-compiled and hosted on Docker Hub. You do not need to install local runtimes, databases, or compile source trees.

### Example 1: Launch an All-in-One Container (e.g., EspoCRM)
```bash
docker run -d \
  --name espocrm-benchmark \
  -p 18092:80 \
  yorem/espocrm:8.2.5
```
- **Web Interface**: `http://localhost:18092`
- **Pre-seeded Admin**: `admin` / `benchmark-only` (see `README.md` and `resources/users.yaml`)

### Example 2: Launch via Standard Compose Scripts
```bash
cd applications/abantecart/1.4.4/default
./scripts/up.sh
./scripts/healthcheck.sh
```

---

## 🏷️ Release History

- **[`release-2026.09.24`](https://github.com/nnin-nnin/WebAppEnv_tmp/releases/tag/release-2026.09.24)**: Standardized full-suite sync encompassing **132 Web applications (146 independent environments)** with unified `yorem/<app>:<version>` image registry conventions.
- **[`release-2026.08.07`](https://github.com/nnin-nnin/WebAppEnv_tmp/releases/tag/release-2026.08.07)**: Initial paper baseline release covering **27 target applications (28 environments)** for Black Widow (S&P '21) and YuraScanner (NDSS '25).

---

## 🛡️ License & Reproducibility Guarantee

All environment definitions and orchestrations are distributed under standard open-source research terms. Container images reference upstream open-source projects under their respective licenses.
