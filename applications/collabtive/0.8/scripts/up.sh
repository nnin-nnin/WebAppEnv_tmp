#!/bin/bash
set -e

cd "$(dirname "$0")/.."

echo "Validating docker compose file..."
docker compose -f docker/compose.yaml config --quiet

echo "Pulling fixed Docker Hub images..."
docker compose -f docker/compose.yaml pull

echo "Starting services..."
docker compose -f docker/compose.yaml up -d

echo "Waiting for services to become healthy..."
TIMEOUT=180
ELAPSED=0
while [ $ELAPSED -lt $TIMEOUT ]; do
    UNHEALTHY=$(docker compose -f docker/compose.yaml ps -q | xargs docker inspect -f '{{.State.Health.Status}}' 2>/dev/null | grep -v healthy || true)
    if [ -z "$UNHEALTHY" ]; then
        echo "All services are healthy."
        exit 0
    fi
    sleep 5
    ELAPSED=$((ELAPSED + 5))
done

echo "Error: Services did not become healthy in time."
docker compose -f docker/compose.yaml ps
docker compose -f docker/compose.yaml logs
exit 1
