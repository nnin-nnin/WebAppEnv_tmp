<?php
defined('DEBUG') || define('DEBUG', 0);
error_reporting(E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE);

$config['path']['root']['url'] = F::UrlBase() . '/';
$config['path']['root']['dir'] = ALTO_DIR . '/';
$config['path']['offset_request_url']   = 0;
$config['path']['runtime']['url'] = '/_run/';
$config['path']['runtime']['dir'] = ALTO_DIR . '/_run/';

$config['db']['params']['host'] = 'db';
$config['db']['params']['port'] = '3306';
$config['db']['params']['user'] = 'altocms';
$config['db']['params']['pass'] = 'altocms_pass';
$config['db']['params']['type']   = 'mysqli';
$config['db']['params']['dbname'] = 'altocms';
$config['db']['params']['charset'] = 'utf8';

$config['db']['table']['prefix'] = 'prefix_';
$config['db']['tables']['engine'] = 'InnoDB';

$config['security']['salt_sess']  = 'sess_salt_12345678901234567890123456789012345678901234567890';
$config['security']['salt_pass']  = 'pass_salt_12345678901234567890123456789012345678901234567890';
$config['security']['salt_auth']  = 'auth_salt_12345678901234567890123456789012345678901234567890';

$config['module']['user']['captcha_use_registration'] = false;

return $config;
