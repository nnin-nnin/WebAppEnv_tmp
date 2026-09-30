FROM composer:latest AS composer_stage

FROM php:8.2-apache

# Install system dependencies and tools required by ResourceSpace
RUN apt-get update && apt-get install -y --no-install-recommends \
        libpng-dev \
        libjpeg62-turbo-dev \
        libfreetype6-dev \
        libwebp-dev \
        libzip-dev \
        libicu-dev \
        libxml2-dev \
        imagemagick \
        ghostscript \
        ffmpeg \
        libimage-exiftool-perl \
        poppler-utils \
        unzip \
        git \
        curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && CFLAGS="-fPIC" docker-php-ext-install -j$(nproc) mysqli pdo pdo_mysql gd zip intl bcmath \
    && a2enmod rewrite \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Apache & PHP configuration
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf \
    && { \
        echo 'opcache.enable=0'; \
        echo 'opcache.enable_cli=0'; \
        echo 'memory_limit=512M'; \
        echo 'upload_max_filesize=100M'; \
        echo 'post_max_size=100M'; \
        echo 'max_execution_time=300'; \
        echo 'date.timezone=UTC'; \
    } > /usr/local/etc/php/conf.d/resourcespace.ini

# Copy composer binary from stage
COPY --from=composer_stage /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Fetch fixed source commit and install dependencies
ARG REPO_COMMIT=a72fb0a758a724d6efe2400b0683b33261dca6d4
RUN git clone https://github.com/resourcespace/resourcespace.git /tmp/src \
    && cd /tmp/src \
    && git checkout ${REPO_COMMIT} \
    && cp -a /tmp/src/. /var/www/html/ \
    && rm -rf /tmp/src /var/www/html/.git \
    && cd /var/www/html \
    && composer install --no-dev --no-interaction --optimize-autoloader --no-progress

# Copy pre-configured config.php
COPY config.php /var/www/html/include/config.php

# Create filestore directory and configure permissions
RUN mkdir -p /var/www/html/filestore /var/www/html/filestore/system/slideshow_default \
    && cp -r /var/www/html/gfx/homeanim/. /var/www/html/filestore/system/slideshow_default/ \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/filestore /var/www/html/include

EXPOSE 80
CMD ["apache2-foreground"]
