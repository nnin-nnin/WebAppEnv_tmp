<?php

/**
 * The base MySQL settings of Osclass
 */
define('MULTISITE', 0);

/** MySQL database name for Osclass */
define('DB_NAME', getenv('DB_NAME') ?: 'osclass');

/** MySQL database username */
define('DB_USER', getenv('DB_USER') ?: 'osclass');

/** MySQL database password */
define('DB_PASSWORD', getenv('DB_PASSWORD') ?: 'osclass');

/** MySQL hostname */
define('DB_HOST', getenv('DB_HOST') ?: 'db');

/** Database Table prefix */
define('DB_TABLE_PREFIX', 'oc_');

define('REL_WEB_URL', '/');

$proto = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') ? 'https://' : 'http://';
$host = isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : (getenv('SERVER_HOST') ?: '127.0.0.1:18850');
define('WEB_PATH', getenv('WEB_PATH') ?: ($proto . $host . '/'));

?>
