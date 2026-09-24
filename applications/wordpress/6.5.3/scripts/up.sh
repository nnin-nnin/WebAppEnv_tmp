#!/usr/bin/env bash
set -Eeuo pipefail
name="${WORDPRESS_CONTAINER:-wordpress-6-5-3}"
port="${WORDPRESS_PORT:-18513}"
docker rm -f "$name" >/dev/null 2>&1 || true
docker run --platform linux/amd64 -d --name "$name" -p "$port:80" yorem/wordpress:6.5.3

for i in {1..30}; do
  if docker exec "$name" mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot -e "SELECT 1;" >/dev/null 2>&1; then
    docker exec "$name" mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot -e "UPDATE wordpress.wp_users SET user_pass = MD5('WcWord!26-aQ6nT3F') WHERE user_login = 'admin';" >/dev/null 2>&1 || true
    break
  fi
  sleep 1
done

