#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18679}"
USERNAME="${ADMIN_USERNAME:-${USERNAME:-${APP_USERNAME:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-${APP_PASSWORD:-Admin123456!}}}"

echo "Starting jellyfin 10.9.9 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for jellyfin to become ready on port ${HOST_PORT}..."
READY=false
for i in {1..60}; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/System/Info/Public" || true)
    if [ "$STATUS" -eq 200 ]; then
        READY=true
        break
    fi
    sleep 1
done

if [ "$READY" != "true" ]; then
    echo "FAILED: jellyfin failed to start within timeout."
    exit 1
fi

echo "Checking if initial setup is required..."
INFO=$(curl -s "http://127.0.0.1:${HOST_PORT}/System/Info/Public" || true)
if echo "$INFO" | grep -q '"StartupWizardCompleted":false'; then
    echo "Initializing Jellyfin admin account (${USERNAME})..."
    curl -s "http://127.0.0.1:${HOST_PORT}/Startup/FirstUser" >/dev/null 2>&1 || true

    curl -s -X POST "http://127.0.0.1:${HOST_PORT}/Startup/User" \
        -H "Content-Type: application/json" \
        -d "{\"Name\":\"${USERNAME}\",\"Password\":\"${PASSWORD}\"}" >/dev/null 2>&1 || true

    curl -s -X POST "http://127.0.0.1:${HOST_PORT}/Startup/Complete" >/dev/null 2>&1 || true

    echo "Jellyfin startup wizard completed successfully."
fi

echo "Environment is up and ready."
