#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
TARGET_PORT="${DIASPORA_PORT:-18815}"

echo "=== [Healthcheck 1/4] Verifying Compose Configuration ==="
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "=== [Healthcheck 2/4] Verifying Service Health ==="
MAX_WAIT=30
WAIT=0
DB_STATUS=""
REDIS_STATUS=""
APP_STATUS=""

while [ $WAIT -lt $MAX_WAIT ]; do
  DB_STATUS=$(docker compose -f "${COMPOSE_FILE}" ps db --format "{{.Health}}" 2>/dev/null || echo "")
  REDIS_STATUS=$(docker compose -f "${COMPOSE_FILE}" ps redis --format "{{.Health}}" 2>/dev/null || echo "")
  APP_STATUS=$(docker compose -f "${COMPOSE_FILE}" ps app --format "{{.State}}" 2>/dev/null || echo "")

  if [ "${DB_STATUS}" = "healthy" ] && [ "${REDIS_STATUS}" = "healthy" ] && [ "${APP_STATUS}" = "running" ]; then
    break
  fi
  sleep 2
  WAIT=$((WAIT + 2))
done

if [ "${DB_STATUS}" != "healthy" ]; then
  echo "[-] ERROR: PostgreSQL service is not healthy (Status: ${DB_STATUS})"
  exit 1
fi

if [ "${REDIS_STATUS}" != "healthy" ]; then
  echo "[-] ERROR: Redis service is not healthy (Status: ${REDIS_STATUS})"
  exit 1
fi

if [ "${APP_STATUS}" != "running" ]; then
  echo "[-] ERROR: Application service is not running (Status: ${APP_STATUS})"
  exit 1
fi

echo "[+] Database and Redis are healthy, Application is running."

echo "=== [Healthcheck 3/4] Verifying Web Entrypoint ==="
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${TARGET_PORT}/" || echo "000")
if [ "${HTTP_CODE}" != "200" ] && [ "${HTTP_CODE}" != "302" ]; then
  echo "[-] ERROR: Web entrypoint returned unexpected HTTP code: ${HTTP_CODE} (Expected 200 or 302)"
  exit 1
fi
echo "[+] Web entrypoint returned HTTP ${HTTP_CODE} on port ${TARGET_PORT}"

echo "=== [Healthcheck 4/4] Verifying Admin Authentication via login.sh ==="
bash "${APP_DIR}/resources/login.sh"

echo "=== ALL HEALTHCHECKS PASSED ==="
exit 0
