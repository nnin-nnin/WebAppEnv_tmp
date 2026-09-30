#!/usr/bin/env bash
set -euo pipefail

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME:-navigatecms}"
DB_USER="${DB_USER:-navigatecms}"
DB_PASS="${DB_PASS:-AdminPassword123!}"
ADMIN_USERNAME="${ADMIN_USERNAME:-admin}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

echo "=== Waiting for database connection at ${DB_HOST}:${DB_PORT}... ==="
MAX_TRIES=60
COUNT=0
while ! mysqladmin ping -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" --silent; do
    COUNT=$((COUNT + 1))
    if [ $COUNT -ge $MAX_TRIES ]; then
        echo "ERROR: Database unreachable after ${MAX_TRIES} attempts."
        exit 1
    fi
    sleep 1
done
echo "Database is reachable."

# Check if nv_users table exists
TABLE_EXISTS=$(mysql -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" -e "SHOW TABLES LIKE 'nv_users';" -s -N 2>/dev/null || true)

if [ -z "$TABLE_EXISTS" ]; then
    echo "=== Initializing NavigateCMS Database Schema ==="
    if [ -f /docker-entrypoint-initdb.d/01-database-seed.sql ]; then
        mysql -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" < /docker-entrypoint-initdb.d/01-database-seed.sql
    elif [ -f /var/www/html/resources/database-seed.sql ]; then
        mysql -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" < /var/www/html/resources/database-seed.sql
    fi
    echo "Base database schema imported."
fi

# Write cfg/globals.php
cat << 'EOF' > /var/www/html/cfg/globals.php
<?php
/* NAVIGATE */
/* Globals configuration file */

if(count(get_included_files()) == 1)
{
    exit;
}

define('APP_NAME', 'Navigate CMS');
define('APP_VERSION', '2.9.7 r1673');
define('APP_OWNER', "Navigate CMS");
define('APP_REALM', "NaviWebs-NaviGate");
define('APP_UNIQUE', "nv_benchmark_unique");
define('APP_DEBUG', true);
define('APP_FAILSAFE', true);

define('NAVIGATE_PARENT', '');
define('NAVIGATE_FOLDER', "");
define('NAVIGATE_PATH', "/var/www/html");

define('NAVIGATE_PRIVATE', "/var/www/html/private");
define('NAVIGATE_SESSIONS_PATH', '');
define('NAVIGATE_MAIN', "navigate.php");
define('NAVIGATE_DOWNLOAD', '/navigate_download.php');
define('NAVIGATE_URL', 'http://127.0.0.1:' . (getenv('HOST_PORT') ?: '18846'));

define('NAVIGATECMS_STATS', false);
define('NAVIGATECMS_UPDATES', false);

define('PDO_HOSTNAME', getenv('DB_HOST') ?: "db");
define('PDO_PORT',     getenv('DB_PORT') ?: "3306");
define('PDO_SOCKET',   "");
define('PDO_DATABASE', getenv('DB_NAME') ?: "navigatecms");
define('PDO_USERNAME', getenv('DB_USER') ?: "navigatecms");
define('PDO_PASSWORD', getenv('DB_PASS') ?: "AdminPassword123!");
define('PDO_DRIVER',   "mysql");

ini_set('magic_quotes_runtime', false);
mb_internal_encoding("UTF-8");

ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);
?>
EOF

# Apply URL and port handling patches if not present
if ! grep -q 'if(defined("NAVIGATE_URL")) { return; }' /var/www/html/lib/core/core.php 2>/dev/null; then
    php -r '$f = "/var/www/html/lib/core/core.php"; $c = file_get_contents($f); $c = preg_replace("/(function\s+core_define_navigate_url[^{]*\{)/s", "$1\n    if(defined(\"NAVIGATE_URL\")) { return; }", $c); file_put_contents($f, $c);'
fi
sed -i 's/\$port = (\$_SERVER\["SERVER_PORT"\] == "80")/\$port = (strpos(\$_SERVER["HTTP_HOST"], ":") !== false || \$_SERVER["SERVER_PORT"] == "80")/' /var/www/html/web/nvweb_routes.php

# Ensure admin user and website exist using NavigateCMS native models
php -r '
require_once("/var/www/html/cfg/globals.php");
require_once("/var/www/html/cfg/common.php");
global $DB;
$DB = new database();
if(!$DB->connect()) {
    echo "DB connect failed: " . $DB->get_last_error() . "\n";
    exit(1);
}
$user_count = $DB->query_single("COUNT(*)", "nv_users");
if(empty($user_count)) {
    echo "Seeding admin user...\n";
    $user = new user();
    $user->id = 0;
    $user->username = getenv("ADMIN_USERNAME") ?: "admin";
    $user->set_password(getenv("ADMIN_PASSWORD") ?: "AdminPassword123!");
    $user->email = "admin@example.com";
    $user->profile = 1;
    $user->skin = "cupertino";
    $user->language = "en";
    $user->blocked = 0;
    $user->timezone = "UTC";
    $user->date_format = "Y-m-d H:i";
    $user->decimal_separator = ",";
    $user->thousands_separator = "";
    $user->attempts = 0;
    $user->cookie_hash = "";
    $user->activation_key = "";
    $user->insert();
    echo "Admin user created successfully.\n";
} else {
    $user = new user();
    $user->load(1);
    $user->set_password(getenv("ADMIN_PASSWORD") ?: "AdminPassword123!");
    $user->blocked = 0;
    $user->save();
}

$site_count = $DB->query_single("COUNT(*)", "nv_websites");
if(empty($site_count)) {
    echo "Seeding default website...\n";
    $website = new website();
    $website->create_default();
    echo "Default website created successfully.\n";
}
'

# Clean up setup directory to lock installer
rm -rf /var/www/html/setup 2>/dev/null || true

# Ensure cache and private directories exist with appropriate permissions
mkdir -p /var/www/html/cache /var/www/html/private/sessions /var/www/html/private/oembed
chown -R www-data:www-data /var/www/html/cache /var/www/html/private /var/www/html/cfg 2>/dev/null || true

echo "=== NavigateCMS Initialization Complete ==="
echo "=== Starting Apache Web Server ==="
exec "$@"
