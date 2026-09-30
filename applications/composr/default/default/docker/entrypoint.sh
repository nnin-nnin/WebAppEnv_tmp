#!/usr/bin/env bash
set -e

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME:-composr}"
DB_USER="${DB_USER:-composr}"
DB_PASS="${DB_PASS:-composr_password}"
ADMIN_USER="${ADMIN_USERNAME:-admin}"
ADMIN_PASS="${ADMIN_PASSWORD:-AdminPassword123!}"
ADMIN_EMAIL="${ADMIN_EMAIL:-admin@example.com}"
DOMAIN="${DOMAIN:-127.0.0.1:18808}"

# Ensure mysql client doesn't enforce TLS against standard MariaDB container
mkdir -p /etc/mysql/conf.d
cat <<'EOF' > /etc/mysql/conf.d/client.cnf
[client]
ssl = 0
EOF

echo "Waiting for database connection at ${DB_HOST}:${DB_PORT}..."
until mysqladmin ping -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" --silent 2>/dev/null; do
    sleep 2
done
echo "Database connection established."

if [ ! -f /var/www/html/_config.php ]; then
    echo "Initializing Composr environment..."

    MAINT_HASH=$(php -r "echo password_hash('${ADMIN_PASS}', PASSWORD_BCRYPT);")

    cat <<EOF > /var/www/html/_config.php
<?php
global \$SITE_INFO;
\$SITE_INFO['default_lang'] = 'EN';
\$SITE_INFO['db_type'] = 'mysqli';
\$SITE_INFO['forum_type'] = 'cns';
\$http_host = isset(\$_SERVER['HTTP_HOST']) ? \$_SERVER['HTTP_HOST'] : '${DOMAIN}';
\$proto = (isset(\$_SERVER['HTTPS']) && \$_SERVER['HTTPS'] === 'on') ? 'https://' : 'http://';
\$SITE_INFO['domain'] = \$http_host;
\$SITE_INFO['base_url'] = \$proto . \$http_host;
\$SITE_INFO['table_prefix'] = 'cms_';
\$SITE_INFO['maintenance_password'] = '${MAINT_HASH}';
\$SITE_INFO['db_site'] = '${DB_NAME}';
\$SITE_INFO['db_site_host'] = '${DB_HOST}';
\$SITE_INFO['db_site_user'] = '${DB_USER}';
\$SITE_INFO['db_site_password'] = '${DB_PASS}';
\$SITE_INFO['db_forums'] = '${DB_NAME}';
\$SITE_INFO['db_forums_host'] = '${DB_HOST}';
\$SITE_INFO['db_forums_user'] = '${DB_USER}';
\$SITE_INFO['db_forums_password'] = '${DB_PASS}';
\$SITE_INFO['self_learning_cache'] = '0';
\$SITE_INFO['session_cookie'] = 'cms_session';
EOF

    TABLE_COUNT=$(mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -D"$DB_NAME" -N -e "SHOW TABLES;" 2>/dev/null | wc -l || echo 0)

    if [ "$TABLE_COUNT" -eq 0 ]; then
        echo "Applying initial database schema from install.sql..."
        mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -D"$DB_NAME" < /var/www/html/install.sql
    fi

    echo "Configuring administrator account (${ADMIN_USER}) and site settings..."
    SALT=$(php -r "echo base64_encode(random_bytes(24));")
    PASS_HASH=$(php -r "echo password_hash('${SALT}${ADMIN_PASS}', PASSWORD_BCRYPT, ['cost' => 10]);")

    mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -D"$DB_NAME" -e \
        "UPDATE cms_f_members SET m_username='${ADMIN_USER}', m_email_address='${ADMIN_EMAIL}', m_pass_hash_salted='${PASS_HASH}', m_pass_salt='${SALT}', m_password_compat_scheme='bcrypt', m_validated=1, m_is_perm_banned='0' WHERE id=2; UPDATE cms_config SET c_set=1, c_value='0' WHERE c_name='site_closed'; UPDATE cms_config SET c_set=1, c_value='Composr' WHERE c_name='site_name';"

    touch /var/www/html/install_locked
    touch /var/www/html/install_ok
    echo "Composr initialization complete."
fi

mkdir -p /var/www/html/caches /var/www/html/uploads /var/www/html/data /var/www/html/data_custom
chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html/caches /var/www/html/uploads /var/www/html/data /var/www/html/data_custom

exec "$@"
