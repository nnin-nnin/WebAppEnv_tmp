# Alfresco Community Edition Native Multi-Container Docker Compose Environment

This directory delivers the native multi-container Docker Compose deployment for **Alfresco Community Edition (ACS)**, pinned to version `26.3.0.19` (Alfresco Repository) / `26.2.0` (Alfresco Content Services topology).

## Architecture Overview

- **Native Multi-Container Topology**: The application (Alfresco Content Repository), web management client (Alfresco Share), database (PostgreSQL), search engine (Elasticsearch), message broker (ActiveMQ), transform engine (Transform Core AIO), and reverse proxy gateway (Nginx) run in isolated containers.
- Decoupled containers communicate through the internal Compose bridge network via service hostnames (`postgres`, `elasticsearch`, `activemq`).
- Zero manual database setup, SQL schema imports, or Docker network configurations are required.

## 1. Prerequisites

- **Docker Engine**: v24.0.0+
- **Docker Compose**: v2.0.0+
- **Target Platform**: `linux/amd64` (ARM64 hosts supported via emulation)
- **Memory Requirements**: Minimum 6GB host RAM allocated to Docker daemon

## 2. Quick Start

Pull images from Docker Hub and start the multi-container topology:

```bash
# 1. Pull pinned container images
docker compose -f docker/compose.yaml pull

# 2. Launch all services in background
docker compose -f docker/compose.yaml up -d
```

Or execute the provided lifecycle orchestration script:

```bash
bash scripts/up.sh
```

## 3. Access & Credentials

- **Main Gateway / Nginx Proxy**: `http://localhost:18006/`
- **Alfresco Share Web Management**: `http://localhost:18006/share/`
- **Alfresco Content Repository API / ReST Probe**: `http://localhost:18006/alfresco/`
- **Alfresco Content App**: `http://localhost:18006/content-app/`
- **Alfresco Control Center**: `http://localhost:18006/control-center/`

### Default Admin Credentials
- **Username**: `admin`
- **Password**: `admin`
- **Role**: `ALFRESCO_ADMINISTRATORS` (Super Administrator)

## 4. Service Topology

| Service Name | Responsibility | Image | Port Mapping |
| :--- | :--- | :--- | :--- |
| `proxy` | Nginx reverse proxy gateway | `nginx:1.27-alpine` | `18006:8080` |
| `alfresco` | Alfresco Content Repository core | `yorem/alfresco:26.3.0.19` | Internal 8080 |
| `share` | Alfresco Share web UI client | `docker.io/alfresco/alfresco-share:26.2.0` | Internal 8080 |
| `postgres` | PostgreSQL relational database | `postgres:17.4-alpine` | Internal 5432 |
| `elasticsearch` | Search engine (Elasticsearch) | `elasticsearch:8.17.10` | Internal 9200 |
| `activemq` | ActiveMQ message broker | `docker.io/alfresco/alfresco-activemq:6.2.6-jre17-rockylinux8` | Internal 61616/8161 |
| `transform-core-aio` | Document transformation engine | `alfresco/alfresco-transform-core-aio:5.4.3` | Internal 8090 |
| `batch-indexing` | Elasticsearch batch indexer | `docker.io/alfresco/alfresco-elasticsearch-batch-indexing:5.7.0` | Internal |
| `content-app` | Content App modern web UI | `alfresco/alfresco-content-app:8.0.0` | Internal 8080 |
| `control-center` | Control Center administration console | `quay.io/alfresco/alfresco-control-center:11.0.0` | Internal 8080 |

## 5. Verification & Operational Commands

### Health Check
Verify service readiness and HTTP probes:
```bash
bash scripts/healthcheck.sh
```

### Authentication Test
Verify default `admin` authentication and retrieve auth ticket:
```bash
bash resources/login.sh
```

### User Registration
Create a standard Alfresco user account:
```bash
bash resources/register.sh newuser Password123! newuser@example.com
```

### Environment Reset
Stop and clean all containers, networks, and named volumes:
```bash
bash scripts/reset.sh
```

## 6. Directory Structure

```text
.
├── README.md                 # Deployment and operations manual
├── manifest.yaml             # Application metadata and specification
├── source/
│   └── source.yaml           # Pinned upstream GitHub repository URL and commit
├── docker/
│   ├── compose.yaml          # Core Docker Compose configuration
│   └── nginx.conf            # Nginx reverse proxy routing rules
├── resources/
│   ├── users.yaml            # Pre-seeded users definition
│   ├── roles.yaml            # Role and permission mappings
│   ├── login.sh              # Automated authentication script
│   └── register.sh           # User registration script
└── scripts/
    ├── up.sh                 # Launch and healthcheck wait script
    ├── healthcheck.sh        # Health check script
    └── reset.sh              # Cleanup and reset script
```

## 7. Differences with Official Compose

1. **Image Pinning**: Core images are pushed to Docker Hub as `yorem/alfresco:26.3.0.19` (Digest: `sha256:bddb4e96b0452208ae836993b12b35afad596e9fabf71ccb814d4f86383c18db`).
2. **Security Proxy**: Replaced Traefik (which required host `/var/run/docker.sock` binding) with standard Nginx, mitigating host-escape security risks.
3. **Port Mapping**: Centralized entrypoint mapping to port `18006`.
4. **Configuration Consolidation**: Consolidated multi-file templates (`commons/base.yaml`) into a single self-contained `docker/compose.yaml`.
