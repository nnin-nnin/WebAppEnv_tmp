#!/bin/bash
set -Eeuo pipefail

BASE_URL="${ITOP_URL:-http://127.0.0.1:18515}"
response=$(mktemp)
trap 'rm -f "$response"' EXIT
status=$(curl -fsSL -o "$response" -w '%{http_code}' "$BASE_URL/") || {
  echo "iTop HTTP 不可访问: $BASE_URL" >&2
  exit 1
}
if [ "$status" != 200 ] || ! grep -Eiq 'iTop|IT Operations Portal|login|登录' "$response"; then
  echo "iTop HTTP 验收失败 (HTTP $status)" >&2
  exit 1
fi
echo "iTop HTTP 健康检查通过: $BASE_URL"
