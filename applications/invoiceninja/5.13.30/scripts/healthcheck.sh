#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

echo "Checking Compose configuration..."
docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml config --quiet

echo "Checking if services are running..."
if ! docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml ps | grep -q "Up"; then
    echo "No services are running."
    exit 1
fi

echo "Checking db health..."
DB_STATUS=$(docker inspect --format='{{.State.Health.Status}}' $(docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml ps -q db))
if [ "$DB_STATUS" != "healthy" ]; then
    echo "DB is not healthy: $DB_STATUS"
    exit 1
fi

SERVER_STATUS=$(docker inspect --format='{{.State.Health.Status}}' $(docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml ps -q server))
if [ "$SERVER_STATUS" != "healthy" ]; then
    echo "Nginx server is not healthy: $SERVER_STATUS"
    exit 1
fi

echo "Checking HTTP endpoint..."
if ! curl -sS --fail http://127.0.0.1:18085/ > /dev/null; then
    echo "Failed to reach application."
    exit 1
fi

echo "Healthcheck passed."
