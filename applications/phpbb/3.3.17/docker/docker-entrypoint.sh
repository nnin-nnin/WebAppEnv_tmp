#!/bin/bash
set -e

if [ "$1" = 'apache2-foreground' ]; then
    if [ ! -f /var/www/html/config.php ] || ! grep -q "table_prefix" /var/www/html/config.php; then
        echo "Waiting for database..."
        until php -r "try { new PDO('mysql:host=db;dbname=' . getenv('DB_NAME'), getenv('DB_USER'), getenv('DB_PASS')); exit(0); } catch(Exception \$e) { exit(1); }" 2>/dev/null; do
            sleep 2
        done

        echo "Installing phpBB..."
        cat <<EOF > /tmp/install_config.yml
installer:
    admin:
        name: admin
        password: ${ADMIN_PASSWORD}
        email: admin@example.com
    board:
        lang: en
        name: My Board
        description: My amazing new phpBB board
    server:
        server_name: localhost
        server_port: 38080
        server_protocol: http://
        script_path: /
    database:
        dbms: mysqli
        dbhost: db
        dbport: 3306
        dbname: ${DB_NAME}
        dbuser: ${DB_USER}
        dbpasswd: ${DB_PASS}
        table_prefix: phpbb_
EOF
        rm -f /var/www/html/config.php
        php /var/www/html/install/phpbbcli.php install /tmp/install_config.yml
        rm -rf /var/www/html/install
        rm -f /tmp/install_config.yml
        echo "Installation complete."
    fi
fi
chown -R www-data:www-data /var/www/html
exec "$@"
