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

HOST_PORT="${HOST_PORT:-18555}"
HOST="${HOST:-localhost}"
BASE_URL="http://${HOST}:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

echo "Attempting login to Serendipity at ${BASE_URL} for user '${USERNAME}'..."

# Pre-fetch admin page to establish session
curl -s -c "$COOKIE_JAR" -b "$COOKIE_JAR" --max-time 10 "${BASE_URL}/serendipity_admin.php" > /dev/null

LOGIN_RESP=$(curl -s -L -c "$COOKIE_JAR" -b "$COOKIE_JAR" --max-time 15 -X POST \
  -d "serendipity[action]=admin" \
  -d "serendipity[user]=${USERNAME}" \
  -d "serendipity[pass]=${PASSWORD}" \
  -d "serendipity[auto]=true" \
  -d "submit=Login" \
  "${BASE_URL}/serendipity_admin.php")

if echo "$LOGIN_RESP" | grep -qiE "main_menu|icon-logout|Welcome back|adminModule=logout"; then
    echo "SUCCESS: Login successful for ${USERNAME}!"
    exit 0
fi

if grep -qi "author_token" "$COOKIE_JAR" || grep -qi "serendipity" "$COOKIE_JAR"; then
    ADMIN_RESP=$(curl -s -L -b "$COOKIE_JAR" --max-time 10 "${BASE_URL}/serendipity_admin.php")
    if echo "$ADMIN_RESP" | grep -qiE "main_menu|icon-logout|Welcome back|adminModule=logout"; then
        echo "SUCCESS: Login verified via admin access!"
        exit 0
    fi
fi

echo "ERROR: Login failed for ${USERNAME}"
exit 1
