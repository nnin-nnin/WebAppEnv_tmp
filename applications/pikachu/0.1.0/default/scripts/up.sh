#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18764}"
URL="http://127.0.0.1:${HOST_PORT}/"

echo "Starting Pikachu with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Pikachu container services to initialize..."
MAX_ATTEMPTS=40
ATTEMPT=0

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL" 2>/dev/null || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        if docker compose -f docker/compose.yaml exec -T application mysql -uroot -e "SELECT 1" >/dev/null 2>&1; then
            echo "MySQL and Apache are ready."
            curl -s -d "submit=安装/初始化" "http://127.0.0.1:${HOST_PORT}/install.php" >/dev/null 2>&1 || true
            echo "Pikachu initialization complete."
            exit 0
        fi
    fi
    sleep 2
    ATTEMPT=$((ATTEMPT + 1))
done

echo "WARNING: Startup polling timed out, but container is running."
exit 0
