#!/usr/bin/env bash
set -Eeuo pipefail

mysql_data_dir=/var/lib/mysql
mysql_socket=/run/mysqld/mysqld.sock
mysql_pid_file=/run/mysqld/mysqld.pid
db_name="${WORDPRESS_DB_NAME:-wordpress}"
db_user="${WORDPRESS_DB_USER:-wordpress_user}"
db_password="${WORDPRESS_DB_PASSWORD:-benchmark-only}"
site_url="${WORDPRESS_SITE_URL:-http://localhost:18084}"
site_title="${WORDPRESS_SITE_TITLE:-NAVEX WordPress 4.7.4}"
admin_user="${WORDPRESS_ADMIN_USER:-admin}"
admin_password="${WORDPRESS_ADMIN_PASSWORD:-benchmark-only}"
admin_email="${WORDPRESS_ADMIN_EMAIL:-admin@example.test}"
db_pid=""
app_pid=""

cleanup() {
  local status=$?

  trap - EXIT INT TERM
  if [[ -n "$app_pid" ]] && kill -0 "$app_pid" 2>/dev/null; then
    kill "$app_pid" 2>/dev/null || true
  fi
  if [[ -n "$db_pid" ]] && kill -0 "$db_pid" 2>/dev/null; then
    mariadb-admin --socket="$mysql_socket" -u root shutdown 2>/dev/null || kill "$db_pid" 2>/dev/null || true
  fi
  wait 2>/dev/null || true
  exit "$status"
}

trap cleanup EXIT
trap 'exit 143' INT TERM

install -d -o mysql -g mysql /run/mysqld
chown -R mysql:mysql "$mysql_data_dir"
chown -R www-data:www-data /var/www/html/wp-content

if [[ ! -d "$mysql_data_dir/mysql" ]]; then
  mariadb-install-db --user=mysql --datadir="$mysql_data_dir" --skip-test-db >/dev/null
fi

mariadbd \
  --user=mysql \
  --datadir="$mysql_data_dir" \
  --socket="$mysql_socket" \
  --pid-file="$mysql_pid_file" \
  --bind-address=127.0.0.1 \
  --skip-name-resolve \
  &
db_pid=$!

for _ in {1..60}; do
  if mariadb-admin --socket="$mysql_socket" -u root ping >/dev/null 2>&1; then
    break
  fi
  if ! kill -0 "$db_pid" 2>/dev/null; then
    echo "MariaDB exited during startup" >&2
    exit 1
  fi
  sleep 1
done

if ! mariadb-admin --socket="$mysql_socket" -u root ping >/dev/null 2>&1; then
  echo "MariaDB did not become ready" >&2
  exit 1
fi

mariadb --socket="$mysql_socket" -u root <<SQL
CREATE DATABASE IF NOT EXISTS \`$db_name\` CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER IF NOT EXISTS '$db_user'@'localhost' IDENTIFIED BY '$db_password';
CREATE USER IF NOT EXISTS '$db_user'@'127.0.0.1' IDENTIFIED BY '$db_password';
ALTER USER '$db_user'@'localhost' IDENTIFIED BY '$db_password';
ALTER USER '$db_user'@'127.0.0.1' IDENTIFIED BY '$db_password';
GRANT ALL PRIVILEGES ON \`$db_name\`.* TO '$db_user'@'localhost';
GRANT ALL PRIVILEGES ON \`$db_name\`.* TO '$db_user'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL

if [[ ! -f /var/www/html/wp-config.php ]]; then
  cat > /var/www/html/wp-config.php <<PHP
<?php
define('DB_NAME', '$db_name');
define('DB_USER', '$db_user');
define('DB_PASSWORD', '$db_password');
define('DB_HOST', '127.0.0.1');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
\$table_prefix = 'wp_';
define('WP_DEBUG', false);
if (!defined('ABSPATH')) {
    define('ABSPATH', dirname(__FILE__) . '/');
}
require_once ABSPATH . 'wp-settings.php';
PHP
fi

apache2-foreground &
app_pid=$!

for _ in {1..60}; do
  if curl -fsS -H 'Host: localhost:18084' http://127.0.0.1/wp-login.php >/dev/null 2>&1; then
    break
  fi
  if ! kill -0 "$app_pid" 2>/dev/null; then
    echo "Apache exited during startup" >&2
    exit 1
  fi
  sleep 1
done

if ! curl -fsS -H 'Host: localhost:18084' http://127.0.0.1/wp-login.php >/dev/null 2>&1; then
  echo "WordPress did not become ready" >&2
  exit 1
fi

installed="$(mariadb --socket="$mysql_socket" -u root -Nse "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='$db_name' AND table_name='wp_options';")"
if [[ "$installed" != "1" ]]; then
  install_response="$(curl --fail --silent --show-error \
    -H 'Host: localhost:18084' \
    --data-urlencode "weblog_title=$site_title" \
    --data-urlencode "user_name=$admin_user" \
    --data-urlencode "admin_email=$admin_email" \
    --data-urlencode "admin_password=$admin_password" \
    --data-urlencode "admin_password2=$admin_password" \
    --data-urlencode 'blog_public=1' \
    --data-urlencode 'Submit=Install WordPress' \
    'http://127.0.0.1/wp-admin/install.php?step=2')"
  if ! grep -q 'Success!' <<<"$install_response"; then
    printf 'WordPress web installation failed:\n%s\n' "$install_response" >&2
    exit 1
  fi
fi

WORDPRESS_SITE_URL="$site_url" php /usr/local/bin/wordpress-bootstrap.php

set +e
wait -n "$db_pid" "$app_pid"
status=$?
set -e
exit "$status"
