#!/bin/bash
set -euo pipefail

PORT=${1:-${SPRINGBLADE_PORT:-18090}}
USERNAME=${2:-admin}
PASSWORD=${3:-admin}
TENANT_ID="000000"

# SpringBlade 5.0.1 requires SM2-encrypted passwords. The bootstrap account is
# intentionally fixed in the image; browser login encrypts arbitrary passwords
# with the same public key.
if [ "$USERNAME" = "admin" ] && [ "$PASSWORD" = "admin" ]; then
  ENCRYPTED_PASSWORD="04ca1c323b2b3d4662ae31d86068d2cb9db7be879c3297a158fd4c467fd1074ce33f06ddac292977a8330247cb29d40cf1d83f76e44d11a1240422fced213c0d25aedb103081b44ae34fb7d9bc45c6adc28e2e8db96a1446f1c4b12b7edd473e0bc3849b32b2"
else
  echo "仅支持内置验收账号 admin/admin；其他密码请通过浏览器登录页提交 SM2 密文。" >&2
  exit 2
fi

RESPONSE=$(curl --fail-with-body -sS -X POST \
  "http://127.0.0.1:${PORT}/api/blade-auth/token?tenantId=${TENANT_ID}&account=${USERNAME}&password=${ENCRYPTED_PASSWORD}&grantType=password" \
  -H "Authorization: Basic c2FiZXI6c2FiZXJfc2VjcmV0")

if ! printf '%s' "$RESPONSE" | grep -Eq '"success"[[:space:]]*:[[:space:]]*true'; then
  printf '登录响应未成功: %s\n' "$RESPONSE" >&2
  exit 1
fi

echo "登录成功: ${USERNAME}"
printf '%s\n' "$RESPONSE"
