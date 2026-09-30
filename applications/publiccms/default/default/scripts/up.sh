#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."

echo "Validating docker compose configuration..."
docker compose -f docker/compose.yaml config --quiet

echo "Starting services..."
docker compose -f docker/compose.yaml up -d

echo "Waiting for database to become healthy..."
for i in {1..36}; do
    DB_STATUS=$(docker inspect --format='{{json .State.Health.Status}}' $(docker compose -f docker/compose.yaml ps -q db) 2>/dev/null || echo '""')
    if [ "$DB_STATUS" = '"healthy"' ]; then
        echo "Database is healthy."
        break
    fi
    sleep 3
done

echo "Waiting for PublicCMS application to be ready..."
APP_URL="${APP_URL:-http://127.0.0.1:18860}"
for i in {1..90}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL/admin/login" 2>/dev/null || echo "000")
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
        echo "Application is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 2
done

docker compose -f docker/compose.yaml ps
