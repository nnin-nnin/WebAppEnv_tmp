#!/usr/bin/env bash
set -Eeuo pipefail

APP_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$APP_ROOT"
IMAGE='yorem/dolibarr:20.0.4'
ARCHIVE='image/dolibarr-20.0.4-linux-amd64.tar'

if [[ -z "${DOLIBARR_INITIAL_ADMIN_PASSWORD:-}" ]]; then
  echo '构建失败：需要受控环境变量 DOLIBARR_INITIAL_ADMIN_PASSWORD。' >&2
  exit 2
fi
mkdir -p image
rm -f "$ARCHIVE" image/image.json image/SHA256SUMS
find source/dolibarr-20.0.4 -type f ! -path 'source/dolibarr-20.0.4/.git/*' -print0 | sort -z | xargs -0 sha256sum > source/SHA256SUMS

docker buildx build --platform linux/amd64 --load \
  --secret id=admin_password,env=DOLIBARR_INITIAL_ADMIN_PASSWORD \
  --tag "$IMAGE" --file docker/Dockerfile .
docker save --output "$ARCHIVE" "$IMAGE"
docker image inspect "$IMAGE" > image/image.json
sha256sum "$ARCHIVE" image/image.json > image/SHA256SUMS
echo "已构建 $IMAGE"
echo "镜像归档：$ARCHIVE"

