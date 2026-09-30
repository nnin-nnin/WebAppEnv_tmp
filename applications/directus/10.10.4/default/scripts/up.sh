#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18657}"

echo "Starting Directus 10.10.4 with Docker Compose..."
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

echo "Waiting for Directus service to be ready on port ${HOST_PORT}..."
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/server/ping" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "Directus is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 2
done

echo "Directus startup complete on port ${HOST_PORT}."
