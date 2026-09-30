#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18741}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
ADMIN_USERNAME="${ADMIN_USERNAME:-${APP_USER:-root}}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-benchmark-only}}"

echo "Checking Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Starting Docker Compose services for audiobookshelf..."
docker compose -f "${COMPOSE_FILE}" up -d

echo "Waiting for services to become healthy and reachable..."
TIMEOUT=180
ELAPSED=0
while [ $ELAPSED -lt $TIMEOUT ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/ping" 2>/dev/null || true)
    if [ "${HTTP_CODE}" = "200" ]; then
        echo "Service responded to /ping with HTTP 200."
        break
    fi
    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

if [ $ELAPSED -ge $TIMEOUT ]; then
    echo "Error: Service did not respond within ${TIMEOUT} seconds."
    docker compose -f "${COMPOSE_FILE}" ps
    docker compose -f "${COMPOSE_FILE}" logs
    exit 1
fi

# Ensure root user is initialized
STATUS_JSON=$(curl -s "${APP_URL}/status" 2>/dev/null || true)
if echo "${STATUS_JSON}" | grep -q '"isInit":false'; then
    echo "Initializing root user for audiobookshelf..."
    INIT_RESP=$(curl -s -w "\n%{http_code}" -X POST "${APP_URL}/init" \
        -H "Content-Type: application/json" \
        -d "{\"newRoot\":{\"username\":\"${ADMIN_USERNAME}\",\"password\":\"${ADMIN_PASSWORD}\"}}" 2>/dev/null || true)
    INIT_CODE=$(echo "${INIT_RESP}" | tail -n 1)
    if [ "${INIT_CODE}" = "200" ]; then
        echo "Root user successfully initialized."
    else
        echo "Warning: Init returned HTTP ${INIT_CODE}: ${INIT_RESP}"
    fi
fi

echo "Audiobookshelf is up and initialized!"
exit 0
