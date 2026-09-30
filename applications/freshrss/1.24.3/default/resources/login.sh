#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18652}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking FreshRSS login endpoint at ${BASE_URL}..."

# Step 1: Check root endpoint (expected 200 or 302 redirect)
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
    echo "SUCCESS: FreshRSS root endpoint returned HTTP ${HTTP_CODE}"
else
    echo "FAILED: FreshRSS root endpoint returned HTTP ${HTTP_CODE}"
    exit 1
fi

# Step 2: Check /i/ endpoint (expected 200 or 302)
I_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/i/" || true)
if [ "$I_CODE" -eq 200 ] || [ "$I_CODE" -eq 302 ]; then
    echo "SUCCESS: FreshRSS /i/ endpoint returned HTTP ${I_CODE}"
else
    echo "FAILED: FreshRSS /i/ endpoint returned HTTP ${I_CODE}"
    exit 1
fi

# Step 3: Check web interface content
PAGE_CONTENT=$(curl -sL "${BASE_URL}/" || true)
if echo "$PAGE_CONTENT" | grep -qiE "(FreshRSS|login)"; then
    echo "SUCCESS: FreshRSS login page content verified"
else
    echo "FAILED: Page content does not match FreshRSS login"
    exit 1
fi

echo "FreshRSS login check passed."
exit 0
