#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18662}"

echo "Starting nginx-proxy-manager 2.11.3 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for nginx-proxy-manager web interface to become ready on port ${HOST_PORT}..."
READY=false
for i in {1..30}; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$STATUS" -eq 200 ]; then
        READY=true
        break
    fi
    sleep 2
done

if [ "$READY" != "true" ]; then
    echo "FAILED: nginx-proxy-manager failed to start within timeout."
    exit 1
fi

echo "Waiting for backend API initialization..."
API_READY=false
for i in {1..30}; do
    TOKEN_CODE=$(curl -s -o /dev/null -w "%{http_code}" -X POST "http://127.0.0.1:${HOST_PORT}/api/tokens" \
        -H "Content-Type: application/json" \
        -d '{"identity":"admin@example.com","secret":"changeme"}' || true)
    if [ "$TOKEN_CODE" -eq 200 ]; then
        API_READY=true
        break
    fi
    sleep 2
done

if [ "$API_READY" != "true" ]; then
    echo "WARNING: Backend API token endpoint returned HTTP ${TOKEN_CODE}, continuing..."
fi

echo "nginx-proxy-manager is up and ready."
