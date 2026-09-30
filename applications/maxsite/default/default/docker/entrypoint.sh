#!/usr/bin/env bash
set -euo pipefail

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME:-maxsite}"
DB_USER="${DB_USER:-maxsite}"
DB_PASS="${DB_PASS:-benchmark-only}"
ADMIN_USERNAME="${ADMIN_USERNAME:-admin}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"
ADMIN_EMAIL="${ADMIN_EMAIL:-admin@example.com}"
SITE_NAME="${SITE_NAME:-MaxSite CMS}"
SECRET_KEY="${SECRET_KEY:-MaxSiteSecretKey2026Benchmark!}"

MYSQLADMIN_CMD="mysqladmin --skip-ssl"
MYSQL_CMD="mysql --skip-ssl"

echo "=== Waiting for database connection at ${DB_HOST}:${DB_PORT}... ==="
MAX_TRIES=60
COUNT=0
while ! ${MYSQLADMIN_CMD} ping -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" --silent; do
    COUNT=$((COUNT + 1))
    if [ $COUNT -ge $MAX_TRIES ]; then
        echo "ERROR: Database unreachable after ${MAX_TRIES} attempts."
        exit 1
    fi
    sleep 1
done
echo "Database is reachable."

# Ensure cache and uploads directories exist with proper permissions
mkdir -p /var/www/html/application/cache/db /var/www/html/uploads

# Configure mso_config.php if not present
if [ ! -f /var/www/html/application/maxsite/mso_config.php ]; then
    echo "Creating application/maxsite/mso_config.php..."
    sed "s/\\\$MSO->config\['secret_key'\] = '';/\\\$MSO->config['secret_key'] = '${SECRET_KEY}';/" \
        /var/www/html/application/maxsite/mso_config.php-distr > /var/www/html/application/maxsite/mso_config.php
fi

# Configure database.php if not present
if [ ! -f /var/www/html/application/config/database.php ]; then
    echo "Creating application/config/database.php..."
    sed -e "s/\\\$db\['default'\]\['hostname'\] = 'localhost';/\\\$db['default']['hostname'] = '${DB_HOST}';/" \
        -e "s/\\\$db\['default'\]\['username'\] = '';/\\\$db['default']['username'] = '${DB_USER}';/" \
        -e "s/\\\$db\['default'\]\['password'\] = '';/\\\$db['default']['password'] = '${DB_PASS}';/" \
        -e "s/\\\$db\['default'\]\['database'\] = '';/\\\$db['default']['database'] = '${DB_NAME}';/" \
        -e "s/\\\$db\['default'\]\['dbprefix'\] = 'mso_';/\\\$db['default']['dbprefix'] = 'mso_';/" \
        /var/www/html/application/config/database.php-distr > /var/www/html/application/config/database.php
fi

# Configure .htaccess if not present
if [ ! -f /var/www/html/.htaccess ]; then
    echo "Creating .htaccess..."
    cat <<'EOF' > /var/www/html/.htaccess
Options +FollowSymLinks
Options -Indexes
DirectoryIndex index.php index.html
AddDefaultCharset UTF-8

<IfModule mod_rewrite.c>
RewriteEngine on
RewriteBase /
RewriteCond $1 !^(index\.php|uploads|robots\.txt|favicon\.ico)
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ /index.php/$1 [L,QSA]
</IfModule>
EOF
fi

# Configure robots.txt if not present
if [ ! -f /var/www/html/robots.txt ]; then
    cat <<'EOF' > /var/www/html/robots.txt
User-agent: *
Disallow: /application/
Disallow: /system/
Disallow: /install/
Disallow: /admin/
EOF
fi

# Check if tables exist in the database
TABLE_EXISTS=$(${MYSQL_CMD} -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" -e "SHOW TABLES LIKE 'mso_users';" -s -N 2>/dev/null || true)

if [ -z "$TABLE_EXISTS" ]; then
    echo "=== Initializing MaxSite CMS Database Schema ==="
    
    # Calculate password hash: strrev(md5(password . secret_key))
    PASS_HASH=$(php -r 'echo strrev(md5($argv[1] . $argv[2]));' "${ADMIN_PASSWORD}" "${SECRET_KEY}")

    # Process and import model.sql.txt
    php -r '
    $sql_file = "/var/www/html/install/installer/distr/model.sql.txt";
    $content = file_get_contents($sql_file);
    $sqls = explode("###", $content);
    
    $prefix = "mso_";
    $username = $argv[1];
    $password_hash = $argv[2];
    $email = $argv[3];
    $sitename = $argv[4];
    $ip = "127.0.0.1";
    
    $mysqli = new mysqli($argv[5], $argv[6], $argv[7], $argv[8], (int)$argv[9]);
    if ($mysqli->connect_error) {
        fwrite(STDERR, "Database connection failed: " . $mysqli->connect_error . "\n");
        exit(1);
    }
    $mysqli->set_charset("utf8");
    
    foreach ($sqls as $sql) {
        $sql = trim($sql);
        if (!$sql) continue;
        
        $sql = str_replace("_PREFIX_", $prefix, $sql);
        $sql = str_replace("_USERNAME_", $mysqli->real_escape_string($username), $sql);
        $sql = str_replace("_USERPASSWORD_", $mysqli->real_escape_string($password_hash), $sql);
        $sql = str_replace("_USEREMAIL_", $mysqli->real_escape_string($email), $sql);
        $sql = str_replace("_SITENAME_", $mysqli->real_escape_string($sitename), $sql);
        $sql = str_replace("_IP_", $ip, $sql);
        $sql = str_replace("_TEXT1_", $mysqli->real_escape_string("Entries for the blog"), $sql);
        $sql = str_replace("_TEXT2_", $mysqli->real_escape_string("Static page"), $sql);
        $sql = str_replace("_TEXT3_", $mysqli->real_escape_string("News"), $sql);
        $sql = str_replace("_TEXT4_", $mysqli->real_escape_string("News of the project"), $sql);
        $sql = str_replace("_TEXT5_", $mysqli->real_escape_string("Hello World!"), $sql);
        $sql = str_replace("_TEXT6_", $mysqli->real_escape_string("This is your first post. You can edit or delete it via the admin panel."), $sql);
        $sql = str_replace("_TEXT7_", $mysqli->real_escape_string("About the site"), $sql);
        $sql = str_replace("_TEXT8_", $mysqli->real_escape_string("On this page you can write about your site."), $sql);
        
        if (!$mysqli->query($sql)) {
            fwrite(STDERR, "Query error: " . $mysqli->error . "\nSQL: " . substr($sql, 0, 100) . "\n");
        }
    }
    $mysqli->close();
    ' "${ADMIN_USERNAME}" "${PASS_HASH}" "${ADMIN_EMAIL}" "${SITE_NAME}" "${DB_HOST}" "${DB_USER}" "${DB_PASS}" "${DB_NAME}" "${DB_PORT}"

    echo "Database schema initialized and admin user created."
fi

# Ensure correct permissions
chown -R www-data:www-data /var/www/html/application/cache /var/www/html/uploads
chmod -R 775 /var/www/html/application/cache /var/www/html/uploads

echo "=== Starting Apache Web Server ==="
exec "$@"
