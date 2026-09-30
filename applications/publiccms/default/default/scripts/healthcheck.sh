#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."

APP_URL="${APP_URL:-http://127.0.0.1:18860}"

echo "Checking if services are running..."
RUNNING=$(docker compose -f docker/compose.yaml ps --services --filter "status=running" | wc -l)
if [ "$RUNNING" -lt 2 ]; then
    echo "Error: Not all services are running."
    exit 1
fi

echo "Checking database health..."
DB_STATUS=$(docker inspect --format='{{json .State.Health.Status}}' $(docker compose -f docker/compose.yaml ps -q db) 2>/dev/null || echo '""')
if [ "$DB_STATUS" != '"healthy"' ]; then
    echo "Error: Database is not healthy (status: $DB_STATUS)."
    exit 1
fi

echo "Checking application HTTP endpoint ($APP_URL/admin/login)..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL/admin/login" 2>/dev/null || echo "000")
if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
    echo "Application is accessible and healthy (HTTP $HTTP_CODE)."
    exit 0
else
    echo "Error: Application is not accessible at $APP_URL/admin/login (HTTP $HTTP_CODE)"
    exit 1
fi
