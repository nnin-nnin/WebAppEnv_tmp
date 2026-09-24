#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "=== Starting AnchorCMS Compose Environment ==="
cd "$APP_DIR"

docker compose -f docker/compose.yaml config --quiet
docker compose -f docker/compose.yaml up -d

echo "Waiting for services to become healthy..."
MAX_RETRIES=60
RETRY_COUNT=0

while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    UNHEALTHY=$(docker compose -f docker/compose.yaml ps --format json | grep -i "starting\|unhealthy\|restarting" || true)
    RUNNING=$(docker compose -f docker/compose.yaml ps --format json | grep -i "running" || true)
    
    if [ -z "$UNHEALTHY" ] && [ -n "$RUNNING" ]; then
        echo "All services are running and healthy!"
        break
    fi
    
    RETRY_COUNT=$((RETRY_COUNT + 1))
    sleep 3
done

if [ $RETRY_COUNT -eq $MAX_RETRIES ]; then
    echo "WARNING: Services did not report healthy status within timeout."
    docker compose -f docker/compose.yaml ps
fi

echo "=== Compose Status ==="
docker compose -f docker/compose.yaml ps
