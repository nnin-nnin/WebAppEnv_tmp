FROM php:8.2-apache

ARG APP_VERSION=4.0.2-3

ENV APACHE_DOCUMENT_ROOT=/var/www/html \
    DEBIAN_FRONTEND=noninteractive \
    MYSQL_DATADIR=/var/lib/mysql

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        libcurl4-openssl-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libonig-dev \
        libpng-dev \
        libwebp-dev \
        libzip-dev \
        mariadb-client \
        mariadb-server \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j"$(nproc)" curl gd mbstring mysqli zip \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

COPY source/opencart/upload/ /var/www/html/
COPY scripts/build-initialize.sh /usr/local/sbin/opencart-build-initialize.sh
COPY scripts/entrypoint.sh /usr/local/sbin/opencart-entrypoint.sh

RUN --mount=type=secret,id=opencart_admin_password \
    chmod 0755 /usr/local/sbin/opencart-build-initialize.sh /usr/local/sbin/opencart-entrypoint.sh \
    && /usr/local/sbin/opencart-build-initialize.sh \
    && rm -f /usr/local/sbin/opencart-build-initialize.sh \
    && rm -rf /var/www/html/install \
    && cp -a /var/lib/mysql /opt/opencart-db-seed \
    && chown -R mysql:mysql /var/lib/mysql /opt/opencart-db-seed \
    && find /var/lib/mysql -maxdepth 1 -type f -name '*.pid' -delete \
    && find /var/lib/mysql -maxdepth 1 -type s -delete \
    && chown -R www-data:www-data /var/www/html/system/storage /var/www/html/image \
    && chmod 0644 /var/www/html/config.php /var/www/html/admin/config.php

WORKDIR /var/www/html

HEALTHCHECK --interval=10s --timeout=5s --start-period=40s --retries=12 \
    CMD curl -fsS --max-time 4 http://127.0.0.1/ | grep -Eiq 'OpenCart|Your Store|Shopping Cart' \
        && mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock ping >/dev/null 2>&1

EXPOSE 80

ENTRYPOINT ["/usr/local/sbin/opencart-entrypoint.sh"]
