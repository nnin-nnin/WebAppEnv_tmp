# JiZhiCMS (default)

JiZhiCMS (极致建站系统) is an open-source PHP content management system designed for fast website development and content administration.

## Deployment Details

- **Deployment Mode**: Native Docker Compose (`native_compose`)
- **Web Port**: `18835:80`
- **Application Image**: `yorem/jizhicms:default` (`linux/amd64`)
- **Database Image**: `mariadb:10.5` (`linux/amd64`)
- **Default URLs**:
  - Frontend: `http://127.0.0.1:18835/`
  - Administration Login: `http://127.0.0.1:18835/index.php/admins/Login/index.html`

## Default Credentials

| Username | Password | Role | Description |
|---|---|---|---|
| `admin` | `AdminPassword123!` | Administrator | Super Administrator account |

## Directory Layout

```
.
├── README.md               # Documentation and operations guide
├── manifest.yaml           # Deployment manifest contract
├── docker/
│   ├── compose.yaml        # Native Compose definition
│   ├── Dockerfile          # Container image build file
│   └── entrypoint.sh       # Container entrypoint and self-initialization
├── image/
│   └── image.json          # Multi-image metadata with SHA256 digests
├── resources/
│   ├── database-seed.sql   # Pre-seeded database dump
│   ├── login.sh            # Automated admin login verification
│   ├── roles.yaml          # Role definition catalog
│   └── users.yaml          # User credentials catalog
├── scripts/
│   ├── build.sh            # Local image build script
│   ├── healthcheck.sh      # Service health check and verification
│   ├── reset.sh            # Environment teardown and volume cleanup
│   └── up.sh               # Service startup script
└── source/
    ├── SHA256SUMS          # Checksum for source metadata
    └── source.yaml         # Upstream Git repository and commit reference
```

## Quick Start

### 1. Launch Services

```bash
bash scripts/up.sh
```

### 2. Verify Health and Login

```bash
bash scripts/healthcheck.sh
```

Or run the login verification directly:

```bash
bash resources/login.sh
```

### 3. Cleanup and Teardown

```bash
bash scripts/reset.sh
```
