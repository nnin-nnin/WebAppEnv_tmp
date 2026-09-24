#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
IMAGE=yorem/nextcloud:29.0.1
TAR_PATH="$ROOT_DIR/image/nextcloud-29.0.1-linux-amd64.tar"
SECRET_FILE=$(mktemp)
cleanup() { rm -f "$SECRET_FILE"; }
trap cleanup EXIT

: "${NEXTCLOUD_ADMIN_PASSWORD:?NEXTCLOUD_ADMIN_PASSWORD must be supplied through the controlled build environment}"
printf '%s' "$NEXTCLOUD_ADMIN_PASSWORD" > "$SECRET_FILE"
mkdir -p "$ROOT_DIR/image"
rm -f "$TAR_PATH" "$ROOT_DIR/image/image.json" "$ROOT_DIR/image/SHA256SUMS"

DOCKER_BUILDKIT=1 docker build \
    --platform linux/amd64 \
    --secret id=admin_password,src="$SECRET_FILE" \
    --tag "$IMAGE" \
    --file "$ROOT_DIR/docker/Dockerfile" \
    "$ROOT_DIR"

docker save --output "$TAR_PATH" "$IMAGE"
docker image inspect "$IMAGE" > "$ROOT_DIR/image/image.json"
(
    cd "$ROOT_DIR"
    sha256sum "image/$(basename "$TAR_PATH")" image/image.json > image/SHA256SUMS
)
echo "Built $IMAGE"
echo "Archive: $TAR_PATH"
