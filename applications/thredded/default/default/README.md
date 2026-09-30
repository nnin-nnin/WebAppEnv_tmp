# Thredded (default) Benchmark Environment

Standardized multi-container benchmark environment for Thredded Forum Engine (version: default / main).

---

## 1. Environment Details

- **Application**: Thredded
- **Version**: default
- **Upstream Repository**: https://github.com/thredded/thredded.git
- **Pinned Commit**: `a9c234692736070b8ac4e7dce9b6bf7d38559688`
- **Target Platform**: `linux/amd64`
- **Public URL**: `http://127.0.0.1:18870/` (Forum: `http://127.0.0.1:18870/thredded`)
- **Host Port Mapping**: `18870:3000`
- **Deployment Mode**: `native_compose`
- **Delivery Method**: `DOCKERHUB`
- **Runtime Topology**:
  - `application`: Thredded Ruby on Rails Forum Engine with Puma (`yorem/thredded:default`)
  - `db`: PostgreSQL 16 Alpine (`postgres:16-alpine`)

---

## 2. Initial Administrator Credentials

- **Username**: `admin@example.com`
- **Password**: `AdminPassword123!`
- **Email**: `admin@example.com`
- **Role**: `admin`
- **Zero-Install Wizard Status**: Database pre-seeded via `resources/database-seed.sql` on cold start with complete schema, categories, default messageboard, welcome topic, and administrator account ready. No manual onboarding wizard required.

---

## 3. Directory Layout

```text
thredded/default/default/
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
├── source/
│   ├── SHA256SUMS          # Checksum for source metadata
│   └── source.yaml         # Upstream source tracking and commit pin
└── verification-report/
    ├── verification-report.json
    └── verification-report.md
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

1. **Cold Start Zero-Wizard**: PostgreSQL container automatically imports `resources/database-seed.sql`, creating the complete schema and `admin@example.com` user without interactive setup.
2. **Minimal Forum UI**: Accessible at `/` (landing page) and `/thredded` (messageboard).
3. **End-to-End Authentication**: `resources/login.sh` verifies forum accessibility, authenticates against `/user_sessions`, acquires session cookie, and validates persistent administrative session in the forum header.
