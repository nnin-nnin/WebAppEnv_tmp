#!/usr/bin/env bash
set -Eeuo pipefail

LOGIN_URL="${OWNCLOUD_URL:-http://127.0.0.1:18524}"
LOGIN_USER="${OWNCLOUD_USERNAME:-admin}"
: "${OWNCLOUD_PASSWORD:?请通过受控环境变量提供登录密码}"

response="$(curl -fsS --max-time 15 -u "${LOGIN_USER}:${OWNCLOUD_PASSWORD}" \
  -H 'OCS-APIRequest: true' -H 'Accept: application/json' \
  "${LOGIN_URL%/}/ocs/v1.php/cloud/capabilities?format=json")"
printf '%s\n' "${response}" | grep -Eq '"status"[[:space:]]*:[[:space:]]*"ok"'
printf 'ownCloud 登录验收成功：%s\n' "${LOGIN_USER}"
