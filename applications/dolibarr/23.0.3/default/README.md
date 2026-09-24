# Dolibarr 23.0.3 Application Environment ()

This is a reproducible environment built from pinned source commit `36001c855242d6d4f83d600c2e5a8586d73878d6` targeting platform `linux/amd64`。最终交付物是单镜像、单容器的 all-in-one 镜像 `yorem/dolibarr:23.0.3`, encapsulating Dolibarr、Apache、PHP 8.2 和 MariaDB 10.11。

## Quick Start

Execute from the repository root:

```bash
cd applications/dolibarr/23.0.3/default
docker run -d -p 18525:80 --name dolibarr-23.0.3 yorem/dolibarr:23.0.3
```

接收者只需要执行 `docker run`，Docker automatically pulls the image from Docker Hub. The image encapsulates the application, database, and initialization routines; no local build scripts, bootstrap steps, or web installers are required.Optionally use Docker volumes for persistent storage.

## Access & Credentials

- Web Entrypoint: `http://localhost:18525/`
- 登录后预期进入 Dolibarr Home/仪表盘，可使用顶部菜单访问第三方、产品、商业、财务和管理等业务区域。
- Initial Username: `admin`
- Initial Password: `WcDoli!26-gK8tP3Y`
- Role: 超级管理员（内部用户，拥有管理权限）。

## Verification

```bash
DOLIBARR_URL=http://localhost:18525 bash scripts/healthcheck.sh
DOLIBARR_PASSWORD='WcDoli!26-gK8tP3Y' bash resources/login.sh
bash resources/register.sh demo-user DemoUser 'Verify-User-2026!'
```

`login.sh` 使用 Dolibarr 真实的登录表单及 CSRF token。Dolibarr No public self-registration API;`register.sh` 使用管理员会话访问真实的“创建内部用户”页面并提交其表单，参数为 `login lastname password [firstname]`。The script does not echo passwords.

## State Reset

Removing the container and its anonymous volumes followed by a restart restores state from the initialized seed database:

```bash
bash scripts/reset.sh dolibarr-23.0.3
docker run -d -p 18525:80 --name dolibarr-23.0.3 yorem/dolibarr:23.0.3
```

Reset permanently deletes container data and is irreversible; backup Docker volumes if data preservation is needed.

## Directory Structure

- `manifest.yaml`: Metadata manifest detailing application, runtime, ports, and operational scripts.
- `source/`: Upstream provenance (`source.yaml`); raw source snapshot excluded.
- `docker/`: Dockerfile and Compose helper configurations.
- `resources/`: User, role, login, and registration helper files.
- `scripts/`: Operational scripts (build, entrypoint, healthcheck, reset).
- `image/`: Metadata (`image.json`); images pulled from Docker Hub.
