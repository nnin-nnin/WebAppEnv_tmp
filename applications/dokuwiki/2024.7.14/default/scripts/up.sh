#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18561}"
ADMIN_USER="${ADMIN_USER:-${ADMIN_USERNAME:-${APP_USER:-admin}}}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

echo "Starting DokuWiki 2024.7.14 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for DokuWiki service to be ready..."
for i in {1..60}; do
    if curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/" | grep -qE "^(200|301|302)$"; then
        break
    fi
    sleep 1
done

# Perform initial installation if install.php is present and not yet configured
if curl -s "http://localhost:${HOST_PORT}/install.php" | grep -q 'name="d\[superuser\]"'; then
    echo "Configuring initial DokuWiki installation..."
    curl -s -L -d "submit=1&d[title]=DokuWiki&d[acl]=1&d[superuser]=${ADMIN_USER}&d[fullname]=Administrator&d[email]=admin@example.com&d[password]=${ADMIN_PASSWORD}&d[confirm]=${ADMIN_PASSWORD}&d[policy]=1" \
        "http://localhost:${HOST_PORT}/install.php" > /dev/null
    echo "DokuWiki initial configuration complete."
fi

echo "DokuWiki startup complete on port ${HOST_PORT}."
