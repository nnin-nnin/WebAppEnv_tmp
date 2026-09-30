#!/usr/bin/env bash
set -e

ADMIN_USERNAME="${ADMIN_USERNAME:-admin}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"
ADMIN_EMAIL="${ADMIN_EMAIL:-admin@example.com}"
SITE_NAME="${SITE_NAME:-Monstra}"
SITE_URL="${SITE_URL:-http://localhost:18845}"

echo "=== Initializing Monstra CMS ==="

# Initialize data and database if needed
php -r '
define("DS", DIRECTORY_SEPARATOR);
define("ROOT", "/var/www/html");
define("BACKEND", false);
define("MONSTRA_ACCESS", true);

require_once("/var/www/html/engine/_init.php");

$admin_user = getenv("ADMIN_USERNAME") ?: "admin";
$admin_pass = getenv("ADMIN_PASSWORD") ?: "AdminPassword123!";
$admin_email = getenv("ADMIN_EMAIL") ?: "admin@example.com";
$site_name = getenv("SITE_NAME") ?: "Monstra";
$site_url = getenv("SITE_URL") ?: "http://localhost:18845";

// Update options
Option::update(array(
    "maintenance_status" => "off",
    "sitename"           => $site_name,
    "siteurl"            => $site_url,
    "description"        => "Academic Security Benchmark Environment",
    "keywords"           => "monstra, cms, secsys",
    "slogan"             => "Fast & small content management system",
    "defaultpage"        => "home",
    "timezone"           => "UTC",
    "system_email"       => $admin_email,
    "theme_site_name"    => "default",
    "theme_admin_name"   => "default"
));

// Manage users table
$users = new Table("users");
$existing = $users->select("[login=\"{$admin_user}\"]", null);
if (empty($existing)) {
    $users->insert(array(
        "login"           => $admin_user,
        "password"        => Security::encryptPassword($admin_pass),
        "email"           => $admin_email,
        "hash"            => Text::random("alnum", 12),
        "date_registered" => time(),
        "role"            => "admin"
    ));
} else {
    $users->updateWhere("[login=\"{$admin_user}\"]", array(
        "password" => Security::encryptPassword($admin_pass),
        "role"     => "admin",
        "email"    => $admin_email
    ));
}

echo "Monstra configuration and administrator initialized successfully.\n";
'

# Configure .htaccess RewriteBase if needed
if [ -f /var/www/html/.htaccess ]; then
    sed -i 's|/%siteurlhere%/|/|g' /var/www/html/.htaccess
fi

# Ensure installer is removed to prevent installer redirect
if [ -f /var/www/html/install.php ]; then
    rm -f /var/www/html/install.php
fi

# Ensure correct permissions
chown -R www-data:www-data /var/www/html/storage /var/www/html/public /var/www/html/backups /var/www/html/tmp 2>/dev/null || true
chmod -R 777 /var/www/html/storage /var/www/html/public /var/www/html/backups /var/www/html/tmp 2>/dev/null || true

echo "=== Monstra initialization complete. Starting Web Server ==="
exec "$@"
