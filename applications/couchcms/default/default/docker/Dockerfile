FROM php:8.2-apache

# Install required system packages and PHP extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libzip-dev \
        unzip \
        git \
        curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        mysqli \
        pdo \
        pdo_mysql \
        gd \
        zip \
        opcache \
    && a2enmod rewrite \
    && rm -f /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini \
    && echo "opcache.enable=0\nopcache.enable_cli=0" > /usr/local/etc/php/conf.d/docker-php-ext-opcache-disable.ini \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Apache configuration
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Fetch CouchCMS fixed commit
RUN git clone https://github.com/CouchCMS/CouchCMS.git /tmp/couchcms \
    && cd /tmp/couchcms \
    && git checkout 60484485752b04346a49a1ed370f784eb45d5ede \
    && mkdir -p /var/www/html/couch \
    && cp -a /tmp/couchcms/couch/. /var/www/html/couch/ \
    && rm -rf /tmp/couchcms

WORKDIR /var/www/html

# Copy config and default index.php
COPY config.php /var/www/html/couch/config.php
COPY index.php /var/www/html/index.php

# Create upload & cache directories and set permissions
RUN mkdir -p /var/www/html/couch/uploads /var/www/html/couch/cache \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 777 /var/www/html/couch/uploads /var/www/html/couch/cache

EXPOSE 80

CMD ["apache2-foreground"]
