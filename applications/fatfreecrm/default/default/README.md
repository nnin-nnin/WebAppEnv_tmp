# FatFreeCRM (default) Benchmark Environment

Standardized multi-container benchmark environment for FatFreeCRM (version: default / master).

---

## 1. Environment Details

- **Application**: FatFreeCRM
- **Version**: default
- **Upstream Repository**: https://github.com/fatfreecrm/fat_free_crm
- **Pinned Commit**: `91595c40a6baaa70512296157aab4bd56009e9b5`
- **Target Platform**: `linux/amd64`
- **Public URL**: `http://127.0.0.1:18825/`
- **Host Port Mapping**: `18825:3000`
- **Deployment Mode**: `native_compose`
- **Delivery Method**: `DOCKERHUB`
- **Runtime Topology**:
  - `application`: FatFreeCRM Ruby 3.4 / Rails 8.0 with Puma (`yorem/fatfreecrm:default`)
  - `db`: PostgreSQL 14 (`postgres:14`)

---

## 2. Initial Administrator Credentials

- **Username**: `admin`
- **Password**: `AdminPassword123!`
- **Email**: `admin@example.com`
- **Role**: `administrator`
- **Zero-Install Wizard Status**: Database pre-seeded via `resources/database-seed.sql` on cold start with full schema and administrator account ready. No manual onboarding wizard required.

---

## 3. Directory Layout

```text
fatfreecrm/default/default/
├── README.md               # Application documentation and benchmark credentials
├── manifest.yaml           # Metadata manifest with pinned commit, ports, and image digests
├── docker/
│   └── compose.yaml        # Multi-container Compose deployment
├── image/
│   └── image.json          # Pinned image names and sha256 digests
├── resources/
│   ├── database-seed.sql   # Pre-initialized PostgreSQL database seed
│   ├── login.sh            # Automated admin login verification script
│   ├── roles.yaml          # System roles definition
│   └── users.yaml          # User credentials specification
├── scripts/
│   ├── healthcheck.sh      # Service status and end-to-end login validation
│   ├── reset.sh            # Environment cleanup and volume purge script
│   └── up.sh               # Environment launch and readiness polling script
└── source/
    ├── SHA256SUMS          # Checksum for source metadata
    └── source.yaml         # Upstream source tracking and commit pin
```

---

## 4. Lifecycle Management Commands

### Start Environment
```bash
bash scripts/up.sh
```

### Run Healthcheck
```bash
bash scripts/healthcheck.sh
```

### Test Admin Login
```bash
bash resources/login.sh
```

### Reset / Tear Down Environment
```bash
bash scripts/reset.sh
```

---

## 5. Verification Highlights

1. **Cold Start Zero-Wizard**: PostgreSQL container loads `resources/database-seed.sql` automatically, creating the complete schema and `admin` user without interactive installation.
2. **Precompiled Assets**: Static assets are precompiled and served directly in production mode.
3. **End-to-End Authentication**: `resources/login.sh` retrieves the authenticity token from `/users/sign_in`, posts credentials, verifies 302 redirect, and validates authenticated access to the main dashboard.
