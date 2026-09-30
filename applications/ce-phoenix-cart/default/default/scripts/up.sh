#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18806}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Starting CE Phoenix Cart stack with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for CE Phoenix Cart service to be ready at ${BASE_URL}..."
MAX_RETRIES=40
RETRY_INTERVAL=2
COUNT=0

while [ $COUNT -lt $MAX_RETRIES ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/index.php" || true)
    if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
        echo "CE Phoenix Cart is ready! (HTTP $HTTP_CODE)"
        exit 0
    fi
    echo "Service not ready yet (HTTP ${HTTP_CODE:-none}), waiting ${RETRY_INTERVAL}s... ($((COUNT+1))/$MAX_RETRIES)"
    sleep $RETRY_INTERVAL
    COUNT=$((COUNT + 1))
done

echo "ERROR: CE Phoenix Cart failed to become ready within timeout."
docker compose -f docker/compose.yaml logs
exit 1
