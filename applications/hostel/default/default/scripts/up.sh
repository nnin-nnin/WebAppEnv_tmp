#!/usr/bin/env bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="$APP_DIR/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18830}"

echo "[*] Starting Hostel Management System with Docker Compose..."
cd "$APP_DIR"
docker compose -f "$COMPOSE_FILE" up -d

echo "[*] Waiting for Hostel Management System to become ready on port ${HOST_PORT}..."
TIMEOUT=60
ELAPSED=0
READY=false

while [ $ELAPSED -lt $TIMEOUT ]; do
    HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
        READY=true
        break
    fi
    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

if [ "$READY" = "true" ]; then
    echo "[+] Hostel Management System is ready (HTTP $HTTP_CODE) after ${ELAPSED}s!"
    exit 0
else
    echo "[-] Error: Service did not become ready within ${TIMEOUT}s."
    docker compose -f "$COMPOSE_FILE" ps
    docker compose -f "$COMPOSE_FILE" logs --tail 30
    exit 1
fi
