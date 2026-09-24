#!/usr/bin/env bash
set -e

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME:-anchor_cms}"
DB_USER="${DB_USER:-anchor}"
DB_PASS="${DB_PASS:-benchmark-only}"
ADMIN_USER="${ADMIN_USERNAME:-admin}"
ADMIN_PASS="${ADMIN_PASSWORD:-benchmark-only}"
ADMIN_EMAIL="${ADMIN_EMAIL:-admin@example.com}"

echo "Waiting for database connection at ${DB_HOST}:${DB_PORT}..."
until mysqladmin ping -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" --silent 2>/dev/null; do
    sleep 2
done
echo "Database connection established."

if [ ! -f /var/www/html/anchor/config/db.php ] || [ ! -f /var/www/html/anchor/config/install.lock ]; then
    echo "Initializing AnchorCMS environment..."

    cat <<EOF > /var/www/html/anchor/config/db.php
<?php

return [
    'default' => 'mysql',
    'connections' => [
        'mysql' => [
            'driver' => 'mysql',
            'hostname' => '${DB_HOST}',
            'port' => ${DB_PORT},
            'username' => '${DB_USER}',
            'password' => '${DB_PASS}',
            'database' => '${DB_NAME}',
            'charset' => 'utf8mb4',
            'prefix' => ''
        ]
    ]
];
EOF

    cat <<EOF > /var/www/html/anchor/config/app.php
<?php

return [
    'url' => '/',
    'index' => '',
    'key' => 'anchorcms_secure_random_key_sop_2026',
    'language' => 'en_GB',
    'timezone' => 'UTC'
];
EOF

    cat <<EOF > /var/www/html/anchor/config/session.php
<?php

return [
    'table' => 'sessions'
];
EOF

    cat <<'EOF' > /var/www/html/.htaccess
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^(.*)$ index.php?/$1 [L]
</IfModule>
EOF

    TABLE_COUNT=$(mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -D"$DB_NAME" -N -e "SHOW TABLES;" 2>/dev/null | wc -l || echo 0)

    if [ "$TABLE_COUNT" -eq 0 ]; then
        echo "Applying initial database schema..."
        NOW=$(date -u +"%Y-%m-%d %H:%M:%S")
        sed -e "s/{{prefix}}//g" \
            -e "s/{{charset}}/utf8mb4/g" \
            -e "s/{{now}}/$NOW/g" \
            /var/www/html/install/storage/anchor.sql > /tmp/schema.sql

        mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -D"$DB_NAME" < /tmp/schema.sql
        rm -f /tmp/schema.sql

        # The benchmark initializes the schema directly instead of using the
        # interactive installer, so provide the metadata the public renderer
        # needs to select the bundled default theme.
        mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -D"$DB_NAME" -e \
            "INSERT INTO meta (\`key\`, \`value\`) VALUES ('sitename', 'AnchorCMS'), ('description', 'AnchorCMS benchmark instance'), ('theme', 'default') ON DUPLICATE KEY UPDATE \`value\` = VALUES(\`value\`);"
    fi

    ADMIN_COUNT=$(mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -D"$DB_NAME" -N -e "SELECT COUNT(*) FROM users WHERE username='$ADMIN_USER';" 2>/dev/null || echo 0)

    if [ "$ADMIN_COUNT" -eq 0 ]; then
        echo "Seeding admin user '${ADMIN_USER}'..."
        PASS_HASH=$(php -r "echo password_hash('${ADMIN_PASS}', PASSWORD_BCRYPT, ['cost' => 12]);")
        mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -D"$DB_NAME" -e \
            "INSERT INTO users (username, password, email, real_name, bio, status, role) VALUES ('${ADMIN_USER}', '${PASS_HASH}', '${ADMIN_EMAIL}', 'Administrator', 'The boss', 'active', 'administrator');"
    fi

    touch /var/www/html/anchor/config/install.lock
    echo "AnchorCMS initialization complete."
fi

chown -R www-data:www-data /var/www/html

exec "$@"
