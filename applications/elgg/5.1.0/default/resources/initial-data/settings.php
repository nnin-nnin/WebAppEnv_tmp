<?php
/**
 * Defines database credentials and site configuration.
 */

date_default_timezone_set('UTC');

global $CONFIG;
if (!isset($CONFIG)) {
	$CONFIG = new \stdClass;
}

$CONFIG->dataroot = "/demyx/";

if (isset($_SERVER['HTTP_HOST'])) {
    $proto = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? 'https' : 'http';
    $CONFIG->wwwroot = $proto . '://' . $_SERVER['HTTP_HOST'] . '/';
} else {
    $host_port = getenv('HOST_PORT') ?: '18560';
    $CONFIG->wwwroot = "http://localhost:{$host_port}/";
}

$CONFIG->dbuser = getenv('ELGG_DBUSER') ?: 'elgg';
$CONFIG->dbpass = getenv('ELGG_DBPASSWORD') ?: 'benchmark-only-password';
$CONFIG->dbname = getenv('ELGG_DBNAME') ?: 'elgg';
$CONFIG->dbhost = getenv('ELGG_DBHOST') ?: 'db';
$CONFIG->dbport = (int)(getenv('ELGG_DBPORT') ?: 3306);
$CONFIG->dbprefix = 'elgg_';

$CONFIG->db_disable_query_cache = false;
$CONFIG->auto_disable_plugins = true;
$CONFIG->action_time_limit = 120;
$CONFIG->allow_phpinfo = false;
