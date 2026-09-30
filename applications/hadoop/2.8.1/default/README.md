# Apache Hadoop 2.8.1

Native Docker Compose application runtime environment.

## Prerequisites
- Docker Engine
- Docker Compose v2
- Access to Docker Hub

## Quick Start
Run from the application directory:
```bash
bash scripts/up.sh
```

## Access and Configuration
- Service: YARN ResourceManager
- URL: http://localhost:18644/cluster (container port 8088)

## Verification
```bash
bash scripts/healthcheck.sh
bash resources/login.sh
```

## Teardown
```bash
bash scripts/reset.sh
```
