<?php
return [
    'language' => 'en',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
            'keyPrefix' => 'dp2',
        ],
    ],
    'modules' => [
        'core' => [
            'serverName' => getenv('DP2_SERVER_NAME') ?: '127.0.0.1',
            'serverPort' => intval(getenv('DP2_SERVER_PORT') ?: 18818),
        ],
    ],
];
