<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
return array(
    'components' => array(
        'db' => array(
            'connectionString' => 'mysql:host=127.0.0.1;port=3306;dbname=limesurvey;',
            'emulatePrepare' => true,
            'username' => 'limesurvey',
            'password' => 'limesurvey-db-local',
            'charset' => 'utf8mb4',
            'tablePrefix' => 'lime_',
        ),
        'urlManager' => array(
            'urlFormat' => 'get',
            'showScriptName' => true,
        ),
    ),
    'config' => array(
        'debug' => 0,
        'debugsql' => 0,
        'defaultuser' => 'admin',
        'siteadminemail' => 'admin@example.invalid',
        'RPCInterface' => 'json',
        'rpc_publish_api' => false,
        'sendadmincreationemail' => false,
    ),
);
