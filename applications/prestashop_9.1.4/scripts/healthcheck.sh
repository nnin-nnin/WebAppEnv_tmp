#!/usr/bin/env bash
set -Eeuo pipefail

BASE_URL=${APP_URL:-http://localhost:18401}
BASE_URL=${BASE_URL%/}
ADMIN_PATH=${ADMIN_PATH:-admin-dev/index.php}

status=$(curl -sS -L --max-time 10 -o /tmp/prestashop-health.html -w '%{http_code}' "$BASE_URL/")
[[ "$status" == 200 ]] || { echo "根路径 HTTP $status" >&2; exit 1; }
grep -Eqi 'PrestaShop|Your account|Shop' /tmp/prestashop-health.html || { echo '根路径不是 PrestaShop 页面' >&2; exit 1; }
admin_status=$(curl -sS -L --max-time 10 -o /dev/null -w '%{http_code}' "$BASE_URL/$ADMIN_PATH/login")
[[ "$admin_status" == 200 ]] || { echo "后台登录页 HTTP $admin_status" >&2; exit 1; }
echo "PrestaShop 页面和后台登录页正常：$BASE_URL"
