#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18578}"

echo "Starting Bonita BPM 7.15.0 with Docker Compose..."
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

echo "Waiting for Bonita BPM service to be ready on port ${HOST_PORT}..."
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/bonita/" || true)
    if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
        echo "Bonita BPM service is ready (HTTP ${HTTP_CODE})."
        break
    fi
    sleep 2
done

echo "Bonita BPM container started."
