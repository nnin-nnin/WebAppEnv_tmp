#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${MOODLE_URL:-http://localhost:18521}"
username="${MOODLE_USERNAME:-admin}"
password="${MOODLE_PASSWORD:-WcMood!26-mQ6rS2F}"

base_url="${base_url%/}"
cookie_file="$(mktemp)"
page_file="$(mktemp)"
response_file="$(mktemp)"
trap 'rm -f "$cookie_file" "$page_file" "$response_file"' EXIT

curl -fsS -L -c "$cookie_file" -b "$cookie_file" "$base_url/login/index.php" -o "$page_file"
login_token="$(sed -n 's/.*name="logintoken" value="\([^"]*\)".*/\1/p' "$page_file" | head -n 1)"

curl -fsS -L -c "$cookie_file" -b "$cookie_file" \
    --data-urlencode "username=${username}" \
    --data-urlencode "password=${password}" \
    --data-urlencode "logintoken=${login_token}" \
    "$base_url/login/index.php" -o "$response_file"

# 检查带 sesskey 的登出链接——只有已认证会话才会渲染
if grep -Eq 'logout\.php\?sesskey=' "$response_file"; then
    echo "Moodle login succeeded for ${username}."
else
    echo 'Moodle login failed.' >&2
    exit 1
fi
