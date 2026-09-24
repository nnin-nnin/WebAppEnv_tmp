#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${LIMESURVEY_URL:-http://127.0.0.1:18517}"
base_url="${base_url%/}"
username="${LIMESURVEY_USERNAME:-admin}"
: "${LIMESURVEY_PASSWORD:?请通过受控环境变量 LIMESURVEY_PASSWORD 提供密码}"

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT
curl --fail --silent --show-error --location --max-time 15 \
    --cookie-jar "$tmp_dir/cookies" --output "$tmp_dir/login.html" \
    "$base_url/index.php?r=admin/authentication/sa/login"
csrf_token="$(grep -Eo 'value="[^"]+" name="YII_CSRF_TOKEN"' "$tmp_dir/login.html" | sed -E 's/^value="([^"]+)".*/\1/' | head -n 1)"
[[ -n "$csrf_token" ]] || { echo 'LimeSurvey 登录页面缺少 CSRF token' >&2; exit 1; }
status="$(curl --silent --show-error --max-time 15 \
    --cookie "$tmp_dir/cookies" --cookie-jar "$tmp_dir/cookies" \
    --output "$tmp_dir/post_result.html" --write-out '%{http_code}' \
    "$base_url/index.php?r=admin/authentication/sa/login" \
    --data-urlencode "YII_CSRF_TOKEN=$csrf_token" \
    --data-urlencode "user=$username" --data-urlencode "password=$LIMESURVEY_PASSWORD" \
    --data-urlencode 'authMethod=Authdb' --data-urlencode 'action=login' \
    --data-urlencode 'login_submit=login' --data-urlencode 'loginlang=en')"

dashboard_status="$(curl --silent --show-error --max-time 15 \
    --cookie "$tmp_dir/cookies" --cookie-jar "$tmp_dir/cookies" \
    --output "$tmp_dir/result.html" --write-out '%{http_code}' \
    "$base_url/index.php?r=admin")"

if [[ "$dashboard_status" != 2* ]] || ! grep -q 'authentication/sa/logout' "$tmp_dir/result.html" \
   || grep -Eiq 'Invalid username|Invalid password|Authentication failed' "$tmp_dir/result.html"; then
    echo "LimeSurvey 登录失败（HTTP ${dashboard_status}）" >&2
    exit 1
fi
echo "LimeSurvey 登录成功：$username"
