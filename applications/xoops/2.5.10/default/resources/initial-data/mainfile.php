<?php
/**
 * XOOPS main configuration file
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

if (!defined('XOOPS_MAINFILE_INCLUDED')) {
    define('XOOPS_MAINFILE_INCLUDED', 1);

    // XOOPS Physical Paths

    // Physical path to the XOOPS documents (served) directory WITHOUT trailing slash
    define('XOOPS_ROOT_PATH', '/var/www/html');

    // For forward compatibility
    // Physical path to the XOOPS library directory WITHOUT trailing slash
    define('XOOPS_PATH', '/var/www/xoops_lib');
    // Physical path to the XOOPS datafiles (writable) directory WITHOUT trailing slash
    define('XOOPS_VAR_PATH', '/var/www/xoops_data');
    // Alias of XOOPS_PATH, for compatibility, temporary solution
    define('XOOPS_TRUST_PATH', XOOPS_PATH);

    // URL Association for SSL and Protocol Compatibility
    $http = 'http://';
    if (!empty($_SERVER['HTTPS'])) {
        $http = ($_SERVER['HTTPS'] === 'on') ? 'https://' : 'http://';
    }
    define('XOOPS_PROT', $http);

    // XOOPS Virtual Path (URL)
    // Virtual path to your main XOOPS directory WITHOUT trailing slash
    $host = isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : 'localhost:18602';
    define('XOOPS_URL', XOOPS_PROT . $host);

    // XOOPS Cookie Domain to specify when creating cookies.
    $cookieDomain = '';
    if (isset($_SERVER['HTTP_HOST'])) {
        $parts = explode(':', $_SERVER['HTTP_HOST']);
        $cookieDomain = $parts[0];
    }
    define('XOOPS_COOKIE_DOMAIN', $cookieDomain);

    define('XOOPS_CHECK_PATH', 0);

    // Secure file
    require XOOPS_VAR_PATH . '/data/secure.php';

    define('XOOPS_GROUP_ADMIN', '1');
    define('XOOPS_GROUP_USERS', '2');
    define('XOOPS_GROUP_ANONYMOUS', '3');

    if (!isset($xoopsOption['nocommon']) && XOOPS_ROOT_PATH != '') {
        include XOOPS_ROOT_PATH . '/include/common.php';
    }
}
