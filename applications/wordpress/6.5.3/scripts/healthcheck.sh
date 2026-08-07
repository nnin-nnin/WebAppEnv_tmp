#!/usr/bin/env bash
set -Eeuo pipefail

base="${WORDPRESS_URL:-http://127.0.0.1:18513}"
tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT
curl --max-time 10 -fsS "$base/" -o "$tmp"
grep -Eiq 'wp-includes|wp-content|WordPress' "$tmp"
echo "WordPress HTTP 健康检查通过：$base/"

