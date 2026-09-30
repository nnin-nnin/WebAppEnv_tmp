#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18848}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Starting Open edX LMS with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Open edX LMS service to be ready at ${BASE_URL}..."
MAX_ATTEMPTS=60
ATTEMPT=0

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 3 "${BASE_URL}/" || true)
    if [ "$STATUS" = "200" ] || [ "$STATUS" = "302" ]; then
        echo "Open edX LMS is ready (HTTP ${STATUS})!"
        exit 0
    fi
    sleep 2
    ATTEMPT=$((ATTEMPT + 1))
done

echo "FAILED: Open edX service did not become ready within timeout."
docker compose -f docker/compose.yaml ps
exit 1
