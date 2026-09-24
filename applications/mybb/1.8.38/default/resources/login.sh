#!/usr/bin/env bash
set -euo pipefail

# Strip local proxies
export http_proxy=""
export https_proxy=""
export HTTP_PROXY=""
export HTTPS_PROXY=""
export all_proxy=""
export ALL_PROXY=""
export no_proxy="*"
export NO_PROXY="*"

HOST_PORT="${HOST_PORT:-18543}"
BASE_URL="http://${HOST:-localhost}:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

echo "Attempting login to MyBB at ${BASE_URL} for user '${USERNAME}'..."

LOGIN_PAGE=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" --max-time 10 "${BASE_URL}/member.php?action=login")
POST_KEY=$(echo "$LOGIN_PAGE" | grep -o 'name="my_post_key"[^>]*value="[^"]*"' | head -n 1 | sed -E 's/.*value="([^"]+)".*/\1/' || true)

if [ -z "$POST_KEY" ]; then
    POST_KEY=$(echo "$LOGIN_PAGE" | grep -o 'var my_post_key = "[^"]*"' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/' || true)
fi

if [ -z "$POST_KEY" ]; then
    echo "ERROR: Failed to retrieve my_post_key from login page."
    exit 1
fi

LOGIN_RESP=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" --max-time 10 \
    -d "action=do_login&url=${BASE_URL}/index.php&quick_login=1&my_post_key=${POST_KEY}&username=${USERNAME}&password=${PASSWORD}&submit=Login" \
    "${BASE_URL}/member.php")

if echo "$LOGIN_RESP" | grep -qiE "successfully been logged in|welcome back|redirecting"; then
    echo "SUCCESS: Login successful!"
    exit 0
fi

if grep -q "mybbuser" "$COOKIE_JAR"; then
    echo "SUCCESS: Login session cookie established!"
    exit 0
fi

echo "ERROR: Login failed for ${USERNAME}"
exit 1
