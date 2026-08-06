<?php

// Run FluxBB's own installer with a fixed benchmark-only configuration.
$root = '/var/www/html/';
$base_url = getenv('FLUXBB_BASE_URL') ?: 'http://localhost:18311';
$host = parse_url($base_url, PHP_URL_HOST);
$port = parse_url($base_url, PHP_URL_PORT);
$_SERVER['HTTP_HOST'] = $host.($port ? ':'.$port : '');
$_SERVER['SCRIPT_NAME'] = '/install.php';
$_SERVER['REMOTE_ADDR'] = '127.0.0.1';
$_SERVER['REQUEST_METHOD'] = 'POST';
$_POST = array(
    'form_sent' => '1', 'req_db_type' => 'mysqli_innodb', 'req_db_host' => '127.0.0.1',
    'req_db_name' => 'fluxbb', 'db_username' => 'fluxbb', 'db_password' => 'benchmark-db-only',
    'db_prefix' => 'fluxbb_', 'req_username' => 'admin', 'req_password1' => 'benchmark-only',
    'req_password2' => 'benchmark-only', 'req_email' => 'admin@example.invalid',
    'req_title' => 'FluxBB', 'desc' => 'FluxBB 1.5.11 all-in-one benchmark forum',
    'req_base_url' => $base_url, 'req_default_lang' => 'English',
    'req_default_style' => 'Air', 'install_lang' => 'English'
);
$_GET = array();
$_REQUEST = $_POST;
chdir($root);
require $root.'install.php';
