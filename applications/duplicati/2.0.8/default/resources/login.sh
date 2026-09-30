#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18682}"
LOGIN_URL="http://127.0.0.1:${HOST_PORT}/ngax/index.html"

echo "Checking Duplicati Web UI accessibility at ${LOGIN_URL}..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${LOGIN_URL}" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Duplicati web UI returned HTTP 200."
    exit 0
else
    echo "FAILED: Duplicati web UI returned HTTP ${HTTP_CODE} (expected 200)."
    exit 1
fi
