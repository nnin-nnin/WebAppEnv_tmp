#!/bin/bash
set -e

cd "$(dirname "$0")/.."

echo "Checking Compose configuration..."
docker compose -f docker/compose.yaml config --quiet

echo "Checking if services are running..."
RUNNING=$(docker compose -f docker/compose.yaml ps --services --filter "status=running")
if [ -z "$RUNNING" ]; then
    echo "No services are running."
    exit 1
fi

echo "Checking HTTP endpoint..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" ${APP_URL:-http://localhost:18088}/index.php)
if [ "$HTTP_CODE" -ne 200 ] && [ "$HTTP_CODE" -ne 302 ]; then
    echo "Application HTTP endpoint returned $HTTP_CODE"
    exit 1
fi

echo "Healthcheck passed."
exit 0
