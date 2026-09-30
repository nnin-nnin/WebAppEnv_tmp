#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting OXID eShop (default) with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Waiting for services to become ready on port 18851..."
MAX_RETRIES=40
RETRY_COUNT=0
URL="http://127.0.0.1:18851/"

until curl -s -o /dev/null -w "%{http_code}" "$URL" | grep -q -E "^(200|302)$"; do
    RETRY_COUNT=$((RETRY_COUNT + 1))
    if [ "$RETRY_COUNT" -ge "$MAX_RETRIES" ]; then
        echo "ERROR: Service failed to respond on $URL within timeout."
        docker compose -f docker/compose.yaml logs --tail 40
        exit 1
    fi
    echo "Waiting for service... (attempt $RETRY_COUNT/$MAX_RETRIES)"
    sleep 3
done

echo "SUCCESS: OXID eShop is up and responding on $URL!"
