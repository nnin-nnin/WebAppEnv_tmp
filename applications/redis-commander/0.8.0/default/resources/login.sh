#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18687}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-Admin123456!}}"

echo "Checking Redis Commander authentication at ${BASE_URL}..."

TARGET_URL="http://${USERNAME}:${PASSWORD}@127.0.0.1:${HOST_PORT}/"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$TARGET_URL" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Redis Commander returned HTTP ${HTTP_CODE} with authentication."
else
    echo "FAILED: Redis Commander returned HTTP ${HTTP_CODE} (expected 200)."
    exit 1
fi

PAGE_BODY=$(curl -s "$TARGET_URL" || true)
if echo "$PAGE_BODY" | grep -qi "redis"; then
    echo "SUCCESS: Redis Commander page content verified."
else
    echo "FAILED: Redis Commander marker not found in page content."
    exit 1
fi

echo "Login check PASSED!"
exit 0
