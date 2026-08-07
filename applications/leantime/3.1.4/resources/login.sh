#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${LEANTIME_URL:-http://127.0.0.1:18516}"
username="${LEANTIME_USERNAME:-admin}"
password="${LEANTIME_PASSWORD:-}"

if [[ -z "$password" ]]; then
    echo "请通过 LEANTIME_PASSWORD 提供受控凭据" >&2
    exit 2
fi

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT
cookie_file="$tmp_dir/cookies.txt"
login_page="$tmp_dir/login.html"
result_page="$tmp_dir/result.html"

curl --fail --silent --show-error --connect-timeout 10 \
    --cookie-jar "$cookie_file" --cookie "$cookie_file" \
    "$base_url/auth/login" -o "$login_page"

http_code="$(curl --silent --show-error --connect-timeout 10 \
    --cookie-jar "$cookie_file" --cookie "$cookie_file" \
    --location --output "$result_page" --write-out '%{http_code}' \
    --data-urlencode "username=$username" \
    --data-urlencode "password=$password" \
    --data-urlencode 'redirectUrl=%2Fdashboard%2Fhome' \
    --data 'login=Login' \
    "$base_url/auth/login")"

if [[ "$http_code" != "200" ]] || grep -Eiq 'name="username"|username_or_password_incorrect|headlines.login' "$result_page"; then
    echo "Leantime 登录失败" >&2
    exit 1
fi

if ! grep -Eiq 'dashboard|my work|project hub|leantime' "$result_page"; then
    echo "Leantime 登录响应未呈现已认证应用页面" >&2
    exit 1
fi

echo "Leantime 登录成功：${username}"
