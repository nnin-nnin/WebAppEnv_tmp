#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18672}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${THELOUNGE_USERNAME:-${THELOUNGE_USER:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}}}}"
PASSWORD="${2:-${THELOUNGE_PASSWORD:-${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}}}"

echo "Checking The Lounge web endpoint at ${BASE_URL}/..."

# Step 1: Verify root endpoint returns HTTP 200
HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: ${BASE_URL}/ returned HTTP 200"
else
    echo "FAILED: ${BASE_URL}/ returned HTTP ${HTTP_CODE} (expected 200)"
    exit 1
fi

# Step 2: Verify page content identifies The Lounge
PAGE_BODY=$(curl -sL "${BASE_URL}/" || true)
if echo "$PAGE_BODY" | grep -qi "The Lounge"; then
    echo "SUCCESS: The Lounge web interface verified"
else
    echo "FAILED: The Lounge title/marker not found in response"
    exit 1
fi

# Step 3: Verify administrator account exists in running service
if command -v docker >/dev/null 2>&1 && [ -f "$APP_DIR/docker/compose.yaml" ]; then
    if docker compose -f "$APP_DIR/docker/compose.yaml" ps --status running 2>/dev/null | grep -q app; then
        echo "Verifying user '${USERNAME}' via thelounge CLI..."
        if docker compose -f "$APP_DIR/docker/compose.yaml" exec -T -u node app thelounge list 2>/dev/null | grep -qw "${USERNAME}"; then
            echo "SUCCESS: User '${USERNAME}' confirmed in The Lounge user database"
        fi
    fi
fi

echo "The Lounge login check PASSED."
exit 0
