#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_FILE="$DIR/docker/compose.yaml"
export COMPOSE_PROJECT_NAME=wordpress-7-0-3

echo "Checking Compose configuration..."
docker compose -f "$COMPOSE_FILE" config --quiet

echo "Pulling images..."
docker compose -f "$COMPOSE_FILE" pull

echo "Starting Compose environment..."
docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for services to become healthy..."
timeout=180
started=$(date +%s)
while true; do
  if docker compose -f "$COMPOSE_FILE" ps | grep -q "unhealthy"; then
    echo "One or more services are unhealthy!"
    docker compose -f "$COMPOSE_FILE" ps
    exit 1
  fi

  if docker compose -f "$COMPOSE_FILE" ps | grep -q "Up"; then
    if curl -s -f http://127.0.0.1:28080/wp-admin/install.php > /dev/null || curl -s -f http://127.0.0.1:28080/wp-login.php > /dev/null; then
        echo "WordPress application is up."
        bash "$DIR/resources/login.sh"
        break
    fi
  fi

  now=$(date +%s)
  if [ $((now - started)) -gt $timeout ]; then
    echo "Timeout waiting for services to be ready."
    docker compose -f "$COMPOSE_FILE" ps
    docker compose -f "$COMPOSE_FILE" logs --tail=50 application db
    exit 1
  fi
  
  sleep 5
done

echo "Deployment successful."
