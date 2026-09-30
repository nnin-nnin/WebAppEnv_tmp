<?php
/**
 * CubeCart v6 Custom SSL / URL Handler
 * Prevents forced 301 redirection to HTTPS when running on standard HTTP port.
 */
define('CC_SSL', true);

$server_name = (!empty($_SERVER['HTTP_HOST'])) ? strtolower($_SERVER['HTTP_HOST']) : strtolower($_SERVER['SERVER_NAME'] ?? 'localhost');
$proto = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
$url = $proto.'://'.$server_name.$script_path;
if (substr($url, -1) == '/') {
    $url = substr($url, 0, -1);
}
