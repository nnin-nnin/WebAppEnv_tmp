#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18841}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to MaxSite CMS ==="
echo "Target URL: ${APP_URL}/admin"
echo "Username: ${USERNAME}"

# Step 1: Request admin page to obtain session cookie and session_id token
INITIAL_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" --max-time 15 "${APP_URL}/admin")
HTTP_STATUS=$(echo "$INITIAL_RESP" | grep -iE "^HTTP/" | tail -n1 | awk '{print $2}')

if [ "$HTTP_STATUS" != "200" ] && [ "$HTTP_STATUS" != "302" ]; then
    echo "ERROR: Failed to reach admin login page at ${APP_URL}/admin, HTTP status: ${HTTP_STATUS}"
    exit 1
fi

SESSION_ID=$(echo "$INITIAL_RESP" | sed -n 's/.*value="\([^"]*\)" name="flogin_session_id".*/\1/p' | head -n1)
if [ -z "$SESSION_ID" ]; then
    SESSION_ID=$(echo "$INITIAL_RESP" | sed -n 's/.*name="flogin_session_id" value="\([^"]*\)".*/\1/p' | head -n1)
fi

REDIRECT_URL=$(echo "$INITIAL_RESP" | sed -n 's/.*value="\([^"]*\)" name="flogin_redirect".*/\1/p' | head -n1)
if [ -z "$REDIRECT_URL" ]; then
    REDIRECT_URL="${APP_URL}/admin"
fi

if [ -z "$SESSION_ID" ]; then
    echo "ERROR: Could not extract flogin_session_id from login form."
    echo "$INITIAL_RESP" | head -n 30
    exit 1
fi

echo "Obtained login session ID. Submitting credentials..."

# Step 2: Post credentials to /login (MaxSite includes a 3-second sleep delay for brute-force prevention)
LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" --max-time 20 \
    -X POST \
    --data-urlencode "flogin_submit=1" \
    --data-urlencode "flogin_redirect=${REDIRECT_URL}" \
    --data-urlencode "flogin_session_id=${SESSION_ID}" \
    --data-urlencode "flogin_user=${USERNAME}" \
    --data-urlencode "flogin_password=${PASSWORD}" \
    "${APP_URL}/login")

if echo "$LOGIN_RESP" | grep -iq "loginform/error"; then
    echo "ERROR: MaxSite CMS returned login error redirect!"
    echo "$LOGIN_RESP" | head -n 30
    exit 1
fi

# Step 3: Access admin dashboard to verify active session
DASHBOARD=$(curl -s -S -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" --max-time 15 "${APP_URL}/admin")

if echo "$DASHBOARD" | grep -iqE "my-q-logout|logout|my-nav-panel|mainmenu|admin-home"; then
    echo "SUCCESS: MaxSite CMS administrator login successful and verified via dashboard access!"
    exit 0
else
    echo "ERROR: Login verification failed. Dashboard content did not contain expected administrative markers."
    echo "$DASHBOARD" | head -n 40
    exit 1
fi
