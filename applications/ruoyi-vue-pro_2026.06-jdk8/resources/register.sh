#!/usr/bin/env bash
set -Eeuo pipefail

usage() {
  echo "用法：$0 <username> <nickname> <password>" >&2
}

if [[ $# -ne 3 ]]; then
  usage
  exit 2
fi

username="$1"
nickname="$2"
password="$3"
base_url="${RUOYI_BASE_URL:-http://127.0.0.1:18087}"
tenant_name="${RUOYI_TENANT_NAME:-芋道源码}"
tenant_id="${RUOYI_TENANT_ID:-}"

if [[ ! "$username" =~ ^[a-zA-Z0-9]{4,30}$ ]]; then
  echo "用户名必须是 4-30 位数字或字母" >&2
  exit 2
fi
if [[ ${#nickname} -lt 1 || ${#nickname} -gt 30 ]]; then
  echo "昵称长度必须是 1-30 个字符" >&2
  exit 2
fi
if [[ ${#password} -lt 4 || ${#password} -gt 16 ]]; then
  echo "密码长度必须是 4-16 位" >&2
  exit 2
fi

tenant_response="$(mktemp)"
register_response="$(mktemp)"
trap 'rm -f "$tenant_response" "$register_response"' EXIT

if [[ -z "$tenant_id" ]]; then
  if ! curl --fail-with-body --silent --show-error --retry 3 --connect-timeout 5 \
      --get --data-urlencode "name=$tenant_name" \
      "$base_url/admin-api/system/tenant/get-id-by-name" >"$tenant_response"; then
    cat "$tenant_response" >&2 || true
    exit 1
  fi
  tenant_id="$(jq -er 'select(.code == 0) | .data | tostring' "$tenant_response")"
fi

register_payload="$(jq -cn --arg username "$username" --arg nickname "$nickname" --arg password "$password" \
  '{username: $username, nickname: $nickname, password: $password}')"
if ! curl --fail-with-body --silent --show-error --retry 3 --connect-timeout 5 \
    -H "Content-Type: application/json" \
    -H "tenant-id: $tenant_id" \
    --data "$register_payload" \
    "$base_url/admin-api/system/auth/register" >"$register_response"; then
  cat "$register_response" >&2 || true
  exit 1
fi

if ! jq -e '.code == 0' "$register_response" >/dev/null; then
  cat "$register_response" >&2
  exit 1
fi

echo "普通用户创建成功：username=$username tenant_id=$tenant_id"
if jq -e '.data.accessToken' "$register_response" >/dev/null 2>&1; then
  echo "注册接口同时返回了登录令牌"
fi
