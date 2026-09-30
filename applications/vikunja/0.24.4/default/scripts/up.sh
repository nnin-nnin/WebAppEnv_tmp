#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18661}"

echo "Starting Vikunja 0.24.4 with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Waiting for Vikunja service to be ready on port ${HOST_PORT}..."
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/api/v1/info" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "Vikunja is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 1
done

# Initialize admin user
echo "Ensuring initial admin user exists..."
docker compose -f docker/compose.yaml exec -T app /app/vikunja/vikunja user create -u admin -p 'Admin123456!' -e 'admin@example.com' >/dev/null 2>&1 || true

echo "Vikunja startup complete on port ${HOST_PORT}."
