#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18837}"

echo "Starting Kubeapps with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Kubeapps to become ready on port ${HOST_PORT}..."
READY=false
for i in {1..30}; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/healthz" || true)
    if [ "$STATUS" -eq 200 ]; then
        READY=true
        break
    fi
    sleep 1
done

if [ "$READY" != "true" ]; then
    echo "FAILED: Kubeapps failed to start within timeout."
    exit 1
fi

echo "Environment is up and ready."
