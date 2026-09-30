#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18644}"

echo "=== Starting XpressEngine Environment ==="
cd "${APP_DIR}"

docker compose -f "${COMPOSE_FILE}" config --quiet
docker compose -f "${COMPOSE_FILE}" up -d

echo "Waiting for services to become healthy..."
TIMEOUT=180
ELAPSED=0

while [ $ELAPSED -lt $TIMEOUT ]; do
    UNHEALTHY=$(docker compose -f "${COMPOSE_FILE}" ps --format json 2>/dev/null | grep -i '"Health":"unhealthy"' || true)
    STARTING=$(docker compose -f "${COMPOSE_FILE}" ps --format json 2>/dev/null | grep -i '"Health":"starting"' || true)

    if [ -z "${STARTING}" ] && [ -z "${UNHEALTHY}" ]; then
        HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
        if [ "${HTTP_CODE}" -eq 200 ]; then
            echo "All services are healthy and http://127.0.0.1:${HOST_PORT}/ returned HTTP 200!"
            docker compose -f "${COMPOSE_FILE}" ps
            exit 0
        fi
    fi

    sleep 3
    ELAPSED=$((ELAPSED + 3))
done

echo "ERROR: Services did not report healthy status within ${TIMEOUT}s timeout."
docker compose -f "${COMPOSE_FILE}" ps
docker compose -f "${COMPOSE_FILE}" logs --tail=50
exit 1
