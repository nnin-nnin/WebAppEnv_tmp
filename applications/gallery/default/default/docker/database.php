<?php defined("SYSPATH") or die("No direct script access.");

$db_host = getenv('DB_HOST') ? getenv('DB_HOST') : 'db';
$db_user = getenv('DB_USER') ? getenv('DB_USER') : 'gallery';
$db_pass = getenv('DB_PASSWORD') ? getenv('DB_PASSWORD') : 'gallery_password';
$db_name = getenv('DB_NAME') ? getenv('DB_NAME') : 'gallery';

$config['default'] = array(
  'benchmark'     => false,
  'persistent'    => false,
  'connection'    => array(
    'type'     => 'mysqli',
    'user'     => $db_user,
    'pass'     => $db_pass,
    'host'     => $db_host,
    'port'     => false,
    'socket'   => false,
    'database' => $db_name,
    'params'   => null,
  ),
  'character_set' => 'utf8',
  'table_prefix'  => '',
  'object'        => true,
  'cache'         => false,
  'escape'        => true
);
