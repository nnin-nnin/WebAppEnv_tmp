# syntax=docker/dockerfile:1.7

FROM php:8.2.20-apache-bookworm AS base

ENV DEBIAN_FRONTEND=noninteractive \
    APACHE_DOCUMENT_ROOT=/var/www/html/htdocs

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       mariadb-server mariadb-client ca-certificates curl \
       libicu-dev libzip-dev libpng-dev libjpeg62-turbo-dev libfreetype6-dev \
       libxml2-dev libonig-dev libcurl4-openssl-dev libldap2-dev libssl-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j2 calendar curl gd intl mbstring mysqli pdo_mysql soap xml zip \
    && a2enmod rewrite headers expires \
    && rm -rf /var/lib/apt/lists/*

FROM base AS builder

ENV DOLIBARR_DB_NAME=dolibarr \
    DOLIBARR_DB_USER=dolibarr \
    DOLIBARR_DB_PASSWORD=dolibarr-internal-db-23

COPY source/dolibarr-23.0.3/ /var/www/html/
WORKDIR /var/www/html/htdocs/install

# Generate the application configuration without embedding the controlled
# administrator password. The database credential is an internal container
# credential and is not the application administrator credential.
RUN --mount=type=secret,id=admin_password,required=true <<'BUILD'
set -eu
mkdir -p /var/www/html/htdocs/conf /var/www/html/documents /run/mysqld /var/lib/mysql
printf '%s\n' \
   '<?php' \
   '$dolibarr_main_url_root="http://localhost";' \
   '$dolibarr_main_document_root="/var/www/html/htdocs";' \
   '$dolibarr_main_data_root="/var/www/html/documents";' \
   '$dolibarr_main_db_host="127.0.0.1";' \
   '$dolibarr_main_db_port="3306";' \
   '$dolibarr_main_db_name="dolibarr";' \
   '$dolibarr_main_db_user="dolibarr";' \
   '$dolibarr_main_db_pass="dolibarr-internal-db-23";' \
   '$dolibarr_main_db_type="mysqli";' \
   '$dolibarr_main_db_character_set="utf8mb4";' \
   '$dolibarr_main_db_collation="utf8mb4_unicode_ci";' \
   '$dolibarr_main_db_prefix="llx_";' \
   '$dolibarr_main_authentication="dolibarr";' \
   '$dolibarr_main_instance_unique_id="dolibarr-23-0-3-all-in-one";' \
   > /var/www/html/htdocs/conf/conf.php
chmod 0444 /var/www/html/htdocs/conf/conf.php
mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db >/dev/null
chown -R mysql:mysql /var/lib/mysql /run/mysqld
mariadbd --user=mysql --datadir=/var/lib/mysql --bind-address=127.0.0.1 \
   --skip-networking=0 --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid \
   --log-error=/tmp/mariadb-build.log &
db_pid=$!
for _ in $(seq 1 120); do
  if mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot ping >/dev/null 2>&1; then
    break
  fi
  kill -0 "$db_pid" 2>/dev/null || { echo 'MariaDB build initialization failed' >&2; tail -40 /tmp/mariadb-build.log >&2 || true; exit 1; }
  sleep 1
done
mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot ping >/dev/null 2>&1 || { echo 'MariaDB did not become ready during build' >&2; exit 1; }
mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot <<'SQL'
CREATE DATABASE IF NOT EXISTS `dolibarr` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'dolibarr'@'localhost' IDENTIFIED BY 'dolibarr-internal-db-23';
CREATE USER IF NOT EXISTS 'dolibarr'@'127.0.0.1' IDENTIFIED BY 'dolibarr-internal-db-23';
GRANT ALL PRIVILEGES ON `dolibarr`.* TO 'dolibarr'@'localhost';
GRANT ALL PRIVILEGES ON `dolibarr`.* TO 'dolibarr'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL
php -d memory_limit=512M step2.php set auto >/tmp/dolibarr-step2.log 2>&1
admin_password="$(cat /run/secrets/admin_password)"
php -d memory_limit=512M step5.php '' '' auto set admin "$admin_password" "$admin_password" 1 >/tmp/dolibarr-step5.log 2>&1
mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot dolibarr <<'SQL'
DELETE FROM llx_const WHERE name IN ('MAIN_INFO_SOCIETE_NOM', 'MAIN_INFO_SOCIETE_COUNTRY', 'MAIN_MIN_NB_ENABLED_MODULE_FOR_WARNING');
INSERT INTO llx_const(name, entity, value, type, visible, note) VALUES
  ('MAIN_INFO_SOCIETE_NOM', 1, 'Dolibarr', 'chaine', 1, 'Initial all-in-one environment'),
  ('MAIN_INFO_SOCIETE_COUNTRY', 1, '1', 'chaine', 1, 'Initial all-in-one environment'),
  ('MAIN_MIN_NB_ENABLED_MODULE_FOR_WARNING', 1, '0', 'chaine', 1, 'Initial all-in-one environment');
SQL
test "$(mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot dolibarr -Nse 'SELECT COUNT(*) FROM llx_user WHERE login="admin" AND admin=1 AND statut=1')" = 1
mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot shutdown >/dev/null
wait "$db_pid" 2>/dev/null || true
BUILD

RUN mkdir -p /opt/dolibarr-seed/mysql /opt/dolibarr-seed/documents \
    && cp -a /var/lib/mysql/. /opt/dolibarr-seed/mysql/ \
    && cp -a /var/www/html/documents/. /opt/dolibarr-seed/documents/ \
    && rm -rf /var/www/html/.git /var/www/html/.github /var/www/html/test /var/www/html/dev \
    && chown -R www-data:www-data /var/www/html/documents \
    && chmod -R ug+rwX /var/www/html/documents \
    && chmod 0444 /var/www/html/htdocs/conf/conf.php

FROM base

RUN printf '%s\n' \
       '<Directory /var/www/html/htdocs>' \
       '    AllowOverride All' \
       '    Require all granted' \
       '</Directory>' \
       > /etc/apache2/conf-available/dolibarr.conf \
    && a2enconf dolibarr \
    && sed -ri 's!^[[:space:]]*DocumentRoot .*!\tDocumentRoot /var/www/html/htdocs!' /etc/apache2/sites-available/000-default.conf

COPY --from=builder /var/www/html/ /var/www/html/
COPY --from=builder /opt/dolibarr-seed/ /opt/dolibarr-seed/
COPY --from=builder /var/lib/mysql/ /var/lib/mysql/
COPY scripts/entrypoint.sh /usr/local/bin/dolibarr-entrypoint
COPY scripts/healthcheck.sh /usr/local/bin/dolibarr-healthcheck

RUN chmod +x /usr/local/bin/dolibarr-entrypoint /usr/local/bin/dolibarr-healthcheck \
    && mkdir -p /run/mysqld /var/log/mysql \
    && chown -R mysql:mysql /var/lib/mysql /run/mysqld /var/log/mysql \
    && chown -R www-data:www-data /var/www/html/documents \
    && chmod 0444 /var/www/html/htdocs/conf/conf.php

VOLUME ["/var/lib/mysql", "/var/www/html/documents"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=12 CMD /usr/local/bin/dolibarr-healthcheck
ENTRYPOINT ["/usr/local/bin/dolibarr-entrypoint"]
