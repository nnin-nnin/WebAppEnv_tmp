#!/bin/bash
set -e

# Ensure local dir exists
if [ ! -d /config/www/local ]; then
    cp -r /app/www/public/local /config/www/local
fi

mkdir -p /config/www/local/config

# Create database.inc.php
cat << 'EOF' > /config/www/local/config/database.inc.php
<?php
$conf['dblayer'] = 'mysqli';
$conf['db_base'] = 'piwigo';
$conf['db_user'] = 'piwigo';
$conf['db_password'] = 'piwigopass';
$conf['db_host'] = 'db';

$prefixeTable = 'piwigo_';

define('PHPWG_INSTALLED', true);
define('PWG_CHARSET', 'utf-8');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
?>
EOF

chown -R abc:abc /config/www/local
