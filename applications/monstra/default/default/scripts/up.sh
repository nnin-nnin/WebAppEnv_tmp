#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18845}"
APP_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Starting Docker Compose services for Monstra CMS..."
docker compose -f "${COMPOSE_FILE}" up -d

echo "Waiting for services to become healthy and ready..."
TIMEOUT=60
ELAPSED=0
while [ $ELAPSED -lt $TIMEOUT ]; do
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/" 2>/dev/null || echo "000")
    if [ "${HTTP_STATUS}" = "200" ] || [ "${HTTP_STATUS}" = "302" ]; then
        echo "Monstra CMS is accessible at ${APP_URL}/ (HTTP ${HTTP_STATUS})"
        docker compose -f "${COMPOSE_FILE}" ps
        exit 0
    fi
    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

echo "Error: Monstra CMS did not become ready within ${TIMEOUT} seconds."
docker compose -f "${COMPOSE_FILE}" ps
docker compose -f "${COMPOSE_FILE}" logs
exit 1
