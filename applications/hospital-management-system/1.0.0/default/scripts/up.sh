#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18765}"

echo "Starting hospital-management-system 1.0.0 with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Waiting for hospital-management-system service to be ready on port ${HOST_PORT}..."
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "hospital-management-system web service is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 1
done

# Ensure admin password is set to admin
echo "Ensuring admin credentials..."
for i in {1..30}; do
    if docker compose -f docker/compose.yaml exec -T application mysql -u root -proot -e "UPDATE hms.admin SET password='admin' WHERE loginid='admin';" 2>/dev/null; then
        echo "Admin credentials verified."
        break
    fi
    sleep 1
done

echo "hospital-management-system startup complete on port ${HOST_PORT}."
