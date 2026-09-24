#!/bin/bash
set -e
cd "$(dirname "$0")/.."

echo "Configuring docker compose..."
docker compose -f docker/compose.yaml config --quiet

echo "Starting services..."
docker compose -f docker/compose.yaml up -d

echo "Waiting for services to become healthy..."
for i in {1..36}; do
    STATUS=$(docker compose -f docker/compose.yaml ps --format json | grep '"Health": "healthy"' | wc -l || true)
    # 2 services: db, application (application doesn't have a healthcheck in compose, so just wait for db)
    # wait for db to be healthy.
    DB_STATUS=$(docker inspect --format='{{json .State.Health.Status}}' $(docker compose -f docker/compose.yaml ps -q db) 2>/dev/null || echo '""')
    if [ "$DB_STATUS" = '"healthy"' ]; then
        echo "Database is healthy."
        break
    fi
    sleep 5
done

# We also wait a bit for the java app to start after DB is ready
sleep 15
echo "Application should be running now."
docker compose -f docker/compose.yaml ps
