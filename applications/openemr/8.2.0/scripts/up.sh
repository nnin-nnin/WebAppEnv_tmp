#!/bin/bash
set -e
cd "$(dirname "$0")/.."

export COMPOSE_PROJECT_NAME=openemr-8-2-0

docker compose -f docker/compose.yaml config --quiet
docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d

echo "Waiting for services to become healthy..."
TIMEOUT=240
while [ $TIMEOUT -gt 0 ]; do
    if docker compose -f docker/compose.yaml ps | grep -q "(unhealthy)"; then
        echo "Some services are unhealthy!"
        docker compose -f docker/compose.yaml ps
        exit 1
    fi
    if docker compose -f docker/compose.yaml ps | grep -q "openemr.*healthy"; then
        echo "Services are up and healthy!"
        exit 0
    fi
    sleep 5
    TIMEOUT=$((TIMEOUT-5))
done

echo "Timeout waiting for services to become healthy."
docker compose -f docker/compose.yaml ps
docker compose -f docker/compose.yaml logs
exit 1
