#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18646}"
TARGET_URL="http://127.0.0.1:${HOST_PORT}/login"

echo "Checking OpenProject login endpoint at ${TARGET_URL}..."
HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "${TARGET_URL}")

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Login endpoint returned HTTP 200"
    exit 0
else
    echo "FAILED: Login endpoint returned HTTP ${HTTP_CODE} (expected 200)"
    exit 1
fi
