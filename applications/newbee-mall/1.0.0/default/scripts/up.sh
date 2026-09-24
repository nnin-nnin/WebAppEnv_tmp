#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18586}"

echo "Starting NewBee Mall 1.0.0 with Docker Compose..."
cd "$APP_DIR"

echo "Validating docker compose file..."
docker compose -f docker/compose.yaml config --quiet

echo "Starting services..."
docker compose -f docker/compose.yaml up -d

echo "Waiting for services to become healthy..."
MAX_ATTEMPTS=40
ATTEMPT=0
while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
  if curl -s -f "http://localhost:${HOST_PORT}/" > /dev/null 2>&1; then
    echo "NewBee Mall is ready!"
    exit 0
  fi
  echo "Waiting for NewBee Mall to start... ($ATTEMPT/$MAX_ATTEMPTS)"
  sleep 3
  ATTEMPT=$((ATTEMPT+1))
done

echo "Error: Service did not respond within timeout."
docker compose -f docker/compose.yaml ps
docker compose -f docker/compose.yaml logs --tail=50
exit 1
