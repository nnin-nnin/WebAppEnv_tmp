#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18771}"
BASE_URL="http://${HOST:-127.0.0.1}:${HOST_PORT}"

echo "Checking Drupal service endpoint at ${BASE_URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "${HTTP_CODE}" -eq 200 ]; then
    echo "SUCCESS: ${BASE_URL}/ returned HTTP 200"
    exit 0
else
    echo "FAILED: ${BASE_URL}/ returned HTTP ${HTTP_CODE} (expected 200)"
    exit 1
fi
