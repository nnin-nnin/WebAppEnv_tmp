#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18824}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

echo "Checking Docker Compose configuration..."
docker compose -f "$COMPOSE_FILE" config --quiet

echo "Checking running services..."
if ! docker compose -f "$COMPOSE_FILE" ps --status running --services | grep -q .; then
    echo "ERROR: No services are running."
    exit 1
fi

echo "Checking eXo Platform HTTP service at ${APP_URL}/portal/login..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -A "$UA" --connect-timeout 5 --max-time 15 "${APP_URL}/portal/login" 2>/dev/null || echo "000")

if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
    echo "Healthcheck passed: ${APP_URL}/portal/login returned HTTP ${HTTP_CODE}."
    exit 0
fi

# Fallback check portal root
ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" -A "$UA" --connect-timeout 5 --max-time 15 "${APP_URL}/portal/" 2>/dev/null || echo "000")
if [ "$ROOT_CODE" = "200" ] || [ "$ROOT_CODE" = "302" ]; then
    echo "Healthcheck passed: ${APP_URL}/portal/ returned HTTP ${ROOT_CODE}."
    exit 0
fi

echo "Healthcheck failed: ${APP_URL} returned HTTP ${HTTP_CODE} / ${ROOT_CODE}."
exit 1
