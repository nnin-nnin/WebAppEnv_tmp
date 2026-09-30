# Spree (default) Benchmark Environment

Standardized multi-container benchmark environment for Spree Commerce (version: default / main).

---

## 1. Environment Details

- **Application**: Spree
- **Version**: default
- **Upstream Repository**: https://github.com/spree/spree.git
- **Pinned Commit**: `73a078b88b118b82ff841e6c36b067a08677abd9`
- **Target Platform**: `linux/amd64`
- **Public URL**: `http://127.0.0.1:18866/`
- **Host Port Mapping**: `18866:3000`
- **Deployment Mode**: `native_compose`
- **Delivery Method**: `DOCKERHUB`
- **Runtime Topology**:
  - `application`: Spree Commerce Ruby 4.0 / Rails 8.1 with Puma (`yorem/spree:default`)
  - `db`: PostgreSQL 16 Alpine (`postgres:16-alpine`)

---

## 2. Initial Administrator Credentials

- **Username**: `admin@example.com`
- **Password**: `AdminPassword123!`
- **Email**: `admin@example.com`
- **Role**: `admin`
- **Zero-Install Wizard Status**: Database pre-seeded via `resources/database-seed.sql` on cold start with complete schema, store defaults, and administrator account ready. No manual onboarding wizard required.

---

## 3. Directory Layout

```text
spree/default/default/
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

1. **Cold Start Zero-Wizard**: PostgreSQL container loads `resources/database-seed.sql` automatically, creating the complete schema and `admin@example.com` user without interactive setup.
2. **Built-in React Dashboard**: Admin dashboard UI is accessible at `/dashboard`.
3. **End-to-End Authentication**: `resources/login.sh` verifies dashboard accessibility, authenticates against `/api/v3/admin/auth/login` to obtain an admin JWT token, and validates access to `/api/v3/admin/dashboard/counters`.
