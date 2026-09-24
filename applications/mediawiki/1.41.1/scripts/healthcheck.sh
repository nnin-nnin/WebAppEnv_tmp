#!/usr/bin/env bash
set -Eeuo pipefail

url="${MEDIAWIKI_URL:-http://127.0.0.1:18519/index.php}"
for i in {1..30}; do
  body=$(curl --fail --location --silent --show-error --max-time 15 "$url" 2>/dev/null || true)
  if printf '%s' "$body" | grep -Eqi 'MediaWiki|Special:|mw-ui|mediawiki'; then
    echo "MediaWiki HTTP 验证成功: $url"
    exit 0
  fi
  sleep 2
done

echo '公开入口未返回 MediaWiki 页面' >&2
exit 1
