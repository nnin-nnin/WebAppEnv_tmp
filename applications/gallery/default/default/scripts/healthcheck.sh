#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18827}"
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

echo "Checking Gallery HTTP service at ${APP_URL}..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -A "$UA" "${APP_URL}/" || echo "000")

if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
    echo "Healthcheck passed: ${APP_URL}/ returned HTTP ${HTTP_CODE}."
    exit 0
else
    echo "Healthcheck failed: ${APP_URL}/ returned HTTP ${HTTP_CODE}."
    exit 1
fi
