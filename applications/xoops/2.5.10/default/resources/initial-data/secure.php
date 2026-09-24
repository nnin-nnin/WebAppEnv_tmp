<?php
/**
 * XOOPS secure file
 *
 * You may not change or alter any portion of this comment or credits
 * of supporting developers from this source code or any supporting source code
 * which is considered copyrighted (c) material of the original comment or credit authors.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * @copyright       (c) 2000-2016 XOOPS Project (www.xoops.org)
 * @license         GNU GPL 2 (http://www.gnu.org/licenses/gpl-2.0.html)
 */

// Database
define('XOOPS_DB_TYPE', 'mysql');

// Set the database charset if applicable
if (defined('XOOPS_DB_CHARSET')) {
    die('Restricted Access');
}
define('XOOPS_DB_CHARSET', 'utf8');

// Table Prefix
define('XOOPS_DB_PREFIX', 'xoops');

// Database Hostname
define('XOOPS_DB_HOST', getenv('DB_HOST') ?: 'db');

// Database Username
define('XOOPS_DB_USER', getenv('DB_USER') ?: 'xoops');

// Database Password
define('XOOPS_DB_PASS', getenv('DB_PASS') ?: 'AdminPassword123!');

// Database Name
define('XOOPS_DB_NAME', getenv('DB_NAME') ?: 'xoops');

// Use persistent connection? (Yes=1 No=0)
define('XOOPS_DB_PCONNECT', 0);
