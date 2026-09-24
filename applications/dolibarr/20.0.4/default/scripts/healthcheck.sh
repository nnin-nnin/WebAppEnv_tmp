#!/usr/bin/env bash
set -Eeuo pipefail

BASE_URL="${DOLIBARR_URL:-http://localhost:${DOLIBARR_PORT:-18525}}"
body="$(mktemp)"
trap 'rm -f "$body"' EXIT
code="$(curl --silent --show-error --connect-timeout 5 --max-time 15 -o "$body" -w '%{http_code}' "$BASE_URL/")"
if [[ "$code" != 2* ]] || ! grep -qi 'Dolibarr' "$body"; then
  echo "健康检查失败：HTTP $code 或页面不是 Dolibarr。" >&2
  exit 1
fi
echo "健康检查通过：HTTP ${code}，Dolibarr 页面可访问。"
