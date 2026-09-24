#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="$APP_DIR/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18625}"

echo "Starting Zen Cart 1.5.7 with Docker Compose..."
cd "$APP_DIR"
docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for Zen Cart initialization..."
TIMEOUT=180
ELAPSED=0
INITIALIZED=false

while [ $ELAPSED -lt $TIMEOUT ]; do
    RUN_FIRSTBOOT=$(docker compose -f "$COMPOSE_FILE" exec -T web grep "^RUN_FIRSTBOOT=" /etc/default/inithooks 2>/dev/null || true)
    if echo "$RUN_FIRSTBOOT" | grep -q "false"; then
        INITIALIZED=true
        break
    fi
    sleep 3
    ELAPSED=$((ELAPSED + 3))
done

if [ "$INITIALIZED" != "true" ]; then
    echo "Warning: firstboot inithooks timed out or not detected. Applying post-start adjustments..."
fi

# Configure Zen Cart environment for benchmarking
docker compose -f "$COMPOSE_FILE" exec -T web bash -c '
    # Ensure MySQL service is running
    service mysql start >/dev/null 2>&1 || true

    # Stop turnkey-init-fence if active
    service turnkey-init-fence stop >/dev/null 2>&1 || true

    # Remove turnkey overlay redirect
    rm -f /var/www/zencart/.htaccess

    # Update configure.php to disable SSL and set server host
    sed -i "s|\x27ENABLE_SSL\x27, \x27true\x27|\x27ENABLE_SSL\x27, \x27false\x27|g" /var/www/zencart/includes/configure.php /var/www/zencart/manage/includes/configure.php
    sed -i "s|http://www.example.com|http://localhost:'"${HOST_PORT}"'|g; s|https://www.example.com|http://localhost:'"${HOST_PORT}"'|g" /var/www/zencart/includes/configure.php /var/www/zencart/manage/includes/configure.php

    # Create admin alias/symlink if missing
    if [ ! -e /var/www/zencart/admin ]; then
        ln -sfn /var/www/zencart/manage /var/www/zencart/admin
    fi

    # Remove curl from spiders list so curl requests are not treated as spiders
    sed -i "/curl/d" /var/www/zencart/includes/spiders.txt 2>/dev/null || true

    # Ensure admin credentials match benchmark
    /usr/lib/inithooks/bin/zencart.py --pass="benchmark-only" --email="admin@example.com" --domain="localhost:'"${HOST_PORT}"'" >/dev/null 2>&1 || true

    # Clean up any htaccess created by zencart.py again
    rm -f /var/www/zencart/.htaccess

    # Ensure MySQL and Apache are running
    service mysql start >/dev/null 2>&1 || true
    service apache2 restart >/dev/null 2>&1 || true
' >/dev/null 2>&1 || true

echo "Waiting for Zen Cart web service on port ${HOST_PORT}..."
TIMEOUT=60
ELAPSED=0
while [ $ELAPSED -lt $TIMEOUT ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -H "User-Agent: Mozilla/5.0" "http://localhost:${HOST_PORT}/" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
        echo "Zen Cart 1.5.7 is ready (HTTP $HTTP_CODE)!"
        exit 0
    fi
    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

echo "Error: Zen Cart service did not become ready within ${TIMEOUT} seconds."
docker compose -f "$COMPOSE_FILE" ps
docker compose -f "$COMPOSE_FILE" logs
exit 1
