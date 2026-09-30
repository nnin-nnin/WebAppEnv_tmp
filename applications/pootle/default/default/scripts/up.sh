#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting Pootle default environment with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d

HOST_PORT="${HOST_PORT:-18858}"
URL="http://127.0.0.1:${HOST_PORT}/accounts/login/"

echo "Waiting for Pootle to become healthy at ${URL}..."
MAX_RETRIES=60
for i in $(seq 1 $MAX_RETRIES); do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL" || true)
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
        echo "Pootle service is ready (HTTP $HTTP_CODE)."
        break
    fi
    if [ "$i" -eq "$MAX_RETRIES" ]; then
        echo "Timed out waiting for Pootle service."
        docker compose -f docker/compose.yaml logs
        exit 1
    fi
    sleep 2
done

echo "Environment is up and ready."
