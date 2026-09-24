#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18580}"

echo "Starting Cockpit 0.11.1 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Cockpit service to be responsive..."
MAX_RETRIES=30
RETRY_COUNT=0

while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    if curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/" | grep -E "^(200|301|302)$" > /dev/null; then
        echo "Cockpit web service is responding."
        break
    fi
    RETRY_COUNT=$((RETRY_COUNT + 1))
    sleep 2
done

# Initialize Cockpit installation if needed (creates default admin:admin account)
echo "Ensuring Cockpit is initialized..."
curl -s -L "http://localhost:${HOST_PORT}/install/" > /dev/null || true

echo "Cockpit startup completed."
