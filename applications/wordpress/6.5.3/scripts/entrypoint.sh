#!/usr/bin/env bash
set -Eeuo pipefail

db_dir=/var/lib/mysql
socket=/run/mysqld/mysqld.sock
db_name="${WORDPRESS_DB_NAME:-wordpress}"
db_user="${WORDPRESS_DB_USER:-wordpress}"
db_password="${WORDPRESS_DB_PASSWORD:-wordpress-local-db-password}"

mkdir -p /run/mysqld "$db_dir" /var/www/html/wp-content
chown -R mysql:mysql /run/mysqld "$db_dir"
chown -R www-data:www-data /var/www/html/wp-content

if [[ ! -d "$db_dir/mysql" ]]; then
  mariadb-install-db --user=mysql --datadir="$db_dir" >/var/log/mariadb-install.log 2>&1
fi

mariadbd --user=mysql --datadir="$db_dir" --bind-address=127.0.0.1 \
  --socket="$socket" --pid-file=/run/mysqld/mysqld.pid --skip-name-resolve \
  --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci &
mysql_pid=$!

shutdown() {
  apachectl -k stop >/dev/null 2>&1 || true
  mariadb-admin --protocol=socket --socket="$socket" -uroot shutdown >/dev/null 2>&1 || true
  wait "$mysql_pid" 2>/dev/null || true
}
trap shutdown TERM INT

ready=0
for _ in {1..90}; do
  if mariadb-admin --protocol=socket --socket="$socket" -uroot ping >/dev/null 2>&1; then
    ready=1
    break
  fi
  if ! kill -0 "$mysql_pid" 2>/dev/null; then
    echo 'MariaDB 在启动期间退出' >&2
    exit 1
  fi
  sleep 1
done
if [[ "$ready" != 1 ]]; then
  echo 'MariaDB 未在限定时间内就绪' >&2
  exit 1
fi

mariadb --protocol=socket --socket="$socket" -uroot <<SQL
CREATE DATABASE IF NOT EXISTS \`${db_name}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '${db_user}'@'localhost' IDENTIFIED BY '${db_password}';
ALTER USER '${db_user}'@'localhost' IDENTIFIED BY '${db_password}';
GRANT ALL PRIVILEGES ON \`${db_name}\`.* TO '${db_user}'@'localhost';
CREATE USER IF NOT EXISTS '${db_user}'@'127.0.0.1' IDENTIFIED BY '${db_password}';
ALTER USER '${db_user}'@'127.0.0.1' IDENTIFIED BY '${db_password}';
GRANT ALL PRIVILEGES ON \`${db_name}\`.* TO '${db_user}'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL

if [[ ! -f /var/www/html/wp-config.php ]]; then
  umask 077
  cat > /var/www/html/wp-config.php <<PHP
<?php
define('DB_NAME', '${db_name}');
define('DB_USER', '${db_user}');
define('DB_PASSWORD', '${db_password}');
define('DB_HOST', '127.0.0.1');
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');
define('AUTH_KEY', 'wordpress-6.5.3-auth-key');
define('SECURE_AUTH_KEY', 'wordpress-6.5.3-secure-auth-key');
define('LOGGED_IN_KEY', 'wordpress-6.5.3-logged-in-key');
define('NONCE_KEY', 'wordpress-6.5.3-nonce-key');
define('AUTH_SALT', 'wordpress-6.5.3-auth-salt');
define('SECURE_AUTH_SALT', 'wordpress-6.5.3-secure-auth-salt');
define('LOGGED_IN_SALT', 'wordpress-6.5.3-logged-in-salt');
define('NONCE_SALT', 'wordpress-6.5.3-nonce-salt');
\$table_prefix = 'wp_';
define('WP_DEBUG', false);
define('WP_AUTO_UPDATE_CORE', false);
define('WP_ENVIRONMENT_TYPE', 'local');
define('FS_METHOD', 'direct');
define('DISALLOW_FILE_MODS', false);
if (!empty(\$_SERVER['HTTP_HOST'])) {
  \$scheme = (!empty(\$_SERVER['HTTPS']) && \$_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
  \$request_host = preg_replace('/[^A-Za-z0-9.:[\\]-]/', '', \$_SERVER['HTTP_HOST']);
  if (\$request_host !== '') {
    define('WP_HOME', \$scheme . '://' . \$request_host);
    define('WP_SITEURL', \$scheme . '://' . \$request_host);
  }
}
if (!defined('ABSPATH')) define('ABSPATH', __DIR__ . '/');
require_once ABSPATH . 'wp-settings.php';
PHP
  chown www-data:www-data /var/www/html/wp-config.php
fi

if ! mariadb --protocol=socket --socket="$socket" -uroot -Nse \
  "SELECT 1 FROM information_schema.tables WHERE table_schema='${db_name}' AND table_name='wp_options'" | grep -q '^1$'; then
  php /usr/local/lib/wordpress/wp-bootstrap.php
fi

apachectl -DFOREGROUND &
apache_pid=$!
trap 'shutdown; kill "$apache_pid" 2>/dev/null || true' TERM INT

while kill -0 "$mysql_pid" 2>/dev/null && kill -0 "$apache_pid" 2>/dev/null; do
  sleep 1
done

if ! kill -0 "$mysql_pid" 2>/dev/null; then
  echo 'MariaDB unexpectedly exited' >&2
  exit 1
fi
echo 'Apache unexpectedly exited' >&2
exit 1
