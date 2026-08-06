#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IMAGE="asteriskax001/sop-phpmyadmin:4.7.9"
ARCHIVE="$ROOT_DIR/image/phpmyadmin-4.7.9-linux-amd64.tar"
cd "$ROOT_DIR"

docker build --provenance=false --platform linux/amd64 --file docker/Dockerfile --tag "$IMAGE" .
docker save --output "$ARCHIVE" "$IMAGE"
docker image inspect "$IMAGE" > image/image.json
sha256sum image/phpmyadmin-4.7.9-linux-amd64.tar image/image.json > image/SHA256SUMS
echo "已构建并导出 $IMAGE"
