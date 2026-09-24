<?php namespace ProcessWire;

/**
 * ProcessWire Configuration File
 *
 * ProcessWire 3.x, Copyright 2026 by Ryan Cramer
 * https://processwire.com
 */

if(!defined("PROCESSWIRE")) die();

/** @var Config $config */

/*** SITE CONFIG *************************************************************************/

$config->useFunctionsAPI = true;
$config->usePageClasses = true;
$config->useMarkupRegions = true;
$config->prependTemplateFile = '_init.php';
$config->appendTemplateFile = '_main.php';
$config->templateCompile = false;

/*** INSTALLER CONFIG ********************************************************************/
$config->dbHost = getenv('DB_HOST') ?: 'db';
$config->dbName = getenv('DB_NAME') ?: 'processwire';
$config->dbUser = getenv('DB_USER') ?: 'processwire';
$config->dbPass = getenv('DB_PASS') ?: 'processwire';
$config->dbPort = getenv('DB_PORT') ?: '3306';
$config->dbCharset = 'utf8mb4';
$config->dbEngine = 'InnoDB';

$config->userAuthSalt = '3c4ce8ee1f1bf24484252ba2c07551cfb698b425'; 
$config->tableSalt = 'a7b49c57b6b4766ed8351af0a0342697354b4b67'; 

$config->chmodDir = '0755';
$config->chmodFile = '0644';

$config->timezone = 'UTC';
$config->defaultAdminTheme = 'AdminThemeUikit';
$config->AdminThemeUikit('themeName', 'default');
$config->installed = 1790164743;
$config->sessionName = 'pw80';

if(isset($_SERVER['HTTP_HOST'])) {
    $config->httpHosts = array($_SERVER['HTTP_HOST'], 'localhost', '127.0.0.1');
} else {
    $config->httpHosts = array('localhost', '127.0.0.1');
}

$config->debug = false;
