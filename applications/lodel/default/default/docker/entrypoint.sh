#!/bin/bash
set -e

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_USER="${DB_USER:-lodel}"
DB_PASS="${DB_PASS:-lodelpassword}"
DB_NAME="${DB_NAME:-lodel}"

# Disable default client SSL requirement for mariadb client
mkdir -p /etc/mysql/conf.d
cat <<'EOF' > /etc/mysql/conf.d/disable-ssl.cnf
[client]
ssl=0
EOF

echo "Waiting for database connection at ${DB_HOST}:${DB_PORT}..."
for i in $(seq 1 60); do
    if mariadb --skip-ssl -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" -e "SELECT 1;" >/dev/null 2>&1; then
        echo "Database connection established."
        break
    fi
    sleep 2
done

# Ensure database schema exists (self-healing if volume was pre-existing)
if ! mariadb --skip-ssl -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" -e "SELECT 1 FROM users LIMIT 1;" >/dev/null 2>&1; then
    if [ -f /usr/local/share/lodel/init.sql ]; then
        echo "Importing database schema and seed data from init.sql..."
        mariadb --skip-ssl -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" < /usr/local/share/lodel/init.sql
    fi
fi

# Ensure lodelconfig.php is present
if [ ! -f /var/www/html/lodelconfig.php ]; then
    echo "Generating /var/www/html/lodelconfig.php..."
    cat <<'EOF' > /var/www/html/lodelconfig.php
<?php
/**
 * LODEL configuration for container deployment
 */

$cfg['install_key'] = 'benchmark-lodel-installed';

// Database parameters
$cfg['database'] = getenv('DB_NAME') ?: 'lodel';
$cfg['dbusername'] = getenv('DB_USER') ?: 'lodel';
$cfg['dbpasswd'] = getenv('DB_PASS') ?: 'lodelpassword';
$cfg['dbhost'] = getenv('DB_HOST') ?: 'db';
$cfg['dbDriver'] = 'mysqli';

$cfg['valid_db_charset'] = array('utf8', 'utf8mb3', 'utf8mb4');

$cfg['timezone'] = 'UTC';
$cfg['locale'] = 'C.UTF-8';

$cfg['pathroot'] = '.';
$cfg['urlroot'] = '/';
$cfg['home'] = 'lodel/scripts/';
$cfg['importdir'] = '';

$cfg['timeout'] = 120 * 60;
$cfg['cookietimeout'] = 4 * 3600;

$cfg['cacheOptions'] = array(
    'driver' => 'file',
    'prefix' => 'lodel',
    'cache_dir' => sys_get_temp_dir(),
    'default_expire' => 3600,
);

$cfg['cacheDir'] = sys_get_temp_dir();
$cfg['version'] = '1.0';
$cfg['revision'] = '443X';
$cfg['shareurl'] = '/share';
$cfg['sharedir'] = 'share';
$cfg['contactbug'] = '';
$cfg['mysqldir'] = '/usr/bin';
$cfg['singledatabase'] = 'on';
$cfg['tableprefix'] = '';
$cfg['sessionname'] = 'session' . $cfg['database'];
$cfg['detectlanguage'] = true;
$cfg['extensionscripts'] = 'php';
define('URI', 'id');
define('DONTUSELOCKTABLES', false);
$cfg['db_no_intrusion'] = array();

$cfg['chooseoptions'] = 'oui';
$cfg['includepath'] = '';
$cfg['htaccess'] = 'off';
$cfg['filemask'] = 0755;
$cfg['usesymlink'] = 'oui';
$cfg['installoption'] = '2';
$cfg['installlang'] = 'fr';

$GLOBALS['cacheOptions'] = $cfg['cacheOptions'];
$cfg['debugMode'] = 0;
$cfg['showPubErrMsg'] = false;
$cfg['dieOnErr'] = false;
date_default_timezone_set($cfg['timezone']);
ignore_user_abort();

$currentdb = '';
$cfg['currentdb'] = '';
$GLOBALS['currentdb'] = $cfg['currentdb'];

define('NORECORDURL', 1);
define('INC_LODELCONFIG', 1);
EOF
fi

chown -R www-data:www-data /var/www/html

exec "$@"
