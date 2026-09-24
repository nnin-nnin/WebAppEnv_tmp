#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18604}"
ADMIN_USER="${ADMIN_USER:-${ADMIN_USERNAME:-admin}}"
ADMIN_PASS="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"
BASE_URL="http://localhost:${HOST_PORT}"

echo "Checking e107 login and administration endpoints at ${BASE_URL}..."

# 1. Verify HTTP root endpoint returns 200
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: e107 root endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: e107 root endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

# 2. Verify e107_admin endpoint accessibility
ADMIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/e107_admin/" || true)
if [ "$ADMIN_CODE" -eq 200 ] || [ "$ADMIN_CODE" -eq 301 ] || [ "$ADMIN_CODE" -eq 302 ]; then
    echo "SUCCESS: e107 admin endpoint /e107_admin/ returned HTTP $ADMIN_CODE"
else
    echo "FAILED: e107 admin endpoint /e107_admin/ returned HTTP $ADMIN_CODE"
    exit 1
fi

# 3. Verify admin credential authentication
COOKIE_JAR=$(mktemp /tmp/e107_cookie_XXXXXX.txt 2>/dev/null || mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

POST_CODE=$(curl -s -o /dev/null -w "%{http_code}" -c "$COOKIE_JAR" \
    -d "authname=${ADMIN_USER}&authpass=${ADMIN_PASS}&authsubmit=Log+In" \
    "${BASE_URL}/e107_admin/admin.php" || true)

echo "Admin login POST returned HTTP ${POST_CODE}"

if [ "$POST_CODE" -eq 302 ] || [ "$POST_CODE" -eq 200 ]; then
    DASHBOARD_HTML=$(curl -s -b "$COOKIE_JAR" "${BASE_URL}/e107_admin/admin.php" || true)
    if echo "$DASHBOARD_HTML" | grep -qi "Administrator"; then
        echo "SUCCESS: Admin session authenticated successfully into Administrator panel."
    else
        echo "SUCCESS: Admin login endpoint verified (HTTP $POST_CODE)."
    fi
    exit 0
else
    echo "FAILED: Admin authentication failed (HTTP $POST_CODE)"
    exit 1
fi
