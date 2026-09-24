#!/bin/bash
set -euo pipefail

PORT=${1:-8080}
USERNAME=${2:-testuser_$(date +%s)}
PASSWORD=${3:-testpass}
TENANT_ID="000000"

# This release exposes register-guest only for an OAuth binding. For a normal
# local user, use the supported administrator user-management endpoint.
LOGIN_RESPONSE=$(curl --fail-with-body -sS -X POST \
  "http://127.0.0.1:${PORT}/api/blade-auth/token?tenantId=${TENANT_ID}&account=admin&password=04ca1c323b2b3d4662ae31d86068d2cb9db7be879c3297a158fd4c467fd1074ce33f06ddac292977a8330247cb29d40cf1d83f76e44d11a1240422fced213c0d25aedb103081b44ae34fb7d9bc45c6adc28e2e8db96a1446f1c4b12b7edd473e0bc3849b32b2&grantType=password" \
  -H "Authorization: Basic c2FiZXI6c2FiZXJfc2VjcmV0")
TOKEN=$(printf '%s' "$LOGIN_RESPONSE" | sed -n 's/.*"accessToken"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
if [ -z "$TOKEN" ]; then
  printf '管理员登录未返回 accessToken: %s\n' "$LOGIN_RESPONSE" >&2
  exit 1
fi

RESPONSE=$(curl --fail-with-body -sS -X POST \
  "http://127.0.0.1:${PORT}/api/blade-system/user/submit" \
  -H "Authorization: Basic c2FiZXI6c2FiZXJfc2VjcmV0" \
  -H "Blade-Auth: bearer ${TOKEN}" \
  -H "Content-Type: application/json" \
  --data "{\"tenantId\":\"${TENANT_ID}\",\"account\":\"${USERNAME}\",\"password\":\"${PASSWORD}\",\"name\":\"${USERNAME}\",\"realName\":\"${USERNAME}\",\"roleId\":\"1123598816738675202\",\"deptId\":\"1123598813738675201\",\"postId\":\"1123598817738675208\",\"status\":1}")

if ! printf '%s' "$RESPONSE" | grep -Eq '"success"[[:space:]]*:[[:space:]]*true'; then
  printf '普通用户创建未成功: %s\n' "$RESPONSE" >&2
  exit 1
fi

echo "普通用户创建成功: ${USERNAME}"
printf '%s\n' "$RESPONSE"
