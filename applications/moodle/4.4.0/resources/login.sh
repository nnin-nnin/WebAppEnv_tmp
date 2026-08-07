#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${MOODLE_URL:-http://localhost:18521}"
username="${MOODLE_USERNAME:-admin}"
if [[ -z "${MOODLE_PASSWORD:-}" ]]; then
    echo 'MOODLE_PASSWORD must be supplied through the controlled credential channel.' >&2
    exit 2
fi
base_url="${base_url%/}"
cookie_file="$(mktemp)"
page_file="$(mktemp)"
response_file="$(mktemp)"
trap 'rm -f "$cookie_file" "$page_file" "$response_file"' EXIT

curl -fsS -c "$cookie_file" -b "$cookie_file" "$base_url/login/index.php" -o "$page_file"
login_token="$(sed -n 's/.*name="logintoken" value="\([^"]*\)".*/\1/p' "$page_file" | head -n 1)"

curl -fsS -L -c "$cookie_file" -b "$cookie_file" \
    --data-urlencode "username=${username}" \
    --data-urlencode "password=${MOODLE_PASSWORD}" \
    --data-urlencode "logintoken=${login_token}" \
    "$base_url/login/index.php" -o "$response_file"

# 原判定的 logout/dashboard/myhome 在未登录的登录页导航里同样出现。
# 改为检查带 sesskey 的登出链接——只有已认证会话才会渲染。
if grep -Eq 'logout\.php\?sesskey=' "$response_file"; then
    echo "Moodle login succeeded for ${username}."
else
    echo 'Moodle login failed.' >&2
    exit 1
fi
