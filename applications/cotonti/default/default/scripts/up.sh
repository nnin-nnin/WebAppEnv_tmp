#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18809}"

echo "Starting Cotonti with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Waiting for Cotonti service to be ready on port ${HOST_PORT}..."
ready=0
for i in {1..60}; do
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
  if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
    ready=1
    break
  fi
  sleep 1
done

if [ "$ready" -ne 1 ]; then
  echo "Cotonti service failed to respond with HTTP 200/302 within 60s"
  exit 1
fi

echo "Cotonti is ready at http://127.0.0.1:${HOST_PORT}/"
