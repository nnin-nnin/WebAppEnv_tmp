<?php
/*
 * Subrion Open Source CMS 4.2.1
 */

define('INTELLI_CONNECT', 'mysqli');
define('INTELLI_DBHOST', 'db');
define('INTELLI_DBUSER', 'subrion');
define('INTELLI_DBPASS', 'benchmark-only');
define('INTELLI_DBNAME', 'subrion');
define('INTELLI_DBPORT', '3306');
define('INTELLI_DBPREFIX', 'ia_');

define('IA_SALT', '#4C766F4B34');

// debug mode: 0 - disabled, 1 - enabled
define('INTELLI_DEBUG', 0);

session_save_path('/var/www/html/tmp');
