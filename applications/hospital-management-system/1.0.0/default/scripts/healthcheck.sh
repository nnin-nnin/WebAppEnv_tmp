#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18765}"
BASE_URL="http://${HOST:-127.0.0.1}:${HOST_PORT}"

echo "Checking hospital-management-system health at $BASE_URL..."

# Check root page
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: Root endpoint returned HTTP $HTTP_CODE (expected 200)"
    exit 1
fi

PAGE_CONTENT=$(curl -s "$BASE_URL/" || true)
if echo "$PAGE_CONTENT" | grep -qiE "(Care and Cure|Hospital)"; then
    echo "SUCCESS: hospital-management-system web interface verified"
else
    echo "FAILED: Response content does not match expected hospital-management-system output"
    exit 1
fi

# Check admin login page
HTTP_CODE_LOGIN=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/adminlogin.php" || true)
if [ "$HTTP_CODE_LOGIN" -ne 200 ]; then
    echo "FAILED: Admin login endpoint returned HTTP $HTTP_CODE_LOGIN (expected 200)"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
