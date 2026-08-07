# syntax=docker/dockerfile:1.7
FROM php:8.1-apache

ENV DEBIAN_FRONTEND=noninteractive \
    ITOP_DB_NAME=itop \
    ITOP_DB_USER=itop \
    ITOP_DB_PASSWORD=itop-internal-db

RUN apt-get update \
 && apt-get install -y --no-install-recommends mariadb-server mariadb-client graphviz curl ca-certificates libfreetype6-dev libjpeg62-turbo-dev libpng-dev libxml2-dev libzip-dev \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install -j"$(nproc)" gd mysqli soap opcache zip \
 && a2enmod rewrite headers expires \
 && rm -rf /var/lib/apt/lists/*

COPY source/itop/ /var/www/html/
COPY scripts/install.php /tmp/itop-install.php
COPY scripts/entrypoint.sh /usr/local/bin/itop-entrypoint
COPY scripts/healthcheck.sh /usr/local/bin/itop-host-healthcheck

RUN printf '%s\n' 'DirectoryIndex disabled' 'DirectoryIndex pages/UI.php' 'RewriteEngine On' 'RewriteRule ^/?$ /pages/UI.php [END]' '<Directory /var/www/html>' '    AllowOverride All' '    Require all granted' '</Directory>' '<Directory /var/www/html/data>' '    Require all denied' '</Directory>' '<Directory /var/www/html/conf>' '    Require all denied' '</Directory>' > /etc/apache2/conf-available/itop.conf \
 && a2enconf itop \
 && mkdir -p /var/lib/mysql /run/mysqld /var/www/html/data /var/www/html/log \
 && chown -R mysql:mysql /var/lib/mysql /run/mysqld \
 && chown -R www-data:www-data /var/www/html/data /var/www/html/log \
 && chmod +x /usr/local/bin/itop-entrypoint /usr/local/bin/itop-host-healthcheck

RUN --mount=type=secret,id=itop_admin_password,required=true \
    set -e; \
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db >/dev/null; \
    mysqld --user=mysql --datadir=/var/lib/mysql --skip-networking=0 --bind-address=127.0.0.1 --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid >/tmp/itop-mariadb-build.log 2>&1 & \
    db_pid=$!; \
    for attempt in $(seq 1 90); do mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock ping >/dev/null 2>&1 && break; kill -0 "$db_pid" 2>/dev/null || { cat /tmp/itop-mariadb-build.log >&2; exit 1; }; sleep 1; done; \
    mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock ping >/dev/null 2>&1; \
    mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot -e "CREATE DATABASE IF NOT EXISTS itop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; CREATE USER IF NOT EXISTS 'itop'@'localhost' IDENTIFIED BY 'itop-internal-db'; CREATE USER IF NOT EXISTS 'itop'@'127.0.0.1' IDENTIFIED BY 'itop-internal-db'; GRANT ALL PRIVILEGES ON itop.* TO 'itop'@'localhost'; GRANT ALL PRIVILEGES ON itop.* TO 'itop'@'127.0.0.1'; FLUSH PRIVILEGES;"; \
    ITOP_ADMIN_PASSWORD_FILE=/run/secrets/itop_admin_password php /tmp/itop-install.php >/tmp/itop-install.log 2>&1 || { echo 'iTop build-time installation failed' >&2; exit 1; }; \
    kill "$db_pid"; \
    for attempt in $(seq 1 30); do kill -0 "$db_pid" 2>/dev/null || break; sleep 1; done; \
    rm -f /tmp/itop-install.php /tmp/itop-install.log /tmp/itop-mariadb-build.log \
 && rm -rf /var/www/html/.git /var/www/html/tests /var/www/html/.idea /var/www/html/.github \
 && chown -R www-data:www-data /var/www/html \
 && chown -R mysql:mysql /var/lib/mysql /run/mysqld \
 && chmod 0440 /var/www/html/conf/production/config-itop.php

VOLUME ["/var/lib/mysql", "/var/www/html/data"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=45s --retries=12 CMD curl -fsS http://127.0.0.1/pages/UI.php | grep -Eiq 'iTop|IT Operations Portal|login' || exit 1
ENTRYPOINT ["/usr/local/bin/itop-entrypoint"]
