#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"

echo "Stopping and removing containers, networks, and volumes for Concrete5..."
docker compose -f "${COMPOSE_FILE}" down -v --remove-orphans

echo "Reset completed successfully."
