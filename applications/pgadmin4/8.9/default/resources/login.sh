#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18699}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${APP_USERNAME:-admin@example.com}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}"

echo "Checking pgAdmin 4 login page at ${BASE_URL}/login..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/login" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: pgAdmin 4 login page returned HTTP 200."
else
    echo "FAILED: pgAdmin 4 login page returned HTTP ${HTTP_CODE} (expected 200)."
    exit 1
fi

echo "Login check PASSED!"
exit 0
