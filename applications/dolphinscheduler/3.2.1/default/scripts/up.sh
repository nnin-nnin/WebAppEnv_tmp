#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18585}"

echo "Starting Apache DolphinScheduler 3.2.1 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for DolphinScheduler to initialize..."
for i in {1..90}; do
    if curl -s -f "http://localhost:${HOST_PORT}/dolphinscheduler/ui" >/dev/null 2>&1; then
        echo "DolphinScheduler service is ready."
        break
    fi
    sleep 2
done

echo "DolphinScheduler startup complete on port ${HOST_PORT}."
