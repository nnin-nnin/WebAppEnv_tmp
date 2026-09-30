<?php
/**
 * ClipperCMS Configuration file
 */

$database_type = 'mysqli';
$database_server = getenv('DB_HOST') ?: 'db';
$database_user = getenv('DB_USER') ?: 'clippercms';
$database_password = getenv('DB_PASSWORD') ?: 'clippercmspassword';
$database_connection_charset = 'utf8';
$dbase = '`' . (getenv('DB_NAME') ?: 'clippercms') . '`';
$table_prefix = getenv('DB_PREFIX') ?: 'clipper_';

error_reporting(E_ALL & ~E_STRICT & ~E_NOTICE & ~E_DEPRECATED);

$lastInstallTime = 1600000000;

$site_sessionname = 'SNclippercms';
$https_port = '443';

// automatically assign base_path and base_url
if(empty($base_path)||empty($base_url)||isset($_REQUEST['base_path'])||isset($_REQUEST['base_url'])) {
    $sapi = 'undefined';
    if (!strstr($_SERVER['PHP_SELF'], $_SERVER['SCRIPT_NAME']) && ($sapi = @php_sapi_name()) == 'cgi') {
        $script_name = $_SERVER['PHP_SELF'];
    } else {
        $script_name = $_SERVER['SCRIPT_NAME'];
    }
    $a = explode("/manager", str_replace("\\", "/", dirname($script_name)));
    if (count($a) > 1)
        array_pop($a);
    $url = implode("manager", $a);
    reset($a);
    $a = explode("manager", str_replace("\\", "/", dirname(__FILE__)));
    if (count($a) > 1)
        array_pop($a);
    $pth = implode("manager", $a);
    unset ($a);
    $base_url = $url . (substr($url, -1) != "/" ? "/" : "");
    $base_path = $pth . (substr($pth, -1) != "/" && substr($pth, -1) != "\\" ? "/" : "");
}

// assign site_url
$http_host = isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : (isset($_SERVER['SERVER_NAME']) ? $_SERVER['SERVER_NAME'] : '127.0.0.1');
define('MODX_SERVER_NAME', $http_host);
$site_url = ((isset($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) == 'on') || (isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == $https_port)) ? 'https://' : 'http://';
$site_url .= MODX_SERVER_NAME;
$site_url .= $base_url;

if (!defined('MODX_BASE_PATH')) define('MODX_BASE_PATH', $base_path);
if (!defined('MODX_BASE_URL')) define('MODX_BASE_URL', $base_url);
if (!defined('MODX_SITE_URL')) define('MODX_SITE_URL', $site_url);
if (!defined('MODX_MANAGER_PATH')) define('MODX_MANAGER_PATH', $base_path . 'manager/');
if (!defined('MODX_MANAGER_URL')) define('MODX_MANAGER_URL', $site_url . 'manager/');

// start cms session
if(!function_exists('startCMSSession')) {
    function startCMSSession(){
        global $site_sessionname, $https_port;
        session_name($site_sessionname);
        session_start();
        $cookieExpiration = 0;
        if (isset($_SESSION['mgrValidated']) || isset($_SESSION['webValidated'])) {
            $contextKey = isset($_SESSION['mgrValidated']) ? 'mgr' : 'web';
            if (isset($_SESSION['modx.' . $contextKey . '.session.cookie.lifetime']) && is_numeric($_SESSION['modx.' . $contextKey . '.session.cookie.lifetime'])) {
                $cookieLifetime = intval($_SESSION['modx.' . $contextKey . '.session.cookie.lifetime']);
            }
            if (isset($cookieLifetime) && $cookieLifetime) {
                $cookieExpiration = time() + $cookieLifetime;
            }
            if (!isset($_SESSION['modx.session.created.time'])) {
                $_SESSION['modx.session.created.time'] = time();
            }
        }
        $secure = ((isset($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) == 'on') || (isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == $https_port));
        setcookie(session_name(), session_id(), $cookieExpiration, MODX_BASE_URL, null, $secure, true);
    }
}
?>
