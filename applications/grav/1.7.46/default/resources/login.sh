#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18570}"
BASE_URL="http://localhost:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${GRAV_USERNAME:-${GRAV_USER:-${APP_USER:-admin}}}}}"
PASSWORD="${ADMIN_PASSWORD:-${GRAV_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-AdminPassword123!}}}}"

echo "Checking Grav login at ${BASE_URL} for user '${USERNAME}'..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -X POST "${BASE_URL}/api/v1/auth/token" \
    -H "Content-Type: application/json" \
    -d "{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}")

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Grav API login succeeded (HTTP 200)"
    exit 0
else
    echo "FAILED: Grav login returned HTTP ${HTTP_CODE}"
    exit 1
fi
