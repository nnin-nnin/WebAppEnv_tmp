#!/usr/bin/env bash
set -Eeuo pipefail

BASE_URL=${APP_URL:-http://localhost:18401}
BASE_URL=${BASE_URL%/}
ADMIN_PATH=${ADMIN_PATH:-admin-dev/index.php}
ADMIN_EMAIL=${ADMIN_EMAIL:-${PRESTASHOP_USER:-${ADMIN_USER:-admin@example.com}}}
if [[ "$ADMIN_EMAIL" != *"@"* ]]; then
  ADMIN_EMAIL="admin@example.com"
fi
ADMIN_PASSWORD=${ADMIN_PASSWORD:-${PRESTASHOP_PASSWORD:-benchmark-only}}
COOKIE_JAR=$(mktemp)
LOGIN_PAGE=$(mktemp)
RESULT_PAGE=$(mktemp)
trap 'rm -f "$COOKIE_JAR" "$LOGIN_PAGE" "$RESULT_PAGE"' EXIT

curl -fsS -L -c "$COOKIE_JAR" "$BASE_URL/$ADMIN_PATH/login" -o "$LOGIN_PAGE"
LOGIN_TOKEN=$(sed -n 's/.*name="_token" value="\([^"]*\)".*/\1/p' "$LOGIN_PAGE" | head -n 1)
[[ -n "$LOGIN_TOKEN" ]] || { echo '未找到 PrestaShop 后台登录令牌' >&2; exit 1; }
curl -fsS -L -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
  -d "email=$ADMIN_EMAIL" \
  --data-urlencode "passwd=$ADMIN_PASSWORD" \
  -d 'submit_login=Log+in' \
  --data-urlencode "_token=$LOGIN_TOKEN" \
  "$BASE_URL/$ADMIN_PATH/login" -o "$RESULT_PAGE"

if grep -Eqi 'name="email"|The employee does not exist|incorrect' "$RESULT_PAGE"; then
  echo 'PrestaShop 管理员登录失败' >&2
  exit 1
fi
if ! grep -Eqi 'dashboard|dashboard.*welcome|catalog|orders|customers' "$RESULT_PAGE"; then
  echo 'PrestaShop 管理员登录结果未进入后台页面' >&2
  exit 1
fi
echo "PrestaShop 管理员登录成功：$ADMIN_EMAIL"
