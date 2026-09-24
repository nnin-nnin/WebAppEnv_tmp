#!/usr/bin/env bash
set -Eeuo pipefail

url="${OPENCART_URL:-http://localhost:18523/}"
body_file="$(mktemp)"
cleanup() { rm -f "$body_file"; }
trap cleanup EXIT

status="$(curl -sS -L --max-time 15 -o "$body_file" -w '%{http_code}' "$url" 2>/dev/null || true)"
if [ "$status" != "200" ]; then
    echo "OpenCart HTTP 检查失败：HTTP $status" >&2
    exit 1
fi
if ! grep -Eiq 'OpenCart|Your Store|Shopping Cart' "$body_file"; then
    echo 'OpenCart HTTP 检查失败：响应不是应用页面。' >&2
    exit 1
fi
echo "OpenCart HTTP 检查通过：$url"
