#!/usr/bin/env bash
set -Eeuo pipefail

IMAGE_NAME=asteriskax001/sop-prestashop:9.1.4
CONTAINER_NAME=${CONTAINER_NAME:-prestashop-914}
HOST_PORT=${HOST_PORT:-18401}

docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
exec docker run -d --name "$CONTAINER_NAME" -p "$HOST_PORT:80" "$IMAGE_NAME"
