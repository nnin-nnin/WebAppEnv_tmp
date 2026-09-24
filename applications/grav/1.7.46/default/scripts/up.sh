#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18570}"
ADMIN_USER="${ADMIN_USERNAME:-${ADMIN_USER:-${GRAV_USERNAME:-${GRAV_USER:-${APP_USER:-admin}}}}}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-${GRAV_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-AdminPassword123!}}}}"

echo "Starting Grav 1.7.46 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Grav service to be ready..."
for i in {1..60}; do
    if curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/" | grep -qE "^(200|301|302)$"; then
        break
    fi
    sleep 1
done

# Perform initial installation/account setup if setup is required
for i in {1..30}; do
    SETUP_JSON=$(curl -s "http://localhost:${HOST_PORT}/api/v1/auth/setup" || true)
    if echo "$SETUP_JSON" | grep -q '"setup_required":true'; then
        echo "Configuring initial Grav admin account..."
        curl -s -X POST "http://localhost:${HOST_PORT}/api/v1/auth/setup" \
            -H "Content-Type: application/json" \
            -d "{\"username\":\"${ADMIN_USER}\",\"password\":\"${ADMIN_PASSWORD}\",\"email\":\"admin@example.com\",\"fullname\":\"Administrator\"}" > /dev/null
        echo "Grav initial admin setup complete."
        break
    elif echo "$SETUP_JSON" | grep -q '"setup_required":false'; then
        echo "Grav admin account already configured."
        break
    fi
    sleep 1
done

echo "Grav startup complete on port ${HOST_PORT}."
