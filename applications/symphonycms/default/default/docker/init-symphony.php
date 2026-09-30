#!/usr/bin/env php
<?php
// Symphony CMS Automated Setup Script
set_time_limit(0);

$db_host = getenv('DB_HOST') ?: 'db';
$db_port = getenv('DB_PORT') ?: '3306';
$db_name = getenv('DB_NAME') ?: 'symphony_cms';
$db_user = getenv('DB_USER') ?: 'symphony';
$db_pass = getenv('DB_PASS') ?: 'benchmark-only';
$admin_user = getenv('ADMIN_USERNAME') ?: 'admin';
$admin_pass = getenv('ADMIN_PASSWORD') ?: 'AdminPassword123!';

$_SERVER['SCRIPT_FILENAME'] = '/var/www/html/install/index.php';
$_SERVER['HTTP_HOST'] = '127.0.0.1:18868';
$_SERVER['SERVER_PORT'] = '18868';
define('DOCROOT', '/var/www/html');
define('VERSION', '3.0.0');
define('INSTALL', DOCROOT . '/install');
define('SYMPHONY_LAUNCHER_NO_DB', true);

require_once DOCROOT . '/vendor/autoload.php';

echo "=== Initializing Symphony CMS ===\n";

// Connect via PDO
$dsn = "mysql:host={$db_host};port={$db_port};dbname={$db_name};charset=utf8mb4";
$pdo = new PDO($dsn, $db_user, $db_pass, [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
]);

// 1. Check if sym_authors table exists
$stmt = $pdo->query("SHOW TABLES LIKE 'sym_authors'");
$tableExists = $stmt->fetch();

if (!$tableExists) {
    echo "Importing table schemas from install.sql...\n";
    $sql = file_get_contents(INSTALL . '/includes/install.sql');
    $sql = preg_replace('/(?<=[\s`])tbl_([a-zA-Z0-9_]+)/', 'sym_$1', $sql);
    $queries = preg_split('/;[\r\n]+/', $sql);
    foreach ($queries as $q) {
        $q = trim($q);
        if ($q !== '') {
            $pdo->exec($q);
        }
    }

    echo "Seeding administrator author account...\n";
    $passHash = Cryptography::hash($admin_pass);
    $stmt = $pdo->prepare("INSERT INTO sym_authors (id, username, password, first_name, last_name, email, last_seen, user_type, `primary`, default_area, auth_token) VALUES (1, :username, :password, 'Administrator', 'Admin', 'admin@example.com', NOW(), 'developer', 'yes', '/blueprints/sections/', NULL)");
    $stmt->execute([
        ':username' => $admin_user,
        ':password' => $passHash,
    ]);

    echo "Creating default index page and type in database...\n";
    $pdo->exec("INSERT INTO sym_pages (id, parent, title, handle, path, params, data_sources, events, sortorder) VALUES (1, NULL, 'Home', 'index', NULL, NULL, NULL, NULL, 1) ON DUPLICATE KEY UPDATE id=1");
    $pdo->exec("INSERT INTO sym_pages_types (id, page_id, type) VALUES (1, 1, 'index') ON DUPLICATE KEY UPDATE id=1");
} else {
    echo "Database tables already exist. Updating admin password hash...\n";
    $passHash = Cryptography::hash($admin_pass);
    $stmt = $pdo->prepare("UPDATE sym_authors SET password = :password WHERE username = :username OR id = 1");
    $stmt->execute([
        ':password' => $passHash,
        ':username' => $admin_user,
    ]);
}

// 2. Setup manifest folders and config.php
@mkdir(DOCROOT . '/manifest', 0775, true);
@mkdir(DOCROOT . '/manifest/logs', 0775, true);
@mkdir(DOCROOT . '/manifest/cache', 0775, true);
@mkdir(DOCROOT . '/manifest/tmp', 0775, true);

if (!file_exists(DOCROOT . '/manifest/config.php')) {
    echo "Writing manifest/config.php...\n";
    include INSTALL . '/includes/config_default.php';
    $settings['database']['host'] = $db_host;
    $settings['database']['port'] = $db_port;
    $settings['database']['user'] = $db_user;
    $settings['database']['password'] = $db_pass;
    $settings['database']['db'] = $db_name;
    $settings['database']['tbl_prefix'] = 'sym_';
    $settings['general']['sitename'] = 'Symphony CMS';
    $settings['symphony']['cookie_prefix'] = 'sym-';
    $settings['symphony']['session_strict_domain'] = 'no';
    $settings['symphony']['enable_xsrf'] = 'no';
    $settings['symphony']['version'] = VERSION;
    $settings['region']['timezone'] = 'UTC';

    $serializer = new ArraySerializer($settings);
    file_put_contents(DOCROOT . '/manifest/config.php', $serializer->asPHPFile());
    chmod(DOCROOT . '/manifest/config.php', 0664);
}

// 3. Setup .htaccess
if (!file_exists(DOCROOT . '/.htaccess')) {
    echo "Writing .htaccess...\n";
    $htaccess = file_get_contents(INSTALL . '/includes/htaccess.txt');
    $htaccess = str_replace('<!-- REWRITE_BASE -->', '', $htaccess);
    file_put_contents(DOCROOT . '/.htaccess', $htaccess);
    chmod(DOCROOT . '/.htaccess', 0664);
}

// 4. Setup workspace structure and index.xsl
@mkdir(DOCROOT . '/workspace', 0775, true);
@mkdir(DOCROOT . '/workspace/pages', 0775, true);
@mkdir(DOCROOT . '/workspace/data-sources', 0775, true);
@mkdir(DOCROOT . '/workspace/events', 0775, true);
@mkdir(DOCROOT . '/workspace/utilities', 0775, true);

if (!file_exists(DOCROOT . '/workspace/pages/index.xsl')) {
    echo "Creating workspace/pages/index.xsl...\n";
    $indexXsl = <<<'XSL'
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;&#10;</xsl:text>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Symphony CMS</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; margin: 40px auto; max-width: 650px; line-height: 1.6; padding: 0 16px; color: #333; background: #fdfdfd; }
        .card { border: 1px solid #e0e0e0; border-radius: 8px; padding: 28px; background: #fff; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
        h1 { color: #d03030; margin-top: 0; }
        a { color: #206090; font-weight: 600; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Symphony CMS</h1>
        <p>Welcome to Symphony CMS default deployment environment.</p>
        <p><a href="/symphony/">Log in to Administration &#8594;</a></p>
    </div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
XSL;
    file_put_contents(DOCROOT . '/workspace/pages/index.xsl', $indexXsl);
    chmod(DOCROOT . '/workspace/pages/index.xsl', 0664);
}

echo "Symphony CMS initialization complete.\n";
