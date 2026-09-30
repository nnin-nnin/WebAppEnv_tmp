#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18641}"
USERNAME="${ADMIN_USERNAME:-${USERNAME:-${APP_USERNAME:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-${APP_PASSWORD:-Admin123456!}}}"

echo "Starting kong-admin-ui 0.14.9 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for kong-admin-ui to become ready..."
READY=false
for i in {1..30}; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$STATUS" -eq 200 ] || [ "$STATUS" -eq 302 ]; then
        READY=true
        break
    fi
    sleep 1
done

if [ "$READY" != "true" ]; then
    echo "FAILED: kong-admin-ui failed to start within timeout."
    exit 1
fi

# Initialize admin account if not already created
if [ "$STATUS" -eq 302 ]; then
    echo "Registering initial admin account..."
    curl -s -X POST "http://127.0.0.1:${HOST_PORT}/register" \
      -d "username=${USERNAME}&email=admin@example.com&password=${PASSWORD}&password_confirmation=${PASSWORD}" >/dev/null 2>&1 || true
fi

echo "Environment is up and ready."
