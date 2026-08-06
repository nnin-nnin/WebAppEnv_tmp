#!/usr/bin/env bash
set -Eeuo pipefail

BASE_URL="${OSCOMMERCE_URL:-http://127.0.0.1:18402}"
BASE_URL="${BASE_URL%/}"
body="$(curl -fsS --max-time "${OSCOMMERCE_TIMEOUT:-10}" "$BASE_URL/")"

if ! grep -qi 'osCommerce\|Online Merchant' <<<"$body"; then
  echo "首页未返回真实 osCommerce 前台" >&2
  exit 1
fi

echo "osCommerce 前台健康检查通过：$BASE_URL/"

