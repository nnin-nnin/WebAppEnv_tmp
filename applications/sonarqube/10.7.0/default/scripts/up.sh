#!/usr/bin/env bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"

echo "[*] Validating Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "[*] Starting SonarQube container..."
docker compose -f "${COMPOSE_FILE}" up -d

echo "[*] Waiting for SonarQube service readiness..."
MAX_ATTEMPTS=50
ATTEMPT=0
HOST_PORT="${HOST_PORT:-18607}"
BASE_URL="${APP_URL:-http://localhost:${HOST_PORT}}"

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
  ATTEMPT=$((ATTEMPT + 1))
  sleep 2

  STATUS=$(curl -s "${BASE_URL}/api/system/status" 2>/dev/null | grep -o '"status":"[^"]*"' | cut -d'"' -f4 || true)
  if [ "$STATUS" = "UP" ]; then
    echo "[+] SonarQube is UP and healthy! (took ~$((ATTEMPT * 2))s)"
    exit 0
  elif [ "$STATUS" = "STARTING" ]; then
    echo "[*] SonarQube is starting up... (${ATTEMPT}/${MAX_ATTEMPTS})"
  else
    echo "[*] Waiting for SonarQube service to respond... (${ATTEMPT}/${MAX_ATTEMPTS})"
  fi
done

echo "[*] SonarQube container is running; deferring to healthcheck.sh..."
exit 0
