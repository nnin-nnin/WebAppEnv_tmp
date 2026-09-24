#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

PROJECT_NAME="joomla-6-1-2"
COMPOSE=(docker compose -p "$PROJECT_NAME" -f docker/compose.yaml)

echo "Checking compose file..."
"${COMPOSE[@]}" config --quiet

echo "Pulling images..."
"${COMPOSE[@]}" pull

echo "Starting services..."
"${COMPOSE[@]}" up -d

echo "Waiting for services to become healthy..."
MAX_RETRIES=30
for ((i=1; i<=MAX_RETRIES; i++)); do
    # Check if all services are healthy or running
    # depends_on service_healthy already ensures dependency order
    if "${COMPOSE[@]}" ps --status running | grep joomla >/dev/null; then
        echo "Services started successfully."
        exit 0
    fi
    sleep 5
    echo "Waiting... ($i/$MAX_RETRIES)"
done

echo "Timeout waiting for services. Printing logs..."
"${COMPOSE[@]}" ps
"${COMPOSE[@]}" logs
exit 1
