#!/bin/bash
export COMPOSE_PROJECT_NAME=webid-1-2-2
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$( dirname "$DIR" )"
COMPOSE_FILE="$PROJECT_DIR/docker/compose.yaml"

cd "$PROJECT_DIR"

echo "Checking Compose configuration..."
docker compose -f "$COMPOSE_FILE" config --quiet

echo "Starting services..."
docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for services to become healthy..."
TIMEOUT=180
START_TIME=$(date +%s)
while true; do
    CURRENT_TIME=$(date +%s)
    ELAPSED=$((CURRENT_TIME - START_TIME))
    
    if [ $ELAPSED -gt $TIMEOUT ]; then
        echo "Timeout waiting for services to become healthy."
        docker compose -f "$COMPOSE_FILE" ps
        docker compose -f "$COMPOSE_FILE" logs
        exit 1
    fi
    
    HEALTHY_COUNT=$(docker compose -f "$COMPOSE_FILE" ps --format json | jq -r 'select(.Health == "healthy") | .Name' | wc -l)
    TOTAL_COUNT=$(docker compose -f "$COMPOSE_FILE" config --services | wc -l)
    
    if [ "$HEALTHY_COUNT" -eq "$TOTAL_COUNT" ]; then
        echo "All services are healthy!"
        break
    fi
    
    sleep 5
done

echo "WeBid environment is up and running."
