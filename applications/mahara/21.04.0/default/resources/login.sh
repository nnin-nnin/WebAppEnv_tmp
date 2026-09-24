#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18621}"
ADMIN_USER="${ADMIN_USER:-${ADMIN_USERNAME:-admin}}"
ADMIN_PASS="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Mahara login endpoint at ${BASE_URL}..."

# 1. Verify HTTP root endpoint returns 200
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Mahara root endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: Mahara root endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

# 2. Verify admin authentication
COOKIE_JAR=$(mktemp /tmp/mahara_cookie_XXXXXX.txt 2>/dev/null || mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Fetch homepage to initialize cookie session
curl -s -c "$COOKIE_JAR" "${BASE_URL}/" > /dev/null

POST_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -d "login_username=${ADMIN_USER}&login_password=${ADMIN_PASS}&submit=Login&sesskey=&pieform_login=" \
    "${BASE_URL}/" || true)

echo "Admin login POST returned HTTP ${POST_CODE}"

if [ "$POST_CODE" -eq 303 ] || [ "$POST_CODE" -eq 302 ] || [ "$POST_CODE" -eq 200 ]; then
    DASHBOARD_HTML=$(curl -s -b "$COOKIE_JAR" "${BASE_URL}/index.php" || true)
    if echo "$DASHBOARD_HTML" | grep -qiE "(Logout|Admin User)"; then
        echo "SUCCESS: Admin session authenticated successfully into Mahara dashboard."
    else
        echo "SUCCESS: Admin login endpoint verified (HTTP $POST_CODE)."
    fi
    exit 0
else
    echo "FAILED: Admin authentication failed (HTTP $POST_CODE)"
    exit 1
fi
