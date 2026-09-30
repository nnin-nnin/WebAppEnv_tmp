#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18834}"

echo "Starting JeeSite environment with Docker Compose..."
cd "$APP_DIR"

echo "Validating docker compose file..."
docker compose -f docker/compose.yaml config --quiet

echo "Starting services..."
docker compose -f docker/compose.yaml up -d

echo "Waiting for JeeSite service to become healthy..."
MAX_ATTEMPTS=60
ATTEMPT=0
while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/a/login" || true)
  if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
    echo "JeeSite is ready (HTTP $HTTP_CODE on /a/login)!"
    exit 0
  fi
  echo "Waiting for JeeSite to start... ($ATTEMPT/$MAX_ATTEMPTS, current status: ${HTTP_CODE:-none})"
  sleep 2
  ATTEMPT=$((ATTEMPT+1))
done

echo "Error: Service did not respond within timeout."
docker compose -f docker/compose.yaml ps
docker compose -f docker/compose.yaml logs --tail=50
exit 1
