#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18631}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Starting Let's Chat 0.4.8 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Let's Chat service to become ready..."
READY=0
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/login" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "200" ]; then
        READY=1
        break
    fi
    sleep 2
done

if [ "$READY" -ne 1 ]; then
    echo "FAILED: Let's Chat service failed to respond within 120s"
    docker compose -f docker/compose.yaml logs
    exit 1
fi

echo "Provisioning default user if needed..."
USERNAME="${ADMIN_USERNAME:-${LETSCHAT_USERNAME:-${ADMIN_USER:-${LETSCHAT_USER:-${USERNAME:-admin}}}}}"
PASSWORD="${ADMIN_PASSWORD:-${LETSCHAT_PASSWORD:-${ADMIN_PASS:-${LETSCHAT_PASS:-${PASSWORD:-AdminPassword123!}}}}}"
EMAIL="${ADMIN_EMAIL:-${LETSCHAT_EMAIL:-admin@benchmark.local}}"

curl -s -X POST "${URL}/account/register" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "username=${USERNAME}&email=${EMAIL}&display-name=Administrator&first-name=Admin&last-name=User&password=${PASSWORD}&password-confirm=${PASSWORD}" >/dev/null 2>&1 || true

echo "Let's Chat 0.4.8 started successfully."
