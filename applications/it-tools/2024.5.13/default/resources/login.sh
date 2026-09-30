#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18665}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking IT-Tools entrypoint accessibility at ${APP_URL}/..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/")

if [ "${HTTP_CODE}" = "200" ]; then
    echo "SUCCESS: IT-Tools web interface reachable (HTTP 200)."
    exit 0
else
    echo "ERROR: IT-Tools web interface returned HTTP ${HTTP_CODE}, expected 200."
    exit 1
fi
