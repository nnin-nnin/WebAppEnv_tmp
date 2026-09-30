<?php
$db_host = getenv('DB_HOST') ?: 'db';
$db_user = getenv('DB_USER') ?: 'root';
$db_pass = getenv('DB_PASS') ?: 'benchmark-only';
$db_name = getenv('DB_NAME') ?: 'hospital';

$con = @mysql_connect($db_host, $db_user, $db_pass);
if (!$con) {
    die('Could not connect: ' . mysql_error());
}
mysql_select_db($db_name, $con);
?>
