#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18867}"

echo "[Strapi] Starting Strapi application via Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "[Strapi] Waiting for Strapi to become ready at http://127.0.0.1:${HOST_PORT}/admin..."
MAX_ATTEMPTS=45
ATTEMPT=0
READY=0

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
  ATTEMPT=$((ATTEMPT + 1))
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/admin" || true)
  if [ "$HTTP_CODE" -eq 200 ]; then
    echo "[Strapi] Ready! http://127.0.0.1:${HOST_PORT}/admin returned HTTP ${HTTP_CODE} after ${ATTEMPT} attempts."
    READY=1
    break
  fi
  sleep 2
done

if [ $READY -ne 1 ]; then
  echo "[Strapi] ERROR: Application failed to become healthy within timeout."
  docker compose -f docker/compose.yaml logs
  exit 1
fi

echo "[Strapi] Startup complete. Environment is ready."
