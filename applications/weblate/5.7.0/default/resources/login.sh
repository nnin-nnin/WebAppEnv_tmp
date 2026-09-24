#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18600}"
APP_URL="${APP_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${1:-${WEBLATE_USER:-${ADMIN_USER:-admin}}}"
PASSWORD="${2:-${WEBLATE_PASSWORD:-${ADMIN_PASSWORD:-AdminPassword123!}}}"

echo "Testing login endpoint at ${APP_URL}/accounts/login/..."
LOGIN_PAGE_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/accounts/login/")

if [ "$LOGIN_PAGE_STATUS" -eq 200 ]; then
    echo "SUCCESS: /accounts/login/ endpoint returned HTTP 200"
else
    echo "FAILED: /accounts/login/ endpoint returned HTTP ${LOGIN_PAGE_STATUS}"
    exit 1
fi

echo "Verifying authenticated API access for user '${USERNAME}' at ${APP_URL}/api/..."
API_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -u "${USERNAME}:${PASSWORD}" "${APP_URL}/api/")

if [ "$API_STATUS" -eq 200 ]; then
    echo "SUCCESS: Authenticated API access verified via /api/ (HTTP 200)"
else
    echo "FAILED: /api/ returned HTTP ${API_STATUS}"
    exit 1
fi

exit 0
