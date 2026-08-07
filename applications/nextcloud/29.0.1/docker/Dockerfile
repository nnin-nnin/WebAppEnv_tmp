# syntax=docker/dockerfile:1.7
FROM php:8.2-apache AS nextcloud

ENV DEBIAN_FRONTEND=noninteractive \
    APACHE_DOCUMENT_ROOT=/var/www/html \
    NEXTCLOUD_DB_PASSWORD=nc-local-db-29-0-1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates curl grep mariadb-client mariadb-server \
        libavif-dev libcurl4-openssl-dev libfreetype6-dev libicu-dev \
        libjpeg62-turbo-dev libmagickwand-dev libonig-dev libpng-dev \
        libwebp-dev libxml2-dev libzip-dev \
    && docker-php-ext-configure gd --with-avif --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j"$(nproc)" bcmath exif gd intl mbstring mysqli opcache pdo_mysql xml zip \
    && pecl install imagick \
    && docker-php-ext-enable imagick opcache \
    && a2enmod headers rewrite env dir mime setenvif \
    && rm -rf /var/lib/apt/lists/*

COPY source/nextcloud/ /var/www/html/
COPY scripts/entrypoint.sh /usr/local/bin/nextcloud-entrypoint.sh
COPY scripts/image-init.sh /usr/local/bin/nextcloud-image-init.sh

RUN --mount=type=secret,id=admin_password \
    chmod 0755 /usr/local/bin/nextcloud-entrypoint.sh /usr/local/bin/nextcloud-image-init.sh /var/www/html/occ \
    && /usr/local/bin/nextcloud-image-init.sh \
    && rm -f /usr/local/bin/nextcloud-image-init.sh

VOLUME ["/var/www/html/data", "/var/lib/mysql"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=12 CMD curl --fail --silent http://127.0.0.1/status.php | grep -q '\"installed\":true'
ENTRYPOINT ["/usr/local/bin/nextcloud-entrypoint.sh"]
