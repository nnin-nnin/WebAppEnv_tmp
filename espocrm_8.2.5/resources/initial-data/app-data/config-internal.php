<?php
return [
  'database' => [
    'host' => 'db',
    'port' => '3306',
    'charset' => NULL,
    'dbname' => 'espocrmdb',
    'user' => 'dbadmin',
    'password' => 'benchmark-only',
    'platform' => 'Mysql'
  ],
  'smtpPassword' => NULL,
  'logger' => [
    'path' => 'data/logs/espo.log',
    'level' => 'WARNING',
    'rotation' => true,
    'maxFileNumber' => 30,
    'printTrace' => false
  ],
  'restrictedMode' => false,
  'webSocketMessager' => 'ZeroMQ',
  'clientSecurityHeadersDisabled' => false,
  'clientCspDisabled' => false,
  'clientCspScriptSourceList' => [
    0 => 'https://maps.googleapis.com'
  ],
  'adminUpgradeDisabled' => false,
  'isInstalled' => true,
  'microtimeInternal' => 1785295905.763903,
  'passwordSalt' => 'e47ec7553d39bf61',
  'cryptKey' => 'ea4a3e296442514be6db6cc8352c8c0f',
  'hashSecretKey' => 'be71dfa3b6507f484af8e96249f2e53e',
  'defaultPermissions' => [
    'user' => 33,
    'group' => 33
  ],
  'actualDatabaseType' => 'mariadb',
  'actualDatabaseVersion' => '10.6.27',
  'instanceId' => '4f4b4bd4-9fba-4763-b3a7-ec5b3171b332'
];
