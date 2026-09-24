#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"

echo "Checking Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Starting Docker Compose services..."
docker compose -f "${COMPOSE_FILE}" up -d

echo "Waiting for services to become healthy..."
TIMEOUT=180
ELAPSED=0
while [ $ELAPSED -lt $TIMEOUT ]; do
    UNHEALTHY=$(docker compose -f "${COMPOSE_FILE}" ps --format json 2>/dev/null | grep -i '"Health":"unhealthy"' || true)
    STARTING=$(docker compose -f "${COMPOSE_FILE}" ps --format json 2>/dev/null | grep -i '"Health":"starting"' || true)
    
    if [ -z "${STARTING}" ] && [ -z "${UNHEALTHY}" ]; then
        if curl -s -f -o /dev/null "http://localhost:18599/civicrm/login" 2>/dev/null; then
            echo "All services are running and healthy!"
            docker compose -f "${COMPOSE_FILE}" ps
            exit 0
        fi
    fi
    
    sleep 3
    ELAPSED=$((ELAPSED + 3))
done

echo "Error: Services did not become healthy within ${TIMEOUT} seconds."
docker compose -f "${COMPOSE_FILE}" ps
docker compose -f "${COMPOSE_FILE}" logs
exit 1
