#!/usr/bin/env bash
set -Eeuo pipefail

db_dir=/var/lib/mysql
mkdir -p /run/mysqld "$db_dir" /var/www/html/cache /var/www/html/tmp /var/www/html/administrator/logs
chown -R mysql:mysql /run/mysqld "$db_dir"

if [[ ! -d "$db_dir/mysql" ]]; then
  mariadb-install-db --user=mysql --datadir="$db_dir" >/var/log/mariadb-install.log 2>&1
fi

mariadbd --user=mysql --datadir="$db_dir" --bind-address=127.0.0.1 --skip-name-resolve --socket=/run/mysqld/mysqld.sock &
mysql_pid=$!
cleanup() {
  apachectl -k stop >/dev/null 2>&1 || true
  mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot shutdown >/dev/null 2>&1 || true
  wait "$mysql_pid" 2>/dev/null || true
}
trap cleanup TERM INT EXIT

for _ in {1..60}; do
  mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot ping >/dev/null 2>&1 && break
  kill -0 "$mysql_pid" 2>/dev/null || { echo 'MariaDB exited during startup' >&2; exit 1; }
  sleep 1
done
mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot ping >/dev/null 2>&1 || { echo 'MariaDB did not become ready' >&2; exit 1; }

if ! mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot -Nse "SELECT 1 FROM information_schema.schemata WHERE schema_name='${JOOMLA_DB_NAME}'" | grep -q 1; then
  mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot <<SQL
CREATE DATABASE IF NOT EXISTS \`${JOOMLA_DB_NAME}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '${JOOMLA_DB_USER}'@'localhost' IDENTIFIED BY '${JOOMLA_DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${JOOMLA_DB_NAME}\`.* TO '${JOOMLA_DB_USER}'@'localhost';
CREATE USER IF NOT EXISTS '${JOOMLA_DB_USER}'@'127.0.0.1' IDENTIFIED BY '${JOOMLA_DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${JOOMLA_DB_NAME}\`.* TO '${JOOMLA_DB_USER}'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL
  sed 's/#__/jos_/g' /opt/joomla/database-seed.sql | mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot "$JOOMLA_DB_NAME"
  admin_hash=$(php -r 'echo password_hash("benchmark-only", PASSWORD_BCRYPT);')
  mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot "$JOOMLA_DB_NAME" <<SQL
INSERT INTO jos_users (name, username, email, password, block, sendEmail, registerDate, params, requireReset)
VALUES ('Administrator', 'admin', 'admin@example.local', '${admin_hash}', 0, 1, NOW(), '{}', 0);
SET @uid = LAST_INSERT_ID();
INSERT INTO jos_user_usergroup_map (user_id, group_id) VALUES (@uid, 8);
SQL
fi

cat > /var/www/html/configuration.php <<PHP
<?php
class JConfig {
 public \$offline = false; public \$offline_message = 'This site is down for maintenance.'; public \$display_offline_message = 1;
 public \$offline_image = ''; public \$sitename = 'Joomla'; public \$editor = 'tinymce'; public \$captcha = 0; public \$list_limit = 20; public \$access = 1; public \$frontediting = 1;
 public \$dbtype = 'mysqli'; public \$host = '127.0.0.1'; public \$user = '${JOOMLA_DB_USER}'; public \$password = '${JOOMLA_DB_PASSWORD}'; public \$db = '${JOOMLA_DB_NAME}'; public \$dbprefix = 'jos_'; public \$dbencryption = 0; public \$dbsslverifyservercert = false; public \$dbsslkey = ''; public \$dbsslcert = ''; public \$dbsslca = ''; public \$dbsslcipher = '';
 public \$secret = 'joomla-benchmark-secret-5-1-1'; public \$gzip = false; public \$error_reporting = 'default'; public \$helpurl = 'https://help.joomla.org/proxy?keyref=Help{major}{minor}:{keyref}&lang={langcode}'; public \$tmp_path = '/var/www/html/tmp'; public \$log_path = '/var/www/html/administrator/logs'; public \$live_site = ''; public \$force_ssl = 0;
 public \$offset = 'UTC'; public \$lifetime = 15; public \$session_handler = 'database'; public \$shared_session = false; public \$session_filesystem_path = '';
 public \$mailonline = false; public \$mailer = 'mail'; public \$mailfrom = 'admin@example.local'; public \$fromname = 'Joomla'; public \$massmailoff = false; public \$replyto = ''; public \$replytoname = ''; public \$sendmail = '/usr/sbin/sendmail'; public \$smtpauth = false; public \$smtpuser = ''; public \$smtppass = ''; public \$smtphost = 'localhost'; public \$smtpsecure = 'none'; public \$smtpport = 25;
 public \$caching = 0; public \$cachetime = 15; public \$cache_handler = 'file'; public \$cache_platformprefix = false; public \$debug = false; public \$debug_lang = false; public \$sef = true; public \$sef_rewrite = false; public \$sef_suffix = false; public \$unicodeslugs = false; public \$feed_limit = 10; public \$feed_email = 'none'; public \$cookie_domain = ''; public \$cookie_path = ''; public \$asset_id = 1; public \$behind_loadbalancer = false;
}
PHP
chown www-data:www-data /var/www/html/configuration.php /var/www/html/administrator/logs
rm -rf /var/www/html/installation

apachectl -DFOREGROUND &
apache_pid=$!
wait -n "$mysql_pid" "$apache_pid"
status=$?
exit "$status"
