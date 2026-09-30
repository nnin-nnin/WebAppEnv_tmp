#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18871}"

echo "[Trac] Starting Trac application via Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "[Trac] Waiting for Trac to become ready at http://127.0.0.1:${HOST_PORT}/..."
MAX_ATTEMPTS=30
ATTEMPT=0
READY=0

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
  ATTEMPT=$((ATTEMPT + 1))
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
  if [ "$HTTP_CODE" -eq 200 ]; then
    echo "[Trac] Ready! http://127.0.0.1:${HOST_PORT}/ returned HTTP ${HTTP_CODE} after ${ATTEMPT} attempts."
    READY=1
    break
  fi
  sleep 2
done

if [ $READY -ne 1 ]; then
  echo "[Trac] ERROR: Application failed to become healthy within timeout."
  docker compose -f docker/compose.yaml logs
  exit 1
fi

echo "[Trac] Startup complete. Environment is ready."
