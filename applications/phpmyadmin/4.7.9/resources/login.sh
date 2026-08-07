#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${PMA_URL:-http://127.0.0.1:18379}"
USERNAME="${PMA_USER:-admin}"
PASSWORD="${PMA_PASSWORD:-benchmark-only}"
COOKIE_JAR="$(mktemp)"
trap 'rm -f "$COOKIE_JAR"' EXIT

login_page="$(curl --fail --silent --show-error --location --cookie-jar "$COOKIE_JAR" "$BASE_URL/index.php")"
token="$(printf '%s' "$login_page" | sed -n 's/.*name="token" value="\([^"]*\)".*/\1/p' | head -n 1)"
if [ -z "$token" ]; then
    echo "未找到 phpMyAdmin 登录 token" >&2
    exit 1
fi

result="$(curl --fail --silent --show-error --location --cookie "$COOKIE_JAR" --cookie-jar "$COOKIE_JAR" \
    --data-urlencode "token=$token" \
    --data-urlencode "pma_username=$USERNAME" \
    --data-urlencode "pma_password=$PASSWORD" \
    --data-urlencode 'server=1' \
    "$BASE_URL/index.php")"

if printf '%s' "$result" | grep -q 'id="pma_navigation_tree"\|id="serverinfo"\|server_databases.php'; then
    echo "phpMyAdmin 登录成功：$USERNAME"
else
    echo "phpMyAdmin 登录失败：$USERNAME" >&2
    exit 1
fi
