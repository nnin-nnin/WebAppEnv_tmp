#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18612}"

echo "Starting Odoo 16.0 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Odoo service to be ready..."
for i in {1..60}; do
    HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "Odoo is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 2
done

echo "Odoo startup complete on port ${HOST_PORT}."
