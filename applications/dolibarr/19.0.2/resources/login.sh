#!/usr/bin/env bash
set -Eeuo pipefail

BASE_URL="${DOLIBARR_URL:-http://localhost:${DOLIBARR_PORT:-18527}}"
USERNAME="${DOLIBARR_USER:-admin}"
PASSWORD="${DOLIBARR_PASSWORD:-${DOLIBARR_INITIAL_ADMIN_PASSWORD:-}}"
if [[ -z "$PASSWORD" ]]; then
  echo "登录失败：请通过 DOLIBARR_PASSWORD 或 DOLIBARR_INITIAL_ADMIN_PASSWORD 提供受控密码。" >&2
  exit 2
fi

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT
cookiejar="$workdir/cookies.txt"
page="$workdir/login.html"
result="$workdir/result.html"
curl_args=(--fail-with-body --silent --show-error --location --connect-timeout 10 --max-time 30)

curl "${curl_args[@]}" -c "$cookiejar" -b "$cookiejar" "$BASE_URL/" -o "$page"
token="$(sed -n 's/.*name="token" value="\([^"]*\)".*/\1/p' "$page" | head -1)"
if [[ -z "$token" ]]; then
  echo "登录失败：未找到 Dolibarr 登录 CSRF token。" >&2
  exit 1
fi

http_code="$(curl "${curl_args[@]}" -c "$cookiejar" -b "$cookiejar" -o "$result" -w '%{http_code}' \
  --data-urlencode "token=$token" \
  --data-urlencode 'actionlogin=login' \
  --data-urlencode 'loginfunction=loginfunction' \
  --data-urlencode "username=$USERNAME" \
  --data-urlencode "password=$PASSWORD" \
  "$BASE_URL/")"
# 原判定含 'Dolibarr'——登录页品牌名同样命中，任何密码都会判定成功。
# 改为：必须出现登录后才有的主菜单，且页面不再渲染登录表单。
if [[ "$http_code" != 2* ]] || ! grep -Eq 'id="mainmenu|class="mainmenu' "$result" || grep -q 'name="password"' "$result"; then
  echo "登录失败：Dolibarr 未建立管理员会话。" >&2
  exit 1
fi
echo "登录成功：$USERNAME"
