#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"

echo "=== [1/3] Validating Docker Compose configuration ==="
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "=== [2/3] Launching Publify services ==="
docker compose -f "${COMPOSE_FILE}" up -d

echo "=== [3/3] Waiting for Publify environment to become ready (timeout: 180s) ==="
MAX_ATTEMPTS=36
ATTEMPT=0
TARGET_PORT="${PUBLIFY_PORT:-18861}"

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
  ATTEMPT=$((ATTEMPT + 1))

  DB_HEALTH=$(docker compose -f "${COMPOSE_FILE}" ps db --format "{{.Health}}" 2>/dev/null || echo "")
  APP_STATE=$(docker compose -f "${COMPOSE_FILE}" ps application --format "{{.State}}" 2>/dev/null || echo "")

  if [ "${DB_HEALTH}" = "healthy" ] && [ "${APP_STATE}" = "running" ]; then
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${TARGET_PORT}/" || echo "000")
    if [ "${HTTP_CODE}" = "200" ] || [ "${HTTP_CODE}" = "302" ]; then
      echo "[+] Publify is UP and healthy! (HTTP ${HTTP_CODE} on port ${TARGET_PORT})"
      docker compose -f "${COMPOSE_FILE}" ps
      exit 0
    fi
  fi

  echo "[-] Attempt ${ATTEMPT}/${MAX_ATTEMPTS}: db=${DB_HEALTH}, application=${APP_STATE} - waiting 5s..."
  sleep 5
done

echo "[-] ERROR: Publify failed to become ready within 180s."
docker compose -f "${COMPOSE_FILE}" ps
docker compose -f "${COMPOSE_FILE}" logs --tail 50
exit 1
