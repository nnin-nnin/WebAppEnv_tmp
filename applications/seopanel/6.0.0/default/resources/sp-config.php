<?php

$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') ? 'https://' : 'http://';
$host = !empty($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : 'localhost:' . (getenv('HOST_PORT') ?: '18552');
define('SP_WEBPATH', getenv('SP_WEBPATH') ?: ($protocol . $host));

define('DB_NAME', getenv('DB_NAME') ?: 'seopanel');
define('DB_USER', getenv('DB_USER') ?: 'seopanel');
define('DB_PASSWORD', getenv('DB_PASSWORD') ?: 'seopanelpass');
define('DB_HOST', getenv('DB_HOST') ?: 'db');
define('DB_ENGINE', 'mysql');
define('SP_INSTALLED', '6.0.0');
define('SP_DEBUG', 0);
define('SP_TIMEOUT', 18000);
