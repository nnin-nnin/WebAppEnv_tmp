# Diaspora (default) Benchmark Environment

Standardized multi-container benchmark environment for Diaspora (version: default / 0.9.1.0).

---

## 1. Environment Details

- **Application**: Diaspora
- **Version**: default (`0.9.1.0`)
- **Upstream Repository**: https://github.com/diaspora/diaspora
- **Pinned Commit**: `f96527862dc1ba2e5b95c4196efb0d1f0cc4b6e5`
- **Target Platform**: `linux/amd64`
- **Public URL**: `http://localhost:18815/`
- **Host Port Mapping**: `18815:80`
- **Runtime Topology**:
  - `app`: Diaspora Ruby 3.3 / Rails 6.1 with Puma 7.2 & Sidekiq 7.3 (`yorem/diaspora:default`)
  - `db`: PostgreSQL 14 (`postgres:14`)
  - `redis`: Redis 7 (`redis:7`)

---

## 2. Initial Administrator Credentials

- **Username**: `admin`
- **Password**: `AdminPassword123!`
- **Email**: `admin@example.com`
- **Role**: `admin`
- **Zero-Install Wizard Status**: Pre-seeded on cold start with `getting_started = false`. No manual onboarding wizard required.

---

## 3. Directory Layout

```text
diaspora/default/default/
├── README.md               # Application documentation and benchmark credentials
├── manifest.yaml           # Metadata manifest with pinned commit, ports, and image digests
├── docker/
│   ├── Dockerfile          # Standardized container build recipe
│   ├── compose.yaml        # Multi-container Compose deployment
│   ├── database.yml        # Rails database connection specification
│   ├── diaspora.toml       # Diaspora application configuration
│   ├── entrypoint.sh       # Container entrypoint with auto-migration and auto-seed
│   └── seed_admin.rb       # Ruby script ensuring admin user existence
├── image/
│   └── image.json          # Pinned image names and sha256 digests
├── resources/
│   ├── login.sh            # Automated admin login verification script
│   ├── roles.yaml          # System roles definition
│   └── users.yaml          # User credentials specification
├── scripts/
│   ├── build.sh            # Local image build script
│   ├── healthcheck.sh      # Service status and end-to-end login validation
│   ├── reset.sh            # Environment cleanup and volume purge script
│   └── up.sh               # Environment launch and readiness polling script
└── source/
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

1. **Cold Start Zero-Wizard**: Container entrypoint automatically executes `db:create`, `db:migrate`, and seeds the `admin` account with pre-populated aspects and `getting_started: false`.
2. **Reverse Proxy / Server Integration**: Puma server binds to `0.0.0.0:80` and serves compiled static assets directly (`configuration.environment.assets.serve = true`).
3. **End-to-End Authentication**: `resources/login.sh` retrieves the authenticity token, authenticates via `POST /users/sign_in`, and verifies administrative access to `/admins/dashboard`.
