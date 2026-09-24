#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18626}"

echo "Starting Webmin 2.100 with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Waiting for Webmin service to become available..."
for i in {1..30}; do
    if curl -s -k -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/session_login.cgi" | grep -qE "^(200|302)$"; then
        echo "Webmin is ready!"
        exit 0
    fi
    sleep 1
done

echo "Webmin service started."
