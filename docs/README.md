# Web Application Environment Packaging & Verification Specification

## 1. Background & Motivation

This benchmark repository provides reproducible, deterministic target environments for empirical Web security research, automated exploit generation (AEG), SWE benchmarks, and autonomous security agent evaluation (LLM-based agents).

Every application version is housed in an isolated, decoupled directory containing:
- Upstream source repository URL and immutable Git commit hash (`source/source.yaml`);
- Standardized container orchestrations (`Dockerfile` and `compose.yaml`);
- Pre-seeded users, role bindings, and database migrations (`resources/`);
- Autonomous lifecycle and verification scripts (`scripts/`);
- Cryptographic image digests (`image/image.json`).

Source code trees and raw image tarballs are excluded from version control to prevent repository bloat. Users launch target environments with a single Docker command; containers pull pre-built immutable images from Docker Hub, initialize all services into steady state, and enable immediate browser and API interaction with zero setup wizards.

## 2. Directory Layout & Deliverable Specification

Each environment suite resides in `applications/<application-name>/<version>/<optional-variant>/`:

```text
applications/<application-name>/<version>/<optional-variant>/
├── README.md               # Quickstart guide, port mappings, pre-seeded credentials, and verification steps
├── manifest.yaml           # Metadata index of source commits, runtimes, exposed ports, and image tags
├── source/                 # Upstream Git provenance (source.yaml); no raw source trees included
├── resources/              # Pre-seeded users (users.yaml), roles, SQL migrations, and login/register scripts
├── docker/                 # Production Dockerfile and docker-compose.yaml configuration
├── scripts/                # Life-cycle operations: build.sh, up.sh, healthcheck.sh, reset.sh, entrypoint.sh
└── image/                  # Metadata (image.json); image binaries are hosted on Docker Hub
```

| Path | Description |
| :--- | :--- |
| `README.md` | Application version, quickstart launch commands, web entrypoints, accounts, and testing procedures. |
| `manifest.yaml` | Machine-readable manifest specifying runtime dependencies, exposed ports, image refs, and assets. |
| `source/` | Upstream Git provenance (`source/source.yaml`) locking commit hashes without repository bloat. |
| `resources/` | Seed data, credentials, role hierarchies, and scriptable authentication helpers. |
| `docker/` | Dockerfile and Compose configurations for local build and reproducible container orchestration. |
| `scripts/` | Lifecycle management: build, bootstrap, health check, credential verification, and state reset. |
| `image/` | Image metadata (`image.json`). Image binaries are hosted on Docker Hub under `yorem/<app>:<version>`. |

The end deliverable is a self-contained, immediately actionable runtime topology. Containers encapsulate their own application runtimes (PHP, Node, Java, Python), database engines (MySQL/MariaDB, PostgreSQL), and pre-seeded database states.

## 3. Automation Tools (`code/`)

### `codex_environment_runner.py`
The orchestration runner reads and parameterizes `code/prompts/application-environment-all-in-one.md`, delegating workspace inspection, packaging, and validation to the local Codex CLI.

Run logs are persisted to `code/runs/`:
- `<run-id>.json`: Latency, completion status, and token metrics.
- `<run-id>.events.log`: Full raw JSONL events.
- `<run-id>.last-message.md`: Summary response.

Authenticate Codex prior to execution:
```bash
codex login
export CODEX_ADMIN_PASSWORD='benchmark-only'
```

Launch EspoCRM 8.2.5 packaging example:
```bash
python3 code/codex_environment_runner.py \
  --application EspoCRM \
  --version 8.2.5 \
  --source-repository https://github.com/espocrm/espocrm \
  --commit 06be47c3488c7c369ee879b920ec4c3fc4acbb5d \
  --image-name yorem/espocrm \
  --host-port 18092 \
  --workdir .
```

### `test_codex_environment_runner.py`
Unit tests for parameter substitution, placeholder detection, and token tracking:
```bash
python3 code/test_codex_environment_runner.py
```

Parameter validation without invoking Codex:
```bash
python3 code/codex_environment_runner.py \
  --application Example \
  --version 1.0 \
  --source-repository https://example.test/source \
  --commit 0000000 \
  --image-name example \
  --host-port 18080 \
  --admin-password placeholder \
  --validate-only
```

## 4. Verification Protocol & Mitigating Environmental False Positives

Automated scripts and HTTP status checks (`200 OK`) alone do not prove operational steady state. To eliminate the **Shallow Liveness Fallacy**, every environment must satisfy multi-tier operational assertions.

### 4.1 Taxonomy of Environmental False Positives
1. **Zombie Liveness ($\mathcal{FP}_{\text{port}}$)**: Port accepts TCP SYN-ACK, but internal daemon is hanging or exited.
2. **Shallow White Screen ($\mathcal{FP}_{\text{http}}$)**: HTTP returns 200, but page renders unhandled PHP fatal errors or setup wizard prompts.
3. **Authentication Broken ($\mathcal{FP}_{\text{auth}}$)**: Login UI loads, but pre-seeded passwords mismatch, CSRF fails, or session storage is unwritable.
4. **Empty Shell ($\mathcal{FP}_{\text{crud}}$)**: Static pages load, but database schema is unmigrated or default seed datasets are missing.
5. **Persistence Evaporation ($\mathcal{FP}_{\text{persist}}$)**: Cold start works, but storage volumes are ephemeral, wiping databases upon container reboot.

### 4.2 Multi-Tier Verification Steps

#### Step 1: Directory Integrity Inspection
Verify required assets exist:
```bash
cd applications/<app-name>/<version>/<variant>
ls -la
find source docker resources scripts image -maxdepth 2 -type f | sort
```
Confirm:
- `manifest.yaml` matches the runtime specs, ports, and image tags in `README.md`;
- `source/source.yaml` specifies upstream git repository and commit hash;
- `resources/users.yaml` contains default `admin` and regular user entries;
- `scripts/healthcheck.sh` and `resources/login.sh` are executable;
- `image/image.json` locks the image digest.

#### Step 2: Container Launch
Pull and run the pre-built image from Docker Hub:
```bash
docker run -d -p <host-port>:80 yorem/<app-name>:<version>
# or for multi-container compose:
./scripts/up.sh
```
Check container status:
```bash
docker ps
docker logs <container-id>
```

#### Step 3: Scripted Health Check
Execute the local automated check:
```bash
./scripts/healthcheck.sh
```
Checks:
- HTTP endpoint connectivity;
- API or authentication endpoint availability;
- Credential validation via `resources/login.sh`.

#### Step 4: End-to-End Browser Verification
Open the web entrypoint in a browser:
1. Verify the real application homepage or login form displays (no setup wizard, no Apache/Nginx default placeholder, no unhandled PHP trace).
2. Authenticate using pre-seeded credentials (`admin` / `benchmark-only`).
3. Verify navigation renders internal dashboard, administrative menus, and seed records.
4. Verify non-admin role authentication when multi-role configurations are present.

#### Step 5: Reboot Persistence Assertion
Restart the running container:
```bash
docker restart <container-id>
```
Re-verify web entrypoint and re-authenticate. Confirm that database tables, users, and state persist across container restarts.

## 5. Walkthrough Example: EspoCRM 8.2.5

### 1. Check Directory
```bash
cd applications/espocrm/8.2.5/default
head -n 30 README.md
cat manifest.yaml
cat resources/users.yaml
```

### 2. Pull & Run
```bash
docker run -d \
  --platform linux/amd64 \
  --name espocrm-8.2.5 \
  -p 18092:80 \
  yorem/espocrm:8.2.5

docker ps
docker logs espocrm-8.2.5
```

### 3. Automated Check
```bash
./scripts/healthcheck.sh
```

### 4. Interactive Browser Login
Open `http://localhost:18092`:
1. Observe the EspoCRM login form;
2. Enter username `admin` and password `benchmark-only`;
3. Confirm successful entry into the CRM administrative dashboard.

### 5. Restart Test
```bash
docker restart espocrm-8.2.5
```
Re-access `http://localhost:18092` and log in again to verify persistence of MariaDB, Apache, and application state.
