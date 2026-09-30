#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18680}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-Admin123456!}}"

echo "Checking Transmission Web UI authentication at ${BASE_URL}/transmission/web/..."

TARGET_URL="http://${USERNAME}:${PASSWORD}@127.0.0.1:${HOST_PORT}/transmission/web/"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$TARGET_URL" || true)

if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 301 ]; then
    echo "SUCCESS: Transmission Web UI returned HTTP ${HTTP_CODE} with authentication."
else
    echo "FAILED: Transmission Web UI returned HTTP ${HTTP_CODE} (expected 200 or 301)."
    exit 1
fi

PAGE_BODY=$(curl -s "$TARGET_URL" || true)
if echo "$PAGE_BODY" | grep -qi "Transmission"; then
    echo "SUCCESS: Transmission Web UI page content verified."
else
    echo "FAILED: Transmission marker not found in page content."
    exit 1
fi

echo "Login check PASSED!"
exit 0
