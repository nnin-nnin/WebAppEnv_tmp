#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"

echo "Checking Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Starting Docker Compose services for Gila CMS..."
docker compose -f "${COMPOSE_FILE}" up -d

echo "Waiting for services to become healthy and ready..."
TIMEOUT=180
ELAPSED=0
while [ $ELAPSED -lt $TIMEOUT ]; do
    UNHEALTHY=$(docker compose -f "${COMPOSE_FILE}" ps --format json 2>/dev/null | grep -i '"Health":"unhealthy"' || true)
    STARTING=$(docker compose -f "${COMPOSE_FILE}" ps --format json 2>/dev/null | grep -i '"Health":"starting"' || true)
    
    if [ -z "${STARTING}" ] && [ -z "${UNHEALTHY}" ]; then
        HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:18828/" 2>/dev/null || echo "000")
        if [ "${HTTP_STATUS}" = "200" ] || [ "${HTTP_STATUS}" = "302" ]; then
            echo "All services are running and healthy! Gila CMS is accessible at http://localhost:18828/ (HTTP ${HTTP_STATUS})"
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
