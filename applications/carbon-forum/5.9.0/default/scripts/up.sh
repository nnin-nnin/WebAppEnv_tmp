#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting Carbon Forum with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

HOST_PORT="${HOST_PORT:-18583}"
BASE_URL="http://localhost:${HOST_PORT}"

echo "Waiting for Carbon Forum container to become ready..."
CONTAINER_ID=""
for i in $(seq 1 30); do
    CONTAINER_ID=$(docker compose -f docker/compose.yaml ps -q web 2>/dev/null || true)
    if [ -n "$CONTAINER_ID" ]; then
        if docker exec "$CONTAINER_ID" mysql -uroot -pkf_kf_kf -e "SELECT 1;" >/dev/null 2>&1; then
            break
        fi
    fi
    sleep 1
done

if [ -z "$CONTAINER_ID" ]; then
    echo "ERROR: Container failed to start"
    exit 1
fi

# Ensure php5-fpm and nginx are actively running
docker exec "$CONTAINER_ID" service php5-fpm status >/dev/null 2>&1 || docker exec "$CONTAINER_ID" service php5-fpm start >/dev/null 2>&1
docker exec "$CONTAINER_ID" service nginx status >/dev/null 2>&1 || docker exec "$CONTAINER_ID" service nginx start >/dev/null 2>&1

# Initialize Carbon Forum if config.php does not exist
if ! docker exec "$CONTAINER_ID" test -f /var/www/carbon_forum/config.php; then
    echo "Initializing database and configuration..."
    TABLE_COUNT=$(docker exec "$CONTAINER_ID" mysql -uroot -pkf_kf_kf -N -s -e "SELECT count(*) FROM information_schema.tables WHERE table_schema='knowledge';" 2>/dev/null || echo "0")
    if [ "$TABLE_COUNT" -eq 0 ]; then
        docker exec "$CONTAINER_ID" mysql -uroot -pkf_kf_kf knowledge -e "source /var/www/carbon_forum/install/database.sql;"
        docker exec "$CONTAINER_ID" mysql -uroot -pkf_kf_kf knowledge -e "
            INSERT INTO carbon_config VALUES ('WebsitePath', '');
            INSERT INTO carbon_config VALUES ('LoadJqueryUrl', '/static/js/jquery.js');
            UPDATE carbon_config SET ConfigValue='$(date +%Y-%m-%d)' WHERE ConfigName='DaysDate';
            UPDATE carbon_config SET ConfigValue='5.9.0' WHERE ConfigName='Version';
        "
    fi

    docker exec "$CONTAINER_ID" bash -c "cat << 'EOF' > /var/www/carbon_forum/config.php
<?php
date_default_timezone_set('Asia/Shanghai');
define('DEBUG_MODE', true);
define('SALT', 'AuthorIsLinCanbin');
define('PREFIX', 'carbon_');
define('InternalAccess', true);
define('ForumLanguage', 'zh-cn');
define('EnableMemcache', false);
define('MemCacheHost', 'localhost');
define('MemCachePort', 11211);
define('MemCachePrefix', 'carbon_');
define('DBHost', 'localhost');
define('DBPort', '3306');
define('DBName', 'knowledge');
define('DBUser', 'klg_u');
define('DBPassword', 'magic*docker');
define('SearchServer', '');
define('SearchPort', '');
define('LanguagePath', __DIR__ . '/language/' . ForumLanguage . '/');
define('LibraryPath', __DIR__ . '/library/');
define('ServicePath', __DIR__ . '/service/');
\$APISignature = array();
\$APISignature['12450'] = 'b40484df0ad979d8ba7708d24c301c38';
if (DEBUG_MODE) {
    error_reporting(E_ALL);
    ini_set('display_errors', 'On');
} else {
    ini_set('display_errors', 'Off');
}
EOF"
    docker exec "$CONTAINER_ID" chown www-data:www-data /var/www/carbon_forum/config.php
    docker exec "$CONTAINER_ID" touch /var/www/carbon_forum/install/install.lock
    docker exec "$CONTAINER_ID" touch /var/www/carbon_forum/update/update.lock

    ADMIN_USER="${ADMIN_USERNAME:-${ADMIN_USER:-admin}}"
    ADMIN_PASS="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"
    docker exec "$CONTAINER_ID" mysql -uroot -pkf_kf_kf knowledge -e "
        INSERT INTO carbon_users 
        (ID, UserName, Salt, Password, UserMail, UserRoleID, UserAccountStatus, UserRegTime, LastLoginTime, LastPostTime, Birthday)
        VALUES
        (1, '${ADMIN_USER}', '123456', MD5(CONCAT(MD5('${ADMIN_PASS}'), '123456')), 'admin@example.com', 5, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), '2000-01-01')
        ON DUPLICATE KEY UPDATE Password=MD5(CONCAT(MD5('${ADMIN_PASS}'), '123456'));
        UPDATE carbon_config SET ConfigValue = '1' WHERE ConfigName = 'NumUsers';
    "
    echo "Initialization completed."
fi

# Wait for HTTP service response
for i in $(seq 1 30); do
    if curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/" | grep -qE "^(200|301|302)$"; then
        echo "Carbon Forum is up and responding!"
        exit 0
    fi
    sleep 1
done

echo "Carbon Forum started."
