#!/usr/bin/env bash
set -Eeuo pipefail

REGISTER_URL="${OWNCLOUD_URL:-http://127.0.0.1:18524}"
: "${OWNCLOUD_PASSWORD:?请通过受控环境变量提供管理员密码}"
: "${NEW_USER:?用法：NEW_USER=... NEW_PASSWORD=... resources/register.sh}"
: "${NEW_PASSWORD:?用法：NEW_USER=... NEW_PASSWORD=... resources/register.sh}"

response="$(curl -fsS --max-time 15 -u "${OWNCLOUD_USERNAME:-admin}:${OWNCLOUD_PASSWORD}" \
  -H 'OCS-APIRequest: true' -H 'Accept: application/json' -X POST \
  --data-urlencode "userid=${NEW_USER}" \
  --data-urlencode "password=${NEW_PASSWORD}" \
  "${REGISTER_URL%/}/ocs/v1.php/cloud/users")"
printf '%s\n' "${response}" | grep -Eq '"status"[[:space:]]*:[[:space:]]*"ok"'
printf 'ownCloud 用户创建验收成功：%s\n' "${NEW_USER}"
