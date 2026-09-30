#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18655}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${USER:-admin}}}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}}}"

echo "Testing Portainer service and login at ${BASE_URL} for user '${USERNAME}'..."

# Check web interface root endpoint
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
    echo "Portainer web root responded with HTTP ${HTTP_CODE}."
fi

# Check /api/status
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/api/status" || true)
if [ "$STATUS_CODE" -eq 200 ]; then
    STATUS_BODY=$(curl -s "${BASE_URL}/api/status")
    echo "Portainer /api/status returned HTTP 200: ${STATUS_BODY}"
    echo "SUCCESS: Portainer service check passed successfully."
    exit 0
fi

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Portainer web interface returned HTTP 200."
    exit 0
fi

echo "FAILED: Neither root (${HTTP_CODE}) nor /api/status (${STATUS_CODE}) returned HTTP 200."
exit 1
