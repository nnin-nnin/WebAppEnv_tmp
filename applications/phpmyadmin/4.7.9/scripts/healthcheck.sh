#!/usr/bin/env bash
set -euo pipefail

URL="${PMA_URL:-http://127.0.0.1:18379/index.php}"
body="$(curl --fail --silent --show-error --max-time "${PMA_TIMEOUT:-10}" "$URL")"
if ! printf '%s' "$body" | grep -qi 'phpmyadmin'; then
    echo "HTTP 已响应，但不是 phpMyAdmin 页面" >&2
    exit 1
fi
if ! printf '%s' "$body" | grep -q 'pma_username'; then
    echo "phpMyAdmin 登录页面未出现" >&2
    exit 1
fi
echo "健康检查通过：$URL"
