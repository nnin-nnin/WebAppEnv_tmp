#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting Codiad 2.8.4 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Containers started. Waiting for application to initialize..."
HOST_PORT="${HOST_PORT:-18579}"
BASE_URL="http://localhost:${HOST_PORT}"

for i in $(seq 1 30); do
    if curl -s -o /dev/null -w "%{http_code}" "$BASE_URL" | grep -q "200"; then
        break
    fi
    sleep 2
done

# If installer is active, complete initial setup
if curl -s "$BASE_URL" | grep -q 'id="installer"'; then
    echo "Initializing Codiad application..."
    curl -s -X POST "${BASE_URL}/components/install/process.php" \
        -d "path=/config/www" \
        -d "username=admin" \
        -d "password=AdminPassword123!" \
        -d "password_confirm=AdminPassword123!" \
        -d "project_name=default" \
        -d "project_path=default" \
        -d "timezone=UTC" > /dev/null || true
fi
