#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_DIR="$(dirname "$DIR")"
COMPOSE_FILE="$APP_DIR/docker/compose.yaml"

export COMPOSE_PROJECT_NAME=snipeit-8-7-0

echo "Checking Compose configuration..."
docker compose -f "$COMPOSE_FILE" config --quiet

export COMPOSE_PROJECT_NAME=snipeit-8-7-0

echo "Checking if containers are running..."
if ! docker compose -f "$COMPOSE_FILE" ps | grep "app" | grep -iE "(Up|running)" >/dev/null; then
  echo "Error: app container is not running."
  exit 1
fi

export COMPOSE_PROJECT_NAME=snipeit-8-7-0

echo "Checking if services are healthy..."
if docker compose -f "$COMPOSE_FILE" ps | grep -q "unhealthy"; then
  echo "Error: One or more services are unhealthy."
  exit 1
fi
if ! docker compose -f "$COMPOSE_FILE" ps | grep -i "healthy" >/dev/null; then
  echo "Error: No healthy services found."
  exit 1
fi

export COMPOSE_PROJECT_NAME=snipeit-8-7-0

echo "Checking HTTP endpoint..."
APP_URL="http://127.0.0.1:8000"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL/login")

if [ "$HTTP_STATUS" -ne 200 ] && [ "$HTTP_STATUS" -ne 302 ]; then
  echo "Error: HTTP endpoint returned status $HTTP_STATUS"
  exit 1
fi

echo "Healthcheck passed."
exit 0
