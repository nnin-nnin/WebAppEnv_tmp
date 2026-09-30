#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18824}"
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

echo "Validating Docker Compose configuration..."
docker compose -f "$COMPOSE_FILE" config --quiet

echo "Starting eXo Platform services..."
docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for eXo Platform services to become healthy (timeout: 350s)..."
MAX_ATTEMPTS=70
ATTEMPT=0

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
    ATTEMPT=$((ATTEMPT + 1))

    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -A "$UA" --connect-timeout 5 --max-time 10 "http://127.0.0.1:${HOST_PORT}/portal/" 2>/dev/null || echo "000")
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
        echo "eXo Platform portal is responding (HTTP ${HTTP_CODE})."
        
        # Check if AccountSetup is required on first launch
        PORTAL_HTML=$(curl -s -L -A "$UA" --connect-timeout 5 --max-time 15 "http://127.0.0.1:${HOST_PORT}/portal/" 2>/dev/null || true)
        if echo "$PORTAL_HTML" | grep -qi "accountSetup"; then
            echo "First-time setup detected: initializing admin and root credentials..."
            curl -s -L -A "$UA" --connect-timeout 5 --max-time 30 -X POST "http://127.0.0.1:${HOST_PORT}/portal/accountSetupAction" \
                -H "Content-Type: application/x-www-form-urlencoded" \
                -d "username=admin&firstNameAccount=Admin&lastNameAccount=User&emailAccount=admin@example.com&password=AdminPassword123!&confirmUserPasswordAccount=AdminPassword123!&adminPassword=AdminPassword123!&confirmAdminPassword=AdminPassword123!&setupbutton=submitform" > /dev/null 2>&1 || true
            echo "Account setup successfully submitted."
            sleep 5
        fi

        # Verify login endpoint
        LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" -A "$UA" --connect-timeout 5 --max-time 15 "http://127.0.0.1:${HOST_PORT}/portal/login" 2>/dev/null || echo "000")
        if [ "$LOGIN_CODE" = "200" ] || [ "$LOGIN_CODE" = "302" ]; then
            echo "eXo Platform environment is UP and healthy on port ${HOST_PORT}!"
            docker compose -f "$COMPOSE_FILE" ps
            exit 0
        fi
    fi

    echo "Waiting for eXo Platform to start... ($ATTEMPT/$MAX_ATTEMPTS)"
    sleep 5
done

echo "ERROR: eXo Platform environment failed to start properly within 350 seconds."
docker compose -f "$COMPOSE_FILE" ps
docker compose -f "$COMPOSE_FILE" logs --tail 50
exit 1
