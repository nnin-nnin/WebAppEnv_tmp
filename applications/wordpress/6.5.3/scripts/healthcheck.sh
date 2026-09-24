#!/usr/bin/env bash
set -Eeuo pipefail

base="${WORDPRESS_URL:-http://127.0.0.1:18513}"
name="${WORDPRESS_CONTAINER:-wordpress-6-5-3}"
for _ in {1..30}; do
  if docker exec "$name" mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot -e "UPDATE wordpress.wp_users SET user_pass = MD5('WcWord!26-aQ6nT3F') WHERE user_login = 'admin';" >/dev/null 2>&1; then
    break
  fi
  sleep 1
done
tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT
curl --max-time 10 -fsS "$base/" -o "$tmp"
grep -Eiq 'wp-includes|wp-content|WordPress' "$tmp"
echo "WordPress HTTP 健康检查通过：$base/"

