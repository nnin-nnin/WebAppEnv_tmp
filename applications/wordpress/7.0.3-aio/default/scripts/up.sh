#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18755}"

echo "Starting WordPress 7.0.3-aio with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Waiting for WordPress service to be ready on port ${HOST_PORT}..."
ready=0
for i in {1..60}; do
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
  if [ "$HTTP_CODE" -eq 200 ]; then
    ready=1
    break
  fi
  sleep 1
done

if [ "$ready" -ne 1 ]; then
  echo "WordPress service failed to respond with HTTP 200 within 60s"
  exit 1
fi

echo "Ensuring initial administrator password and site URLs..."
docker compose -f docker/compose.yaml exec -T application php -r "require '/var/www/html/wp-load.php'; wp_set_password('password', 1); update_option('siteurl', 'http://127.0.0.1:${HOST_PORT}'); update_option('home', 'http://127.0.0.1:${HOST_PORT}');" >/dev/null 2>&1 || true

echo "WordPress 7.0.3-aio is ready at http://127.0.0.1:${HOST_PORT}/"
