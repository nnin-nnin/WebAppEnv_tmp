FROM php:8.2-apache

# Install dependencies and extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libwebp-dev \
        libzip-dev \
        libicu-dev \
        git \
        curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) mysqli gd zip intl \
    && a2enmod rewrite \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Apache & PHP configuration
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf \
    && { \
        echo 'opcache.enable=0'; \
        echo 'opcache.enable_cli=0'; \
        echo 'upload_max_filesize=64M'; \
        echo 'post_max_size=64M'; \
        echo 'memory_limit=256M'; \
        echo 'date.timezone=UTC'; \
    } > /usr/local/etc/php/conf.d/phpwcms.ini

# Fetch fixed source commit
RUN git clone https://github.com/slackero/phpwcms.git /tmp/src \
    && cd /tmp/src \
    && git checkout b8ebd5c8f2e21d187fc006fd8e9f72cfcac9c5cc \
    && cp -a /tmp/src/. /var/www/html/ \
    && rm -rf /tmp/src /var/www/html/.git /var/www/html/setup

WORKDIR /var/www/html

# Copy pre-configured configuration file
COPY conf.inc.php /var/www/html/include/config/conf.inc.php

# Ensure required directories exist and set correct ownership
RUN mkdir -p /var/www/html/filearchive/can_be_deleted \
             /var/www/html/content/images \
             /var/www/html/content/form \
             /var/www/html/content/tmp \
             /var/www/html/content/rss \
             /var/www/html/content/pages \
             /var/www/html/template \
             /var/www/html/upload \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80
CMD ["apache2-foreground"]
