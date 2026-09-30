#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18653}"

echo "Starting Miniflux 2.1.4 with Docker Compose..."
cd "$APP_DIR"

ARCH=$(uname -m)
if [ "$ARCH" = "arm64" ] || [ "$ARCH" = "aarch64" ]; then
    cat <<'EOF' > docker/compose.override.yaml
services:
  app:
    platform: linux/arm64
EOF
fi

if [ -f docker/compose.override.yaml ]; then
    docker compose -f docker/compose.yaml -f docker/compose.override.yaml up -d
else
    docker compose -f docker/compose.yaml up -d
fi

echo "Waiting for Miniflux service to be ready..."
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "Miniflux is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 2
done

echo "Miniflux startup complete on port ${HOST_PORT}."
