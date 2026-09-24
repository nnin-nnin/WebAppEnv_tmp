#!/bin/bash
set -e
cd "$(dirname "$0")/.."

echo "Checking docker compose configuration..."
docker compose -f docker/compose.yaml config --quiet

echo "Checking if services are running..."
RUNNING=$(docker compose -f docker/compose.yaml ps --services --filter "status=running" | wc -l)
if [ "$RUNNING" -lt 2 ]; then
    echo "Error: Not all services are running."
    exit 1
fi

echo "Checking database health..."
DB_STATUS=$(docker inspect --format='{{json .State.Health.Status}}' $(docker compose -f docker/compose.yaml ps -q db) 2>/dev/null || echo '""')
if [ "$DB_STATUS" != '"healthy"' ]; then
    echo "Error: Database is not healthy."
    exit 1
fi

echo "Checking application HTTP endpoint..."
echo "Checking application HTTP endpoint..."
APP_URL="http://127.0.0.1:18080"
max_attempts=30
attempt=1
while [ $attempt -le $max_attempts ]; do
    if curl -s -f "$APP_URL/login" > /dev/null; then
        echo "Application is accessible!"
        exit 0
    fi
    echo "Waiting for application to start... (Attempt $attempt/$max_attempts)"
    sleep 2
    attempt=$((attempt + 1))
done

echo "Error: Application is not accessible at $APP_URL/login after 60 seconds."
exit 1

echo "Healthcheck passed."
