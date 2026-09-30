#!/usr/bin/env bash
set -euo pipefail

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME:-horde}"
DB_USER="${DB_USER:-horde}"
DB_PASS="${DB_PASS:-benchmark-only}"
ADMIN_USERNAME="${ADMIN_USERNAME:-admin}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

MYSQLADMIN_CMD="mysqladmin --skip-ssl"
MYSQL_CMD="mysql --skip-ssl"

echo "=== Waiting for database connection at ${DB_HOST}:${DB_PORT}... ==="
MAX_TRIES=60
COUNT=0
while ! ${MYSQLADMIN_CMD} ping -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" --silent; do
    COUNT=$((COUNT + 1))
    if [ $COUNT -ge $MAX_TRIES ]; then
        echo "ERROR: Database unreachable after ${MAX_TRIES} attempts."
        exit 1
    fi
    sleep 1
done
echo "Database is reachable."

# Check if horde_users table exists
TABLE_EXISTS=$(${MYSQL_CMD} -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" -e "SHOW TABLES LIKE 'horde_users';" -s -N 2>/dev/null || true)

if [ -z "$TABLE_EXISTS" ]; then
    echo "=== Initializing Horde Database Schema ==="
    if [ -f /var/www/html/scripts/sql/schema.sql ]; then
        ${MYSQL_CMD} -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" < /var/www/html/scripts/sql/schema.sql
        echo "Base schema imported."
    fi

    echo "=== Seeding Administrator Accounts ==="
    MD5_PASS=$(php -r 'echo md5($argv[1]);' "${ADMIN_PASSWORD}")
    ${MYSQL_CMD} -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" <<EOSQL
DELETE FROM horde_users WHERE user_uid IN ('${ADMIN_USERNAME}', 'administrator');
INSERT INTO horde_users (user_uid, user_pass, user_soft_expiration_date, user_hard_expiration_date)
VALUES
('${ADMIN_USERNAME}', '${MD5_PASS}', NULL, NULL),
('administrator', '${MD5_PASS}', NULL, NULL);
EOSQL
    echo "Seeded users '${ADMIN_USERNAME}' and 'administrator'."
fi

# Ensure default configs
cp -n /var/www/html/config/nls.php.dist /var/www/html/config/nls.php 2>/dev/null || true
cp -n /var/www/html/config/prefs.php.dist /var/www/html/config/prefs.php 2>/dev/null || true
cp -n /var/www/html/config/hooks.php.dist /var/www/html/config/hooks.php 2>/dev/null || true

# Generate or update conf.php
cat <<EOF > /var/www/html/config/conf.php
<?php
/* CONFIG START. DO NOT CHANGE ANYTHING IN OR AFTER THIS LINE. */
\$conf['vhosts'] = false;
\$conf['debug_level'] = E_ALL & ~E_NOTICE;
\$conf['max_exec_time'] = 0;
\$conf['compress_pages'] = true;
\$conf['secret_key'] = 'benchmark-secret-key-1234567890';
\$conf['umask'] = 077;
\$conf['use_ssl'] = 0;
\$conf['server']['name'] = '127.0.0.1';
\$conf['urls']['token_lifetime'] = 30;
\$conf['urls']['hmac_algo'] = 'sha1';
\$conf['safe_ips'] = array();
\$conf['session']['name'] = 'Horde';
\$conf['session']['use_only_cookies'] = true;
\$conf['session']['timeout'] = 0;
\$conf['session']['cookie_lifetime'] = 0;
\$conf['session']['cookie_path'] = '/';
\$conf['session']['cookie_domain'] = '';
\$conf['session']['max_time'] = 72000;
\$conf['cookie']['domain'] = '';
\$conf['cookie']['path'] = '/';
\$conf['sql']['username'] = '${DB_USER}';
\$conf['sql']['password'] = '${DB_PASS}';
\$conf['sql']['hostspec'] = '${DB_HOST}';
\$conf['sql']['port'] = ${DB_PORT};
\$conf['sql']['protocol'] = 'tcp';
\$conf['sql']['database'] = '${DB_NAME}';
\$conf['sql']['charset'] = 'utf-8';
\$conf['sql']['ssl'] = false;
\$conf['sql']['splitread'] = false;
\$conf['sql']['phptype'] = 'mysqli';
\$conf['auth']['admins'] = array('${ADMIN_USERNAME}', 'administrator');
\$conf['auth']['checkip'] = false;
\$conf['auth']['checkbrowser'] = false;
\$conf['auth']['resetpassword'] = true;
\$conf['auth']['alternate_login'] = false;
\$conf['auth']['redirect_on_logout'] = false;
\$conf['auth']['list_users'] = 'list';
\$conf['auth']['driver'] = 'sql';
\$conf['auth']['params']['table'] = 'horde_users';
\$conf['auth']['params']['username_field'] = 'user_uid';
\$conf['auth']['params']['password_field'] = 'user_pass';
\$conf['auth']['params']['encryption'] = 'md5-hex';
\$conf['auth']['params']['show_encryption'] = false;
\$conf['signup']['allow'] = false;
\$conf['log']['priority'] = 'INFO';
\$conf['log']['ident'] = 'HORDE';
\$conf['log']['name'] = '/tmp/horde.log';
\$conf['log']['type'] = 'file';
\$conf['log']['enabled'] = true;
\$conf['prefs']['params']['driverconfig'] = 'horde';
\$conf['prefs']['driver'] = 'Sql';
\$conf['alarms']['params']['driverconfig'] = 'horde';
\$conf['alarms']['driver'] = 'Sql';
\$conf['group']['params']['driverconfig'] = 'horde';
\$conf['group']['driver'] = 'Sql';
\$conf['perms']['driver'] = 'Sql';
\$conf['share']['driver'] = 'Sql';
\$conf['cache']['driver'] = 'File';
\$conf['cache']['params']['dir'] = '/tmp';
\$conf['cache']['params']['sub'] = 0;
\$conf['lock']['driver'] = 'Sql';
\$conf['token']['driver'] = 'Sql';
\$conf['mailer']['type'] = 'null';
\$conf['mail']['format'] = 'html';
\$conf['testdisable'] = false;
EOF

# Ensure permissions
touch /tmp/horde.log
chown -R www-data:www-data /var/www/html/config /tmp/horde.log 2>/dev/null || true
chmod -R 775 /var/www/html/config 2>/dev/null || true

echo "=== Starting Apache Web Server ==="
exec "$@"
