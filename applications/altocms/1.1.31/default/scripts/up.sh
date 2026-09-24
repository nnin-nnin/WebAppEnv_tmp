#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"

echo "Validating Docker Compose configuration..."
docker compose -f "$COMPOSE_FILE" config --quiet

echo "Starting AltoCMS services..."
docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for services to become healthy (timeout: 180s)..."
MAX_ATTEMPTS=36
ATTEMPT=0

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
    ATTEMPT=$((ATTEMPT + 1))
    
    DB_STATUS=$(docker compose -f "$COMPOSE_FILE" ps db --format "{{.Health}}" 2>/dev/null || echo "")
    APP_STATUS=$(docker compose -f "$COMPOSE_FILE" ps app --format "{{.State}}" 2>/dev/null || echo "")
    
    if [ "$DB_STATUS" = "healthy" ] && [ "$APP_STATUS" = "running" ]; then
        if curl -s -f -o /dev/null http://localhost:18007/ ; then
            echo "AltoCMS environment is UP and healthy!"
            docker compose -f "$COMPOSE_FILE" ps
            exit 0
        fi
    fi
    
    sleep 5
done

echo "ERROR: AltoCMS environment failed to start properly within 180 seconds."
docker compose -f "$COMPOSE_FILE" ps
docker compose -f "$COMPOSE_FILE" logs --tail 50
exit 1
