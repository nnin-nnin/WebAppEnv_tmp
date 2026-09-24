# Dolibarr 19.0.2 Application Environment ()

This is a reproducible environment built from pinned source commit `f12378d732ff3f35ff0a5e5c8467fe522f7385ba` targeting platform `linux/amd64`。最终交付物是单镜像、单容器的 all-in-one 镜像 `yorem/dolibarr:19.0.2`, encapsulating Dolibarr、Apache、PHP 8.2 和 MariaDB 10.11。

## Quick Start

Execute from the repository root:

```bash
cd applications/dolibarr/19.0.2
docker compose -f docker/compose.yaml up -d
```

接收者也可以使用 `scripts/up.sh` 启动，脚本会自动拉取并等待服务就绪。

## Access & Credentials

- Web Entrypoint: `http://localhost:18527/`
- 登录后预期进入 Dolibarr Home/仪表盘，可使用顶部菜单访问第三方、产品、商业、财务和管理等业务区域。
- Initial Username: `admin`
- Initial Password: `WcDoli!26-gK8tP3Y`
- Role: 超级管理员（内部用户，拥有管理权限）。

## Verification

```bash
DOLIBARR_URL=http://localhost:18527 bash scripts/healthcheck.sh
DOLIBARR_PASSWORD='WcDoli!26-gK8tP3Y' bash resources/login.sh
bash resources/register.sh demo-user DemoUser 'Verify-User-2026!'
```

`login.sh` 使用 Dolibarr 真实的登录表单及 CSRF token。Dolibarr No public self-registration API;`register.sh` 使用管理员会话访问真实的“创建内部用户”页面并提交其表单，参数为 `login lastname password [firstname]`。The script does not echo passwords.

## State Reset

```bash
bash scripts/reset.sh
docker compose -f docker/compose.yaml up -d
```

重置会删除该容器的数据卷，不能恢复；需要保留数据时不要执行此命令，应先备份 Docker volume。

## Directory Structure

- `manifest.yaml`: Metadata manifest detailing application, runtime, ports, and operational scripts.
- `source/`: Upstream provenance (`source.yaml`); raw source snapshot excluded.
- `docker/`: Dockerfile and Compose helper configurations.
- `resources/`: User, role, login, and registration helper files.
- `scripts/`: Operational scripts (build, entrypoint, healthcheck, reset).
- `image/`: Metadata (`image.json`); images pulled from Docker Hub.
