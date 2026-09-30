#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18842}"

echo "Starting MeterSphere environment with Docker Compose..."
cd "$APP_DIR"

echo "Validating docker compose file..."
docker compose -f docker/compose.yaml config --quiet

echo "Starting services..."
docker compose -f docker/compose.yaml up -d

echo "Waiting for MeterSphere service to become ready on http://127.0.0.1:${HOST_PORT}..."
MAX_ATTEMPTS=90
ATTEMPT=0
while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
  if curl -s -f "http://127.0.0.1:${HOST_PORT}" > /dev/null 2>&1; then
    echo "MeterSphere is ready!"
    exit 0
  fi
  echo "Waiting for MeterSphere to start... ($ATTEMPT/$MAX_ATTEMPTS)"
  sleep 3
  ATTEMPT=$((ATTEMPT+1))
done

echo "Error: Service did not respond within timeout."
docker compose -f docker/compose.yaml ps
docker compose -f docker/compose.yaml logs --tail=50
exit 1
