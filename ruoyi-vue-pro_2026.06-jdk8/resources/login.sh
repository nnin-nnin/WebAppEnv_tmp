#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${RUOYI_BASE_URL:-http://127.0.0.1:18087}"
username="${RUOYI_USERNAME:-admin}"
password="${RUOYI_PASSWORD:-admin123}"
tenant_name="${RUOYI_TENANT_NAME:-芋道源码}"
tenant_id="${RUOYI_TENANT_ID:-}"
tenant_response=""
login_response=""

if [[ -z "$tenant_id" ]]; then
  tenant_response="$(mktemp)"
  if ! curl --fail-with-body --silent --show-error --retry 3 --connect-timeout 5 \
      --get --data-urlencode "name=$tenant_name" \
      "$base_url/admin-api/system/tenant/get-id-by-name" >"$tenant_response"; then
    cat "$tenant_response" >&2 || true
    exit 1
  fi
  tenant_id="$(jq -er 'select(.code == 0) | .data | tostring' "$tenant_response")"
else
  trap 'rm -f "$login_response"' EXIT
fi

login_response="$(mktemp)"
trap 'rm -f "$tenant_response" "$login_response"' EXIT
login_payload="$(jq -cn --arg username "$username" --arg password "$password" \
  '{username: $username, password: $password}')"

if ! curl --fail-with-body --silent --show-error --retry 3 --connect-timeout 5 \
    -H "Content-Type: application/json" \
    -H "tenant-id: $tenant_id" \
    --data "$login_payload" \
    "$base_url/admin-api/system/auth/login" >"$login_response"; then
  cat "$login_response" >&2 || true
  exit 1
fi

if ! jq -e '.code == 0 and (.data.accessToken | type == "string") and (.data.accessToken | length > 0)' \
    "$login_response" >/dev/null; then
  cat "$login_response" >&2
  exit 1
fi

access_token="$(jq -er '.data.accessToken' "$login_response")"
echo "登录成功：username=$username tenant_id=$tenant_id"
echo "ACCESS_TOKEN=$access_token"
