FROM composer:2.2@sha256:60b6b48d46327aa37d3126cf5019aa4b3efc22a2a3d6541f9b47e17d7d09f5ac AS phpmyadmin-dependencies
WORKDIR /build
COPY source/phpmyadmin-4.7.9/composer.json source/phpmyadmin-4.7.9/composer.lock ./
RUN composer install --no-dev --prefer-dist --no-interaction --no-progress --optimize-autoloader --ignore-platform-reqs

FROM php:7.2-apache@sha256:4dc0f0115acf8c2f0df69295ae822e49f5ad5fe849725847f15aa0e5802b55f8
ENV APACHE_DOCUMENT_ROOT=/var/www/html \
    MYSQL_DATADIR=/var/lib/mysql

RUN set -eux; \
    sed -i \
      -e 's#deb.debian.org/debian buster#archive.debian.org/debian buster#' \
      -e 's#security.debian.org/debian-security buster/updates#archive.debian.org/debian-security buster/updates#' \
      -e 's#deb.debian.org/debian buster-updates#archive.debian.org/debian buster-updates#' \
      /etc/apt/sources.list; \
    printf '%s\n' 'Acquire::Check-Valid-Until "false";' 'Acquire::AllowInsecureRepositories "true";' > /etc/apt/apt.conf.d/99archive; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      mariadb-server mariadb-client curl libfreetype6-dev libjpeg62-turbo-dev libpng-dev libzip-dev; \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
    docker-php-ext-install -j"$(nproc)" mysqli gd zip gettext; \
    a2enmod rewrite; \
    printf '%s\n' 'ServerName localhost' > /etc/apache2/conf-available/servername.conf; \
    a2enconf servername; \
    rm -rf /var/lib/apt/lists/*

COPY --from=phpmyadmin-dependencies /build/vendor /var/www/html/vendor
COPY source/phpmyadmin-4.7.9/ /var/www/html/
COPY resources/initial-data/database-seed.sql /usr/local/share/phpmyadmin/database-seed.sql
COPY scripts/entrypoint.sh /usr/local/bin/phpmyadmin-entrypoint.sh

RUN set -eux; \
    printf '%s\n' \
      'upload_max_filesize=64M' \
      'post_max_size=64M' \
      'memory_limit=256M' \
      'session.cookie_httponly=1' \
      > /usr/local/etc/php/conf.d/phpmyadmin.ini; \
    printf '%s\n' \
      '<?php' \
      '$cfg["blowfish_secret"] = "phpMyAdmin-4.7.9-benchmark-secret-32chars";' \
      '$i = 0;' \
      '$i++;' \
      '$cfg["Servers"][$i]["auth_type"] = "cookie";' \
      '$cfg["Servers"][$i]["host"] = "127.0.0.1";' \
      '$cfg["Servers"][$i]["port"] = 3306;' \
      '$cfg["Servers"][$i]["compress"] = false;' \
      '$cfg["Servers"][$i]["AllowNoPassword"] = false;' \
      '$cfg["TempDir"] = "/var/www/html/data/tmp";' \
      '$cfg["UploadDir"] = "/var/www/html/data/upload";' \
      '$cfg["SaveDir"] = "/var/www/html/data/save";' \
      '$cfg["CheckConfigurationPermissions"] = false;' \
      > /var/www/html/config.inc.php; \
    mkdir -p /var/www/html/data/tmp /var/www/html/data/upload /var/www/html/data/save /var/log/mysql; \
    chown -R www-data:www-data /var/www/html; \
    chown -R mysql:mysql /var/lib/mysql /var/log/mysql; \
    chmod +x /usr/local/bin/phpmyadmin-entrypoint.sh; \
    rm -f /var/www/html/setup/config.inc.php

VOLUME ["/var/lib/mysql", "/var/www/html/data"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=12 CMD curl --fail --silent http://127.0.0.1/index.php | grep -qi phpmyadmin
ENTRYPOINT ["/usr/local/bin/phpmyadmin-entrypoint.sh"]
