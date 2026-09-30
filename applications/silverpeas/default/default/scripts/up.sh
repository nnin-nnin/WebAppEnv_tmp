#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18864}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Starting Silverpeas with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Silverpeas service to be ready at ${BASE_URL}/silverpeas/..."
MAX_ATTEMPTS=90
ATTEMPT=0

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 "${BASE_URL}/silverpeas/defaultLogin.jsp" || true)
    if [ "$STATUS" = "200" ] || [ "$STATUS" = "302" ]; then
        echo "Silverpeas is ready (HTTP ${STATUS})!"
        exit 0
    fi
    sleep 3
    ATTEMPT=$((ATTEMPT + 1))
done

echo "FAILED: Service did not become ready within timeout."
docker compose -f docker/compose.yaml ps
exit 1
