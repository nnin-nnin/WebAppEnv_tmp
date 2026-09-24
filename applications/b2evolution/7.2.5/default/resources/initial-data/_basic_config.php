<?php
if( !defined('EVO_CONFIG_LOADED') ) die( 'Please, do not access this page directly.' );

$maintenance_mode = 0;

$db_config = array(
	'user'     => 'b2evolution',
	'password' => 'AdminPassword123!',
	'name'     => 'b2evolution',
	'host'     => 'db',
);

$tableprefix = 'evo_';
$allow_evodb_reset = 0;

if( isset($_SERVER['HTTP_HOST']) )
{
	$baseurl = ((isset($_SERVER['HTTPS']) && ($_SERVER['HTTPS'] != 'off')) ? 'https://' : 'http://')
				. $_SERVER['HTTP_HOST'] . '/';
}
else
{
	$baseurl = 'http://localhost:18587/';
}

$assets_baseurl = $baseurl;
$admin_email = 'postmaster@localhost';
$config_is_done = 1;
?>
