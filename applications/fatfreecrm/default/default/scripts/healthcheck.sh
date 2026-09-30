#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
TARGET_PORT="${FFCRM_PORT:-18825}"

echo "=== [Healthcheck 1/4] Verifying Compose Configuration ==="
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "=== [Healthcheck 2/4] Verifying Service Health ==="
DB_STATUS=$(docker compose -f "${COMPOSE_FILE}" ps db --format "{{.Health}}" 2>/dev/null || echo "")
APP_STATUS=$(docker compose -f "${COMPOSE_FILE}" ps application --format "{{.State}}" 2>/dev/null || echo "")

if [ "${DB_STATUS}" != "healthy" ]; then
  echo "[-] ERROR: PostgreSQL service is not healthy (Status: ${DB_STATUS})"
  exit 1
fi

if [ "${APP_STATUS}" != "running" ]; then
  echo "[-] ERROR: Application service is not running (Status: ${APP_STATUS})"
  exit 1
fi

echo "[+] Database is healthy, Application is running."

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
