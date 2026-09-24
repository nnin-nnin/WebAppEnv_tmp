#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

echo "Checking Compose configuration..."
docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml config --quiet

echo "Pulling images..."
docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml pull

echo "Starting services..."
docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml up -d

echo "Waiting for database to be healthy..."
for i in {1..36}; do
    if [ "$(docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml ps -q db)" ]; then
        STATUS=$(docker inspect --format='{{.State.Health.Status}}' $(docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml ps -q db))
        if [ "$STATUS" = "healthy" ]; then
            echo "Database is healthy."
            break
        fi
    fi

    echo "Waiting... ($i/36)"
    sleep 5
done

if [ "$STATUS" != "healthy" ]; then
    echo "Database failed to become healthy."
    docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml ps
    docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml logs db
    exit 1
fi

echo "Waiting for app to start and initialize..."
for i in {1..36}; do
    SERVER_ID=$(docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml ps -q server)
    if [ -n "$SERVER_ID" ] && [ "$(docker inspect --format='{{.State.Health.Status}}' "$SERVER_ID")" = "healthy" ]; then
        break
    fi
    sleep 5
done
if [ -z "$SERVER_ID" ] || [ "$(docker inspect --format='{{.State.Health.Status}}' "$SERVER_ID")" != "healthy" ]; then
    echo "InvoiceNinja server failed to become healthy."
    docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml ps
    docker compose -p invoiceninja-5-13-30 -f docker/compose.yaml logs --tail=80 server app
    exit 1
fi

echo "All services started successfully."
