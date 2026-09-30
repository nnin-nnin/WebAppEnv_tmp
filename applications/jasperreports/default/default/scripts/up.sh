#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18832}"

echo "Starting JasperReports environment with Docker Compose..."
cd "$APP_DIR"

echo "Validating docker compose file..."
docker compose -f docker/compose.yaml config --quiet

echo "Starting services..."
docker compose -f docker/compose.yaml up -d

echo "Waiting for JasperReports services to become healthy..."
MAX_ATTEMPTS=120
ATTEMPT=0
while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
  if curl -s -f "http://127.0.0.1:${HOST_PORT}/jasperserver/login.html" > /dev/null 2>&1 || \
     curl -s -f "http://127.0.0.1:${HOST_PORT}/jasperserver/rest_v2/serverInfo" > /dev/null 2>&1; then
    echo "JasperReports is ready!"
    exit 0
  fi
  echo "Waiting for JasperReports to start... ($ATTEMPT/$MAX_ATTEMPTS)"
  sleep 3
  ATTEMPT=$((ATTEMPT+1))
done

echo "Error: Service did not respond within timeout."
docker compose -f docker/compose.yaml ps
docker compose -f docker/compose.yaml logs --tail=50
exit 1
