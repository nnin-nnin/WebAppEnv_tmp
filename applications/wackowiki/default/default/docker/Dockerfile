FROM php:8.2-apache

# Install required system packages, MariaDB client and PHP extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libicu-dev \
        mariadb-client \
        git \
        curl \
        ca-certificates \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        gd \
        mysqli \
        pdo_mysql \
        intl \
        bcmath \
    && a2enmod rewrite headers \
    && sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure PHP settings (disable opcache for ARM64 emulation safety, set upload limits)
RUN { \
    echo 'opcache.enable=0'; \
    echo 'opcache.enable_cli=0'; \
    echo 'upload_max_filesize=64M'; \
    echo 'post_max_size=64M'; \
    echo 'memory_limit=256M'; \
    echo 'date.timezone=UTC'; \
} > /usr/local/etc/php/conf.d/99-wackowiki.ini

# Fetch WackoWiki 6.1.29 source code
RUN git clone --depth 1 --branch 6.1.29 https://github.com/WackoWiki/wackowiki.git /tmp/wackowiki \
    && cp -a /tmp/wackowiki/src/. /var/www/html/ \
    && rm -rf /tmp/wackowiki /var/www/html/.git

WORKDIR /var/www/html

# Pre-place configuration
COPY docker/config.php /var/www/html/config/config.php

# Entrypoint script
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Ensure writable directories exist with correct permissions
RUN mkdir -p /var/www/html/_cache/config \
             /var/www/html/_cache/page \
             /var/www/html/_cache/query \
             /var/www/html/_cache/session \
             /var/www/html/_cache/template \
             /var/www/html/file/global \
             /var/www/html/file/per_page \
             /var/www/html/file/backup \
             /var/www/html/file/xml \
    && touch /var/www/html/config/lock \
             /var/www/html/config/lock_ap \
             /var/www/html/config/lock_setup \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 775 /var/www/html/_cache /var/www/html/file /var/www/html/config

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
