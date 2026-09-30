#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18826}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${FLUENTD_UI_USERNAME:-${ADMIN_USERNAME:-${ADMIN_USER:-admin}}}}"
PASSWORD="${2:-${FLUENTD_UI_PASSWORD:-${ADMIN_PASSWORD:-AdminPassword123!}}}"

echo "Checking Fluentd UI web endpoint at ${BASE_URL}/..."

# Step 1: Verify root endpoint returns HTTP 200 or 302
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
    echo "SUCCESS: ${BASE_URL}/ returned HTTP ${HTTP_CODE}"
else
    echo "FAILED: ${BASE_URL}/ returned HTTP ${HTTP_CODE} (expected 200 or 302)"
    exit 1
fi

# Step 2: Fetch login page and extract CSRF token
COOKIE_JAR=$(mktemp)
LOGIN_PAGE=$(curl -s -c "$COOKIE_JAR" "${BASE_URL}/sessions/new" || true)
if ! echo "$LOGIN_PAGE" | grep -qi "Fluentd"; then
    echo "FAILED: Login page did not return Fluentd branding"
    rm -f "$COOKIE_JAR"
    exit 1
fi

CSRF_TOKEN=$(echo "$LOGIN_PAGE" | grep 'csrf-token' | head -n 1 | sed -E 's/.*content="([^"]+)".*/\1/')
if [ -z "$CSRF_TOKEN" ]; then
    echo "FAILED: Unable to extract CSRF token from ${BASE_URL}/sessions/new"
    rm -f "$COOKIE_JAR"
    exit 1
fi
echo "SUCCESS: Extracted CSRF token successfully"

# Step 3: Perform authentication request
echo "Authenticating user '${USERNAME}'..."
LOGIN_STATUS=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    --data-urlencode "authenticity_token=${CSRF_TOKEN}" \
    --data-urlencode "session[name]=${USERNAME}" \
    --data-urlencode "session[password]=${PASSWORD}" \
    -w "%{http_code}" -o /dev/null "${BASE_URL}/sessions" || true)

if [ "$LOGIN_STATUS" -ne 302 ]; then
    echo "FAILED: Login request returned HTTP ${LOGIN_STATUS} (expected 302 redirect)"
    rm -f "$COOKIE_JAR"
    exit 1
fi
echo "SUCCESS: Login request authenticated successfully (HTTP 302 redirect)"

# Step 4: Verify authenticated session on daemon control page
DAEMON_PAGE=$(curl -s -b "$COOKIE_JAR" -L "${BASE_URL}/daemon" || true)
rm -f "$COOKIE_JAR"

if echo "$DAEMON_PAGE" | grep -qiE "(Sign out|Signout)" && echo "$DAEMON_PAGE" | grep -qiE "(fluentd|Running|Stopped)"; then
    echo "SUCCESS: Authenticated session confirmed on Fluentd dashboard"
else
    echo "FAILED: Dashboard page content does not indicate authenticated session"
    exit 1
fi

echo "Fluentd UI login check PASSED."
exit 0
