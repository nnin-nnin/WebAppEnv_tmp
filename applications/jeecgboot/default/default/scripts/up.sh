#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18833}"

echo "Starting JeecgBoot environment with Docker Compose..."
cd "$APP_DIR"

echo "Validating docker compose file..."
docker compose -f docker/compose.yaml config --quiet

echo "Starting services..."
docker compose -f docker/compose.yaml up -d

echo "Waiting for JeecgBoot services to become healthy..."
MAX_ATTEMPTS=90
ATTEMPT=0
while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
  if curl -s -f "http://127.0.0.1:${HOST_PORT}/jeecg-boot/doc.html" > /dev/null 2>&1 || \
     curl -s -f "http://127.0.0.1:${HOST_PORT}/jeecg-boot/druid/login.html" > /dev/null 2>&1; then
    echo "JeecgBoot is ready!"
    exit 0
  fi
  echo "Waiting for JeecgBoot to start... ($ATTEMPT/$MAX_ATTEMPTS)"
  sleep 3
  ATTEMPT=$((ATTEMPT+1))
done

echo "Error: Service did not respond within timeout."
docker compose -f docker/compose.yaml ps
docker compose -f docker/compose.yaml logs --tail=50
exit 1
