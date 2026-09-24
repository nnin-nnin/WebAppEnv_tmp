#!/bin/bash
set -e

# Setup symlink for persistence
if [ ! -f /var/www/html/includes/config.inc.php ]; then
    if [ -f /var/www/html/uploaded/config.inc.php ]; then
        echo "Restoring persistent config..."
        ln -sf /var/www/html/uploaded/config.inc.php /var/www/html/includes/config.inc.php
    fi
fi

if [ ! -f /var/www/html/includes/config.inc.php ]; then
    echo "First run detected, preparing WeBid installation..."
    
    (
        until curl -s http://127.0.0.1/ > /dev/null; do
            sleep 1
        done
        
        echo "Apache is up, running WeBid installer..."

        echo "Waiting for database connectivity..."
        until php -r '$dsn = "mysql:host=" . (getenv("DB_HOST") ?: "db") . ";dbname=" . (getenv("MYSQL_DATABASE") ?: "webid"); try { new PDO($dsn, getenv("MYSQL_USER") ?: "webid", getenv("MYSQL_PASSWORD") ?: "webidpassword"); exit(0); } catch (Exception $e) { exit(1); }'; do
            sleep 2
        done
        
        curl -fsS -X POST \
            -d "DBHost=${DB_HOST:-db}" \
            -d "DBUser=${MYSQL_USER:-webid}" \
            -d "DBPass=${MYSQL_PASSWORD:-webidpassword}" \
            -d "DBName=${MYSQL_DATABASE:-webid}" \
            -d "DBPrefix=webid_" \
            -d "mainpath=/var/www/html/" \
            -d "URL=${APP_URL:-http://127.0.0.1:18086/}" \
            -d "EMail=${ADMIN_EMAIL:-admin@example.com}" \
            -d "importcats=1" \
            "http://127.0.0.1/install/install.php?step=1&silent=1"

        if [ ! -f /var/www/html/includes/config.inc.php ]; then
            echo "WeBid installer did not create config.inc.php"
            exit 1
        fi

        curl -fsS "http://127.0.0.1/install/install.php?step=2&URL=$(echo ${APP_URL:-http://127.0.0.1:18086/}|sed 's/\//%2F/g'|sed 's/:/%3A/g')&EMail=${ADMIN_EMAIL:-admin@example.com}&cats=1&silent=1"
        
        rm -rf /var/www/html/install

        curl -s -X POST \
            -d "action=insert" \
            -d "username=${ADMIN_USERNAME:-admin}" \
            -d "password=${ADMIN_PASSWORD:-password123}" \
            -d "repeat_password=${ADMIN_PASSWORD:-password123}" \
            "http://127.0.0.1/admin/login.php"
            
        echo "WeBid installation completed."
        
        mv /var/www/html/includes/config.inc.php /var/www/html/uploaded/config.inc.php
        ln -sf /var/www/html/uploaded/config.inc.php /var/www/html/includes/config.inc.php
        
    ) &
else
    echo "WeBid is already installed."
    if [ -d /var/www/html/install ]; then
        rm -rf /var/www/html/install
    fi
fi

exec docker-php-entrypoint "$@"
