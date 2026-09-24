# Apache Airflow 3.3.0 Native Multi-Container Docker Compose Environment

This deliverable provides the native multi-container Docker Compose reproducible runtime environment based on **Apache Airflow 3.3.0**.

> [!IMPORTANT]
> **Multi-Container Topology**:  
> This deliverable is a **native multi-container Docker Compose environment**, not an all-in-one single container.  
> Airflow application components, the PostgreSQL database, and Redis cache/broker run in decoupled containers connected via Docker Compose bridge networking.  
> Users do **not** need to install databases, import SQL dumps, manually configure networks, or set host environment variables.

---

## 1. Prerequisites

- **Docker Engine**: v20.10+
- **Docker Compose**: v2.0+
- **Target Platform**: `linux/amd64` (ARM64 / Apple Silicon hosts supported via Docker emulation)
- **Network**: Network access to Docker Hub to pull images

---

## 2. Standard Launch Procedure

### Pull from Docker Hub and Start Environment

```bash
# 1. Pull pinned container images
docker compose -f docker/compose.yaml pull

# 2. Launch container topology in background
docker compose -f docker/compose.yaml up -d
```

Or execute the provided lifecycle orchestration script:

```bash
./scripts/up.sh
```

---

## 3. Access & Default Credentials

- **Web UI / API URL**: [http://localhost:18010](http://localhost:18010)
- **Initial Admin Username**: `admin`
- **Initial Admin Password**: `benchmark-only`
- **Role**: `Admin`

Access `http://localhost:18010` in a browser and enter the admin credentials to enter the Airflow management console.

---

## 4. Service Architecture & Topology

| Service Name | Container Responsibility | Image & Version | Exposed Port | Dependencies |
| :--- | :--- | :--- | :--- | :--- |
| **`postgres`** | PostgreSQL 16 relational database | `postgres:16` | Internal | None (Healthcheck configured) |
| **`redis`** | Redis 7.2 Celery broker & cache | `redis:7.2-bookworm` | Internal | None (Healthcheck configured) |
| **`airflow-apiserver`** | Airflow Web UI & REST API gateway | `yorem/apache-airflow:3.3.0` | `18010:8080` | `postgres`, `redis`, `airflow-init` |
| **`airflow-scheduler`** | Airflow task scheduler | `yorem/apache-airflow:3.3.0` | Internal | `postgres`, `redis`, `airflow-init` |
| **`airflow-dag-processor`**| Airflow DAG parser & processor | `yorem/apache-airflow:3.3.0` | Internal | `postgres`, `redis`, `airflow-init` |
| **`airflow-worker`** | Celery Worker task executor | `yorem/apache-airflow:3.3.0` | Internal | `postgres`, `redis`, `airflow-apiserver`, `airflow-init` |
| **`airflow-triggerer`** | Airflow asynchronous triggerer | `yorem/apache-airflow:3.3.0` | Internal | `postgres`, `redis`, `airflow-init` |
| **`airflow-init`** | Database migration & admin initialization | `yorem/apache-airflow:3.3.0` | Internal | `postgres`, `redis` |

---

## 5. Verification & Operations Scripts

### Health Check

Verify Compose configuration validity, container health, and Web UI HTTP endpoint:

```bash
./scripts/healthcheck.sh
```

### Automated Login Verification

Verify live authentication via login probe:

```bash
./resources/login.sh
```

### User Registration

Create a regular user via internal Airflow CLI:

```bash
./resources/register.sh newuser newpassword123 newuser@example.com User
```

### Environment Reset

Stop and remove all containers, networks, and data volumes:

```bash
./scripts/reset.sh
```

---

## 6. Deliverable Directory Structure

```text
apache-airflow/3.3.0/default/
├── README.md                 # Deployment and operations manual
├── manifest.yaml             # Environment metadata and specification
├── source/
│   └── source.yaml           # Pinned upstream GitHub repository and commit hash
├── resources/
│   ├── users.yaml            # Pre-seeded users definition
│   ├── roles.yaml            # Role and permission mappings
│   ├── login.sh              # Automated authentication script
│   └── register.sh           # User registration script
├── docker/
│   └── compose.yaml          # Standard Docker Compose configuration
└── scripts/
    ├── up.sh                 # Launch and healthcheck wait script
    ├── healthcheck.sh        # Health check script
    └── reset.sh              # Environment reset and cleanup script
```

---

## 7. Images & Pinned Digests

| Service | Deliverable Image | Tag | Digest / Identification | Provenance |
| :--- | :--- | :--- | :--- | :--- |
| Airflow Components | `yorem/apache-airflow:3.3.0` | `3.3.0` | `sha256:977cb287a1f8e70e27e820439a36037c8db52a5e022d67a903f668ba77bd91dd` | Derived from `apache/airflow:3.3.0` hosted under `yorem` |
| PostgreSQL | `postgres` | `16` | Official pinned release | Docker Hub official image |
| Redis | `redis` | `7.2-bookworm` | Official pinned release | Docker Hub official image |

---

## 8. Differences with Official Compose

1. **Standardized Image Registry**: Pinned and hosted under Docker Hub `yorem/apache-airflow:3.3.0`.
2. **Fixed Port Allocation**: Mapped external web UI to assigned port `18010:8080`.
3. **Pre-configured Credentials**: Configured default benchmark credentials (`admin` / `benchmark-only`).
4. **Idempotent Automation**: Fixed Fernet Key and JWT Secret for zero-interaction automated launch.
