#!/bin/bash
set -Eeuo pipefail

cd "$(dirname "$0")/.."
IMAGE=yorem/itop:3.1.1
ARCHIVE=itop-3.1.1-linux-amd64.tar
if [ -z "${ITOP_ADMIN_PASSWORD:-}" ]; then
  echo '构建需要通过受控环境变量 ITOP_ADMIN_PASSWORD 提供初始化凭据。' >&2
  exit 2
fi

secret_file=$(mktemp)
trap 'rm -f "$secret_file"' EXIT
chmod 600 "$secret_file"
printf '%s' "$ITOP_ADMIN_PASSWORD" > "$secret_file"
DOCKER_BUILDKIT=1 docker build --platform linux/amd64 --secret id=itop_admin_password,src="$secret_file" -f docker/Dockerfile -t "$IMAGE" .
mkdir -p image
docker save --output "image/$ARCHIVE" "$IMAGE"
docker image inspect "$IMAGE" > image/image.json
(cd image && sha256sum "$ARCHIVE" image.json > SHA256SUMS)
