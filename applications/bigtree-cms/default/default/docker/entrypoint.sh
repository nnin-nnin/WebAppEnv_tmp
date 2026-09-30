#!/usr/bin/env bash
set -euo pipefail

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME:-bigtree_cms}"
DB_USER="${DB_USER:-bigtree}"
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

# Check if bigtree_users table exists
TABLE_EXISTS=$(${MYSQL_CMD} -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" -e "SHOW TABLES LIKE 'bigtree_users';" -s -N 2>/dev/null || true)

if [ -z "$TABLE_EXISTS" ]; then
    echo "=== Initializing BigTree CMS Database & Files ==="

    echo "Importing base schema..."
    ${MYSQL_CMD} -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" < /var/www/html/core/setup/base.sql

    echo "Importing example site data..."
    ${MYSQL_CMD} -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" < /var/www/html/core/setup/example-site.sql

    echo "Copying example site structure..."
    cp -rn /var/www/html/core/example-site/* /var/www/html/ || true

    mkdir -p /var/www/html/cache \
             /var/www/html/custom/admin/ajax \
             /var/www/html/custom/admin/css \
             /var/www/html/custom/admin/images \
             /var/www/html/custom/admin/modules \
             /var/www/html/custom/admin/pages \
             /var/www/html/custom/admin/field-types \
             /var/www/html/custom/inc/modules \
             /var/www/html/custom/inc/required \
             /var/www/html/custom/json-db \
             /var/www/html/extensions \
             /var/www/html/site/css \
             /var/www/html/site/extensions \
             /var/www/html/site/files/pages \
             /var/www/html/site/files/resources \
             /var/www/html/site/images \
             /var/www/html/site/js \
             /var/www/html/templates/ajax \
             /var/www/html/templates/layouts \
             /var/www/html/templates/routed \
             /var/www/html/templates/basic \
             /var/www/html/templates/callouts

    touch /var/www/html/cache/composer-check.flag

    # Generate cron-run.php
    cat <<'EOF' > /var/www/html/cron-run.php
<?php
	$server_root = str_replace("cron-run.php", "", strtr(__FILE__, "\\\\", "/"));	
	include $server_root."core/cron.php";
EOF

    # Generate site/index.php
    cat <<'EOF' > /var/www/html/site/index.php
<?php
	$server_root = str_replace("site/index.php","",strtr(__FILE__, "\\\\", "/"));	
	include "../core/launch.php";
EOF

    # Generate site/.htaccess
    cat <<'EOF' > /var/www/html/site/.htaccess
IndexIgnore */*
Options -MultiViews

RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^(.*)$ index.php?bigtree_htaccess_url=$1 [QSA,L]

RewriteRule .* - [E=HTTP_IF_MODIFIED_SINCE:%{HTTP:If-Modified-Since}]
RewriteRule .* - [E=HTTP_BIGTREE_PARTIAL:%{HTTP:BigTree-Partial}]
EOF

    # Generate root .htaccess
    cat <<'EOF' > /var/www/html/.htaccess
RewriteEngine On
RewriteRule ^$ site/ [L]
RewriteRule (.*) site/$1 [L]
EOF

    # Generate custom/settings.php
    KEY=$(openssl rand -hex 16)
    sed -e "s/\[slash_behavior\]/none/g" \
        -e "s/\[settings_key\]/${KEY}/g" \
        /var/www/html/core/example-site/custom/settings.php > /var/www/html/custom/settings.php

    # Generate custom/environment.php
    cat <<'EOF' > /var/www/html/custom/environment.php
<?php
	// Time Zone
	date_default_timezone_set("America/New_York");

	$http_host = !empty($_SERVER["HTTP_HOST"]) ? $_SERVER["HTTP_HOST"] : "127.0.0.1:18804";
	$proto = (!empty($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] !== "off") ? "https://" : "http://";
	$base_url = $proto . $http_host . "/";

	// Website Environment
	$bigtree["config"]["debug"] = false;
	$bigtree["config"]["domain"] = rtrim($proto . $http_host, "/");
	$bigtree["config"]["www_root"] = $base_url;
	$bigtree["config"]["static_root"] = $base_url;
	$bigtree["config"]["admin_root"] = $base_url . "admin/";
	$bigtree["config"]["force_secure_login"] = false;
	$bigtree["config"]["environment"] = "";
	$bigtree["config"]["environment_live_url"] = "";
	$bigtree["config"]["developer_mode"] = false;
	$bigtree["config"]["maintenance_url"] = false;
	$bigtree["config"]["routing"] = "htaccess";
	$bigtree["config"]["cache"] = false;
	$bigtree["config"]["cache_ttl"] = 300;
	$bigtree["config"]["sql_interface"] = "mysqli";
	$bigtree["config"]["image_memory_limit"] = "256M";
	$bigtree["config"]["session_handler"] = "default";
	$bigtree["config"]["ssl_only_session_cookie"] = false;

	// Database Environment
	$bigtree["config"]["db"]["host"] = getenv("DB_HOST") ?: "db";
	$bigtree["config"]["db"]["name"] = getenv("DB_NAME") ?: "bigtree_cms";
	$bigtree["config"]["db"]["user"] = getenv("DB_USER") ?: "bigtree";
	$bigtree["config"]["db"]["password"] = getenv("DB_PASS") ?: "benchmark-only";
	$bigtree["config"]["db"]["port"] = getenv("DB_PORT") ?: "3306";
	$bigtree["config"]["db"]["socket"] = "";

	$bigtree["config"]["db_write"]["host"] = "";
	$bigtree["config"]["db_write"]["name"] = "";
	$bigtree["config"]["db_write"]["user"] = "";
	$bigtree["config"]["db_write"]["password"] = "";
	$bigtree["config"]["db_write"]["port"] = "";
	$bigtree["config"]["db_write"]["socket"] = "";

	$bigtree["config"]["sites"] = array();
EOF

    echo "Seeding administrator accounts..."
    PASS_HASH=$(php -r 'echo password_hash($argv[1], PASSWORD_DEFAULT);' "${ADMIN_PASSWORD}")
    ${MYSQL_CMD} -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" <<EOSQL
DELETE FROM bigtree_users WHERE email IN ('${ADMIN_USERNAME}', 'admin@example.com');
INSERT INTO bigtree_users (\`id\`, \`email\`, \`password\`, \`new_hash\`, \`2fa_secret\`, \`2fa_login_token\`, \`name\`, \`company\`, \`level\`, \`permissions\`, \`alerts\`, \`daily_digest\`, \`timezone\`, \`change_password_hash\`)
VALUES
(1, '${ADMIN_USERNAME}', '${PASS_HASH}', 'on', '', '', 'Administrator', 'Benchmark', 2, '', '', '', 'America/New_York', ''),
(2, 'admin@example.com', '${PASS_HASH}', 'on', '', '', 'Administrator', 'Benchmark', 2, '', '', '', 'America/New_York', '');
EOSQL

    rm -f /var/www/html/install.php
    echo "Initialization completed successfully."
fi

# Ensure permissions
chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html/cache /var/www/html/custom /var/www/html/site 2>/dev/null || true

echo "=== Starting Apache Web Server ==="
exec "$@"
