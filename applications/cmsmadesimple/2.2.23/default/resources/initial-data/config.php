<?php
# CMS Made Simple Configuration File
# Documentation: https://docs.cmsmadesimple.org/configuration/config-file/config-reference
#

$config['dbms'] = 'mysqli';
$config['db_hostname'] = 'db';
$config['db_username'] = 'cmsms';
$config['db_password'] = 'AdminPassword123!';
$config['db_name'] = 'cmsms';
$config['db_prefix'] = 'cms_';
$config['timezone'] = 'UTC';
$config['url_rewriting'] = 'none';

if (isset($_SERVER['HTTP_HOST'])) {
    $proto = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? 'https' : 'http';
    $config['root_url'] = $proto . '://' . $_SERVER['HTTP_HOST'];
}
?>
