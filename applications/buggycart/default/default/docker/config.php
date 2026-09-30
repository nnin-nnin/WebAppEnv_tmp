<?php
// HTTP
$host = isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '127.0.0.1:18849';
$proto = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? 'https://' : 'http://';
$base = $proto . $host . '/';

define('HTTP_SERVER', $base);
define('HTTPS_SERVER', $base);

// DIR
define('DIR_APPLICATION', '/var/www/html/catalog/');
define('DIR_SYSTEM', '/var/www/html/system/');
define('DIR_IMAGE', '/var/www/html/image/');
define('DIR_STORAGE', DIR_SYSTEM . 'storage/');
define('DIR_LANGUAGE', DIR_APPLICATION . 'language/');
define('DIR_TEMPLATE', DIR_APPLICATION . 'view/theme/');
define('DIR_CONFIG', DIR_SYSTEM . 'config/');
define('DIR_CACHE', DIR_STORAGE . 'cache/');
define('DIR_DOWNLOAD', DIR_STORAGE . 'download/');
define('DIR_LOGS', DIR_STORAGE . 'logs/');
define('DIR_MODIFICATION', DIR_STORAGE . 'modification/');
define('DIR_SESSION', DIR_STORAGE . 'session/');
define('DIR_UPLOAD', DIR_STORAGE . 'upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', getenv('DB_HOST') ?: 'db');
define('DB_USERNAME', getenv('DB_USER') ?: 'buggycart');
define('DB_PASSWORD', getenv('DB_PASSWORD') ?: 'buggycartpassword');
define('DB_DATABASE', getenv('DB_NAME') ?: 'buggycart');
define('DB_PREFIX', 'oc_');
define('DB_PORT', getenv('DB_PORT') ?: '3306');
define('ENCRYPT_PAN', 'true');
define('ENCRYPT_PAN_KEY', '5ae1b8a17bad4da4fdac796f64c16ecd');
define('ENCRYPT_PAN_IV', '34857d973953e44afb49ea9d61104d8c');
