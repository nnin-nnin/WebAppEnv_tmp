#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18652}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Starting Docker Compose services for Metabase..."
if ! docker compose -f "${COMPOSE_FILE}" up -d 2>/dev/null; then
    echo "Falling back to native host platform..."
    OVERRIDE_FILE="/tmp/compose-arm64-$$.yaml"
    echo -e "services:\n  app:\n    platform: linux/arm64" > "${OVERRIDE_FILE}"
    docker compose -f "${COMPOSE_FILE}" -f "${OVERRIDE_FILE}" up -d
    rm -f "${OVERRIDE_FILE}"
fi

echo "Waiting for services to become healthy..."
TIMEOUT=180
ELAPSED=0
while [ $ELAPSED -lt $TIMEOUT ]; do
    UNHEALTHY=$(docker compose -f "${COMPOSE_FILE}" ps --format json 2>/dev/null | grep -i '"Health":"unhealthy"' || true)
    STARTING=$(docker compose -f "${COMPOSE_FILE}" ps --format json 2>/dev/null | grep -i '"Health":"starting"' || true)

    if [ -z "${STARTING}" ] && [ -z "${UNHEALTHY}" ]; then
        if curl -s -f "${APP_URL}/api/health" >/dev/null 2>&1; then
            echo "All services are running and healthy!"
            docker compose -f "${COMPOSE_FILE}" ps
            exit 0
        fi
    fi

    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

echo "Error: Services did not become healthy within ${TIMEOUT} seconds."
docker compose -f "${COMPOSE_FILE}" ps
docker compose -f "${COMPOSE_FILE}" logs
exit 1
