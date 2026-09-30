#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18683}"
USERNAME="${ADMIN_USERNAME:-${USERNAME:-${APP_USERNAME:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-${APP_PASSWORD:-Admin123456!}}}"

echo "Starting AdGuard Home 0.107.52 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for AdGuard Home to become ready on port ${HOST_PORT}..."
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
    echo "FAILED: AdGuard Home failed to start within timeout."
    exit 1
fi

# Check if initial setup is needed
NEED_CONFIG=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/control/install/get_addresses" || true)
if [ "$NEED_CONFIG" -eq 200 ]; then
    echo "Performing initial setup for AdGuard Home..."
    curl -s -X POST "http://127.0.0.1:${HOST_PORT}/control/install/configure" \
      -H "Content-Type: application/json" \
      -d "{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\",\"web\":{\"ip\":\"0.0.0.0\",\"port\":3000},\"dns\":{\"ip\":\"0.0.0.0\",\"port\":53}}" >/dev/null 2>&1 || true
    sleep 2
fi

echo "Environment is up and ready."
