#!/usr/bin/env bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"
COMPOSE_FILE="${BASE_DIR}/docker/compose.yaml"
APP_URL="${APP_URL:-http://localhost:18006}"

echo "[*] Verifying Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "[*] Verifying container states..."
RUNNING=$(docker compose -f "${COMPOSE_FILE}" ps --services --filter "status=running")
if [ -z "$RUNNING" ]; then
  echo "[-] No services are currently running."
  exit 1
fi

echo "[*] Testing HTTP endpoints..."
ALF_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/alfresco/api/-default-/public/alfresco/versions/1/probes/-ready-" || echo "000")
SHARE_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/share" || echo "000")

echo "[*] Alfresco probe endpoint HTTP status: ${ALF_STATUS}"
echo "[*] Alfresco Share endpoint HTTP status: ${SHARE_STATUS}"

if [ "$ALF_STATUS" -eq 200 ] && ([ "$SHARE_STATUS" -eq 200 ] || [ "$SHARE_STATUS" -eq 301 ] || [ "$SHARE_STATUS" -eq 302 ]); then
  echo "[+] Healthcheck PASSED!"
  exit 0
else
  echo "[-] Healthcheck FAILED! HTTP response unacceptable."
  exit 1
fi
