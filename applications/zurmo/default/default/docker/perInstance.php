<?php
    /*********************************************************************************
     * Zurmo perInstance configuration
     ********************************************************************************/

    $language         = 'en';
    $currencyBaseCode = 'USD';
    $theme            = 'default';

    $dbHost           = getenv('DB_HOST') ?: 'db';
    $dbPort           = getenv('DB_PORT') ?: '3306';
    $dbName           = getenv('DB_NAME') ?: 'zurmo';
    $dbUser           = getenv('DB_USER') ?: 'root';
    $dbPass           = getenv('DB_PASS') ?: 'AdminPassword123!';

    $connectionString = "mysql:host={$dbHost};port={$dbPort};dbname={$dbName}";
    $username         = $dbUser;
    $password         = $dbPass;
    $memcacheServers  = array();
    $adminEmail       = 'info@zurmo.com';
    $installed        = true;
    $maintenanceMode  = false;
    $instanceConfig   = array();

    $hostInfo         = getenv('HOST_INFO') ?: 'http://localhost:18879';
    $instanceConfig['components']['request']['hostInfo']         = $hostInfo;
    $instanceConfig['components']['request']['scriptUrl']        = '/app/index.php';

    $urlManager = array();

    if (is_file(INSTANCE_ROOT . '/protected/config/perInstanceConfig.php'))
    {
        require_once INSTANCE_ROOT . '/protected/config/perInstanceConfig.php';
    }
    define('ZURMO_TOKEN', '41a96729520e37a');
    define('ZURMO_PASSWORD_SALT', '26f5fbd51c41b57');
?>
