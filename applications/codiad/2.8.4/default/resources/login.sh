#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18579}"
BASE_URL="http://localhost:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"

echo "Checking Codiad login at ${BASE_URL}..."

# Check if web application is reachable
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}")
if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 400 ]; then
    echo "FAILED: Codiad returned HTTP $HTTP_CODE"
    exit 1
fi

# If installer is present, complete setup
if curl -s "${BASE_URL}" | grep -q 'id="installer"'; then
    curl -s -X POST "${BASE_URL}/components/install/process.php" \
        -d "path=/config/www" \
        -d "username=${USERNAME}" \
        -d "password=${PASSWORD}" \
        -d "password_confirm=${PASSWORD}" \
        -d "project_name=default" \
        -d "project_path=default" \
        -d "timezone=UTC" > /dev/null || true
fi

# Authenticate via login endpoint
RESPONSE=$(curl -s -X POST "${BASE_URL}/components/user/controller.php?action=authenticate" \
    -d "username=${USERNAME}" \
    -d "password=${PASSWORD}" \
    -d "theme=default" \
    -d "language=en")

if echo "$RESPONSE" | grep -q '"status":"success"'; then
    echo "SUCCESS: Codiad authentication succeeded for user ${USERNAME}"
    exit 0
elif [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Codiad endpoint reachable and returned HTTP 200"
    exit 0
else
    echo "FAILED: Authentication returned: $RESPONSE"
    exit 1
fi
