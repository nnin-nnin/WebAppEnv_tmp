#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_DIR="$(dirname "$DIR")"
COMPOSE_FILE="$APP_DIR/docker/compose.yaml"

export COMPOSE_PROJECT_NAME=snipeit-8-7-0

cd "$APP_DIR"

echo "Stopping and removing containers and networks..."
docker compose -f "$COMPOSE_FILE" down -v

echo "Reset completed. Named volumes have been deleted."
