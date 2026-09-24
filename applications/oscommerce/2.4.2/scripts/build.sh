#!/usr/bin/env bash
set -Eeuo pipefail

IMAGE="yorem/oscommerce:2.4.2"
ARCHIVE="image/oscommerce-2.4.2-linux-amd64.tar"

mkdir -p image
docker build --platform linux/amd64 --file docker/Dockerfile --tag "$IMAGE" .
docker image inspect "$IMAGE" > image/image.json
rm -f "$ARCHIVE"
docker save --output "$ARCHIVE" "$IMAGE"
sha256sum "$ARCHIVE" image/image.json > image/SHA256SUMS

echo "Built $IMAGE"
echo "Archive: $ARCHIVE"
