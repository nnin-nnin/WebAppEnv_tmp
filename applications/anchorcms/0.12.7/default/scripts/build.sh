#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

IMAGE_NAME="yorem/anchorcms:0.12.7"

echo "=== Building AnchorCMS Docker Image: ${IMAGE_NAME} ==="
cd "$APP_DIR"

docker build \
    --platform linux/amd64 \
    -f docker/Dockerfile \
    -t "${IMAGE_NAME}" \
    .

echo "SUCCESS: Built image ${IMAGE_NAME}!"
