<?php
return [
    'class' => 'yii\db\Connection',
    'dsn' => 'mysql:host=' . (getenv('DB_HOST') ?: 'db') . ';dbname=' . (getenv('DB_NAME') ?: 'dotplant2'),
    'username' => getenv('DB_USER') ?: 'dotplant2',
    'password' => getenv('DB_PASSWORD') ?: 'dotplant2password',
    'charset' => 'utf8',
    'enableSchemaCache' => false,
];
