# GitLab 16.11.2-ce.0 Application Environment ()

这是 GitLab 16.11.2-ce.0 的完整 Web 应用 all-in-one 环境，targeting platform `linux/amd64`。最终镜像为单镜像、单容器；镜像内部包含 GitLab Web 应用、NGINX、Puma、Sidekiq、PostgreSQL、Redis、Gitaly 及初始化逻辑。

## Quick Start

Execute from the repository root:

```bash
cd applications/gitlab/16.11.2-ce.0
docker compose -f docker/compose.yaml up -d
```

Docker automatically pulls the image from Docker Hub. The image encapsulates the application, database, and initialization routines; no local build scripts, bootstrap steps, or web installers are required.

## Access & Credentials

- Web Entrypoint: `http://127.0.0.1:18528/`
- Logging in accesses the GitLab project/group navigation and application dashboard, rather than a status page or API docs.
- Initial Admin Username: `admin`
- Role: 实例管理员（Administrator）
- Initial Admin Password: `WcGit!26-lP4yN8C`。This password is injected at startup via `GITLAB_INITIAL_ADMIN_PASSWORD`; configured by default in compose.yaml.

## Verification

Host-side HTTP verification:

```bash
GITLAB_URL=http://127.0.0.1:18528 ./scripts/healthcheck.sh
```

Authentication verification via live login endpoint:

```bash
GITLAB_URL=http://127.0.0.1:18528 GITLAB_USERNAME=admin GITLAB_PASSWORD='WcGit!26-lP4yN8C' ./resources/login.sh
```

Standard user creation uses the verified GitLab REST API, requiring an administrator API token:

```bash
GITLAB_URL=http://127.0.0.1:18528 GITLAB_ADMIN_TOKEN='<GitLab 个人访问令牌>' \
  ./resources/register.sh ordinary ordinary@example.invalid
```

## State Reset

Reset is a destructive operation:

```bash
./scripts/reset.sh
```

The script stops and removes the deliverable containers and named volumes. Re-executing `docker compose up -d` per the launch instructions re-initializes the application.

## Directory Structure

- `manifest.yaml`: Metadata manifest detailing application, runtime, ports, and operational scripts.
- `source/`: Upstream provenance (`source.yaml`); raw source snapshot excluded.
- `docker/`: Dockerfile and Compose configurations.
- `resources/`: Pre-seeded user roles and authentication helpers.
- `scripts/`：构建、入口、宿主机健康检查、启动辅助和重置脚本。
- `image/`: Metadata (`image.json`); images pulled from Docker Hub.
