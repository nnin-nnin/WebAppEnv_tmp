#!/bin/bash
set -Eeuo pipefail

BASE_URL="${ITOP_URL:-http://127.0.0.1:18515}"
LOGIN_USER="${ITOP_USER:-admin}"
if [ -z "${ITOP_PASSWORD:-}" ]; then
  echo '请通过受控环境变量 ITOP_PASSWORD 提供登录凭据。' >&2
  exit 2
fi

cookie_jar=$(mktemp)
response=$(mktemp)
trap 'rm -f "$cookie_jar" "$response"' EXIT
status=$(curl -fsS -L -c "$cookie_jar" -b "$cookie_jar" -o "$response" -w '%{http_code}' \
  -X POST -d 'login_mode=form' -d 'loginop=login' \
  --data-urlencode "auth_user=$LOGIN_USER" --data-urlencode "auth_pwd=$ITOP_PASSWORD" \
  "$BASE_URL/pages/UI.php") || {
  echo "登录请求失败 (HTTP $status)" >&2
  exit 1
}
if [ "$status" != 200 ] || grep -Eiq 'Incorrect login|Incorrect Login|登录失败|auth_pwd' "$response"; then
  echo "iTop 登录失败 (HTTP $status)" >&2
  exit 1
fi
if ! grep -Eiq 'Dashboard|Welcome to iTop|管理|CMDB|Configuration Items|IT Operations Portal' "$response"; then
  echo 'iTop 登录响应未显示真实应用页面。' >&2
  exit 1
fi
echo "iTop 登录成功: $LOGIN_USER"
