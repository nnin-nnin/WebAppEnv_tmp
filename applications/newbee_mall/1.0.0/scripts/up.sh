#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "Validating docker compose file..."
docker compose -f docker/compose.yaml config --quiet

echo "Starting services..."
docker compose -f docker/compose.yaml up -d

echo "Waiting for services to become healthy..."
MAX_ATTEMPTS=36
ATTEMPT=0
while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
  HEALTH_STATUS=$(docker compose -f docker/compose.yaml ps --format json | jq -r '.[].Health' | grep -v 'healthy' || true)
  if [ -z "$HEALTH_STATUS" ]; then
    echo "All services are healthy!"
    exit 0
  fi
  echo "Waiting for health checks... ($ATTEMPT/$MAX_ATTEMPTS)"
  sleep 5
  ATTEMPT=$((ATTEMPT+1))
done

echo "Error: Services did not become healthy in time."
docker compose -f docker/compose.yaml ps
docker compose -f docker/compose.yaml logs
exit 1
