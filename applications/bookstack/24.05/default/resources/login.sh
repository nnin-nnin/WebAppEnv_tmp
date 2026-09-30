#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18650}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
LOGIN_URL="${APP_URL}/login"

echo "Checking BookStack login endpoint at ${LOGIN_URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${LOGIN_URL}")

if [ "${HTTP_CODE}" = "200" ]; then
    echo "SUCCESS: BookStack login endpoint returned HTTP 200!"
    exit 0
else
    echo "ERROR: BookStack login endpoint returned HTTP ${HTTP_CODE}, expected 200."
    exit 1
fi
