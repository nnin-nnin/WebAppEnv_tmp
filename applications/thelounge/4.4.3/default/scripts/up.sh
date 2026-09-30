#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18672}"
USERNAME="${THELOUNGE_USERNAME:-${THELOUNGE_USER:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}}}"
PASSWORD="${THELOUNGE_PASSWORD:-${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}}}"

echo "Starting The Lounge 4.4.3 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for The Lounge HTTP service to be ready on port ${HOST_PORT}..."
READY=0
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        READY=1
        break
    fi
    sleep 2
done

if [ "$READY" -ne 1 ]; then
    echo "ERROR: The Lounge service failed to respond within timeout."
    docker compose -f docker/compose.yaml logs
    exit 1
fi

echo "Checking if initial user '${USERNAME}' exists..."
if ! docker compose -f docker/compose.yaml exec -T -u node app thelounge list 2>/dev/null | grep -qw "${USERNAME}"; then
    echo "Creating user '${USERNAME}'..."
    docker compose -f docker/compose.yaml exec -T -u node app thelounge add --password "${PASSWORD}" "${USERNAME}"
fi

echo "The Lounge startup complete on port ${HOST_PORT}."
exit 0
