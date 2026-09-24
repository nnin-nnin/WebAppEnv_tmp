#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18615}"
ADMIN_USER="${ADMIN_USER:-${ADMIN_USERNAME:-${APP_USER:-admin}}}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

echo "Starting Apache Archiva 2.2.9 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Apache Archiva service to be ready..."
for i in {1..90}; do
    if curl -s -f -H "Origin: http://localhost:${HOST_PORT}" "http://localhost:${HOST_PORT}/restServices/archivaServices/pingService/ping" 2>/dev/null | grep -q "Yeah Baby It rocks!"; then
        echo "Archiva service is ready."
        break
    fi
    sleep 2
done

# Initialize administrator account if not exists
ADMIN_EXISTS=$(curl -s -H "Origin: http://localhost:${HOST_PORT}" "http://localhost:${HOST_PORT}/restServices/redbackServices/userService/isAdminUserExists" 2>/dev/null || true)
if [ "$ADMIN_EXISTS" = "false" ]; then
    echo "Configuring initial administrator account..."
    curl -s -X POST \
        -H "Origin: http://localhost:${HOST_PORT}" \
        -H "Content-Type: application/json" \
        -d "{\"username\":\"${ADMIN_USER}\",\"fullName\":\"Administrator\",\"email\":\"admin@example.com\",\"password\":\"${ADMIN_PASSWORD}\",\"confirmPassword\":\"${ADMIN_PASSWORD}\",\"locked\":false,\"passwordChangeRequired\":false,\"permanent\":true,\"validated\":true}" \
        "http://localhost:${HOST_PORT}/restServices/redbackServices/userService/createAdminUser" > /dev/null
    echo "Initial administrator configured successfully."
fi

echo "Apache Archiva startup complete on port ${HOST_PORT}."
