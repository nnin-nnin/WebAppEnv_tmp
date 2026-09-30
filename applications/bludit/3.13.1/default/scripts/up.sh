#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18747}"
URL="http://localhost:${HOST_PORT}"

echo "Starting Bludit 3.13.1 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Containers started. Waiting for application to initialize..."
for i in {1..30}; do
    if curl -s -I "$URL" >/dev/null 2>&1; then
        break
    fi
    sleep 1
done

# If installation is pending, complete it automatically
if curl -s -I "$URL" | grep -q "install.php"; then
    curl -s -X POST -d "timezone=UTC&password=AdminPassword123!" "${URL}/install.php?language=en" >/dev/null 2>&1 || true
fi

echo "Initialization complete."
