#!/bin/bash
export COMPOSE_PROJECT_NAME=webid-1-2-2
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$( dirname "$DIR" )"
COMPOSE_FILE="$PROJECT_DIR/docker/compose.yaml"

cd "$PROJECT_DIR"

echo "Stopping and removing WeBid environment..."
docker compose -f "$COMPOSE_FILE" down -v

echo "Environment reset complete."
