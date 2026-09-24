#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18622}"
HOST="${HOST:-localhost}"
BASE_URL="http://${HOST}:${HOST_PORT}"
ADMIN_USER="${ADMIN_USERNAME:-${ADMIN_USER:-admin}}"
ADMIN_PASS="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"

echo "Starting SMF with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for SMF container to become ready..."
CONTAINER_ID=""
for i in $(seq 1 30); do
    CONTAINER_ID=$(docker compose -f docker/compose.yaml ps -q web 2>/dev/null || true)
    if [ -n "$CONTAINER_ID" ]; then
        STATUS=$(docker inspect -f '{{.State.Status}}' "$CONTAINER_ID" 2>/dev/null || true)
        if [ "$STATUS" = "running" ]; then
            break
        fi
    fi
    sleep 1
done

if [ -z "$CONTAINER_ID" ]; then
    echo "ERROR: SMF container failed to start"
    exit 1
fi

echo "Waiting for HTTP service and firstboot initialization to complete..."
for i in $(seq 1 90); do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/" || true)
    if [ "$HTTP_CODE" = "200" ]; then
        echo "Web service is responding (HTTP 200)."
        break
    fi
    sleep 2
done

# Synchronize admin credentials and board URL
echo "Configuring SMF admin credentials and domain..."
docker exec "$CONTAINER_ID" /usr/lib/inithooks/bin/simplemachines.py \
    --pass="${ADMIN_PASS}" \
    --email="admin@example.com" \
    --domain="localhost:${HOST_PORT}" >/dev/null 2>&1 || true

echo "SMF is up and running at ${BASE_URL}."
