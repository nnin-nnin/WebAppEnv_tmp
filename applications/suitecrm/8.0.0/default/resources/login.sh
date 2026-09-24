#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${SUITECRM_PORT:-18608}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Verifying SuiteCRM web service at ${BASE_URL}..."

HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/")
if [ "$HTTP_STATUS" != "200" ]; then
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/#/Login")
fi

if [ "$HTTP_STATUS" = "200" ]; then
    echo "SUCCESS: SuiteCRM returned HTTP 200 at ${BASE_URL} (Login endpoint accessible)"
    exit 0
else
    echo "FAILED: SuiteCRM returned unexpected HTTP status ${HTTP_STATUS}"
    exit 1
fi
