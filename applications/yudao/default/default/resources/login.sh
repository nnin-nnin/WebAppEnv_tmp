#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${APP_URL:-http://127.0.0.1:18877}"
username="${ADMIN_USERNAME:-admin}"
password="${ADMIN_PASSWORD:-admin123}"
tenant_name="${TENANT_NAME:-芋道源码}"

echo "=== Attempting login to Yudao Management System ==="
echo "Target URL: ${base_url}"
echo "Username: ${username}"

tenant_response="$(mktemp)"
trap 'rm -f "$tenant_response"' EXIT

if ! curl --fail-with-body --silent --show-error --retry 5 --retry-delay 2 --connect-timeout 5 \
    --get --data-urlencode "name=$tenant_name" \
    "$base_url/admin-api/system/tenant/get-id-by-name" >"$tenant_response"; then
  echo "ERROR: Failed to query tenant ID from $base_url/admin-api/system/tenant/get-id-by-name"
  cat "$tenant_response" >&2 || true
  exit 1
fi

tenant_id="$(jq -er 'select(.code == 0) | .data | tostring' "$tenant_response")"
if [[ -z "$tenant_id" || "$tenant_id" == "null" ]]; then
  echo "ERROR: Tenant '$tenant_name' not found in system."
  exit 1
fi
echo "Retrieved tenant_id: $tenant_id"

login_response="$(mktemp)"
trap 'rm -f "$tenant_response" "$login_response"' EXIT
login_payload="$(jq -cn --arg username "$username" --arg password "$password" \
  '{username: $username, password: $password}')"

if ! curl --fail-with-body --silent --show-error --retry 3 --connect-timeout 5 \
    -H "Content-Type: application/json" \
    -H "tenant-id: $tenant_id" \
    --data "$login_payload" \
    "$base_url/admin-api/system/auth/login" >"$login_response"; then
  echo "ERROR: Failed to post login request"
  cat "$login_response" >&2 || true
  exit 1
fi

if ! jq -e '.code == 0 and (.data.accessToken | type == "string") and (.data.accessToken | length > 0)' \
    "$login_response" >/dev/null; then
  echo "ERROR: Login failed. API response was:"
  cat "$login_response" >&2
  exit 1
fi

access_token="$(jq -er '.data.accessToken' "$login_response")"
echo "SUCCESS: Yudao administrator login successful!"
echo "Tenant ID: $tenant_id, Access Token: ${access_token:0:10}..."
exit 0
