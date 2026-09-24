#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_FILE="$DIR/docker/compose.yaml"
export COMPOSE_PROJECT_NAME=wordpress-7-0-3

echo "Running healthcheck..."
docker compose -f "$COMPOSE_FILE" config --quiet

if ! docker compose -f "$COMPOSE_FILE" ps | grep -q "Up"; then
  echo "Containers are not running."
  exit 1
fi

if docker compose -f "$COMPOSE_FILE" ps | grep -q "unhealthy"; then
  echo "Some containers are unhealthy."
  exit 1
fi

if ! curl -s http://127.0.0.1:28080 | grep -i "wordpress" > /dev/null; then
  if ! curl -s http://127.0.0.1:28080/wp-admin/install.php > /dev/null; then
    echo "WordPress application HTTP endpoint check failed."
    exit 1
  fi
fi

echo "Healthcheck passed."
