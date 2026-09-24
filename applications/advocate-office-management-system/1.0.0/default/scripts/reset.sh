#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "Resetting Advocate Office Management System Compose project..."
docker compose -f "${APP_DIR}/docker/compose.yaml" down -v --remove-orphans

echo "Reset completed successfully."
