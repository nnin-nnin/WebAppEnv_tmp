#!/usr/bin/env bash
set -Eeuo pipefail

url="${MEDIAWIKI_URL:-http://127.0.0.1:18519/index.php}"
body=$(curl --fail --location --silent --show-error --max-time 10 "$url")
if ! printf '%s' "$body" | grep -Eqi 'MediaWiki|Special:|mw-ui|mediawiki'; then
  echo '公开入口未返回 MediaWiki 页面' >&2
  exit 1
fi
echo "MediaWiki HTTP 验证成功: $url"
