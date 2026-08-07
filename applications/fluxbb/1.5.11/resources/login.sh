#!/bin/bash
set -Eeuo pipefail
base_url="${FLUXBB_URL:-http://127.0.0.1:18311}"
username="${FLUXBB_USERNAME:-admin}"
password="${FLUXBB_PASSWORD:-benchmark-only}"
cookiejar=$(mktemp); page=$(mktemp); response=$(mktemp)
trap 'rm -f "$cookiejar" "$page" "$response"' EXIT
curl --silent --show-error --fail --max-time 15 -c "$cookiejar" -b "$cookiejar" "$base_url/login.php" >"$page"
csrf=$(sed -n 's/.*name="csrf_token" value="\([^"]*\)".*/\1/p' "$page" | head -1)
[ -n "$csrf" ] || { echo 'Unable to find FluxBB CSRF token' >&2; exit 1; }
curl --silent --show-error --fail --max-time 15 -c "$cookiejar" -b "$cookiejar" -L \
    --data-urlencode form_sent=1 --data-urlencode redirect_url=index.php \
    --data-urlencode csrf_token="$csrf" --data-urlencode req_username="$username" \
    --data-urlencode req_password="$password" "$base_url/login.php?action=in" >"$response"
# 原判定含 'FluxBB'——那是站点名，连登录失败页的 <title> 都命中，任何密码都会判定成功。
# FluxBB 登录成功后返回一个 meta-refresh 中转页（curl -L 不跟随 meta refresh，
# 且其跳转目标是镜像内烘焙的 base_url，未必等于当前测试端口），因此以中转页自身的
# 成功文案为准，并兼容已经落到论坛页面的情况。
grep -Eq 'Logged in successfully|logout\.php' "$response" \
    || { echo 'FluxBB login was not confirmed' >&2; exit 1; }
echo "FluxBB login succeeded for $username at $base_url"
