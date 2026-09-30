# Open edX (default)

Open edX LMS (Learning Management System) standard containerized environment.

## Application Information

- **Application**: open-edx
- **Version**: default
- **Upstream Repository**: https://github.com/openedx/edx-platform
- **Commit**: ca039029e4918f02903b1c7d62adf8b3ad74f75b
- **Delivery Image**: yorem/open-edx:default (linux/amd64)
- **Database Image**: mariadb:10.5 (linux/amd64)
- **Deployment Mode**: Native Docker Compose (Multi-container)
- **Host Port**: 18848:8000
- **URL**: http://127.0.0.1:18848/

## Default Credentials

| Username / Email | Password | Role | Description |
| :--- | :--- | :--- | :--- |
| `admin@example.com` (or `admin`) | `AdminPassword123!` | Administrator | Super Administrator with full permissions |
| `instructor@example.com` | `InstructorPassword123!` | Staff | Instructor and Course Staff |
| `student@example.com` | `StudentPassword123!` | Student | Standard Learner Account |

## Lifecycle Management

### 1. Launch Service
```bash
./scripts/up.sh
```

### 2. Check Health
```bash
./scripts/healthcheck.sh
```

### 3. Verify Authentication
```bash
./resources/login.sh
```

### 4. Teardown / Reset
```bash
./scripts/reset.sh
```
