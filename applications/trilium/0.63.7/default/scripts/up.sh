#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18660}"
PASSWORD="${ADMIN_PASSWORD:-Admin123456!}"

echo "Starting Trilium 0.63.7 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Trilium HTTP service to be ready..."
READY=0
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/api/health-check" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        READY=1
        break
    fi
    sleep 2
done

if [ "$READY" -ne 1 ]; then
    echo "ERROR: Trilium service failed to respond within timeout."
    docker compose -f docker/compose.yaml logs
    exit 1
fi

echo "Checking if Trilium initial setup is required..."
SETUP_STATUS=$(curl -s "http://127.0.0.1:${HOST_PORT}/api/setup/status" || true)
if echo "$SETUP_STATUS" | grep -q '"isInitialized":false'; then
    echo "Initializing new Trilium document..."
    curl -s -X POST "http://127.0.0.1:${HOST_PORT}/api/setup/new-document" > /dev/null
    
    # Wait until DB is initialized
    for i in {1..30}; do
        STATUS=$(curl -s "http://127.0.0.1:${HOST_PORT}/api/setup/status" || true)
        if echo "$STATUS" | grep -q '"isInitialized":true'; then
            break
        fi
        sleep 1
    done

    echo "Configuring administrator password..."
    curl -s -d "password1=${PASSWORD}&password2=${PASSWORD}" "http://127.0.0.1:${HOST_PORT}/set-password" > /dev/null
fi

# Ensure web interface returns 200
for i in {1..30}; do
    CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$CODE" -eq 200 ]; then
        echo "Trilium is ready and serving HTTP 200 on port ${HOST_PORT}."
        exit 0
    fi
    sleep 1
done

echo "Trilium startup complete on port ${HOST_PORT}."
exit 0
