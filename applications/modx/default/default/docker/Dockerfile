FROM --platform=linux/amd64 php:7.4-apache

RUN echo "deb http://archive.debian.org/debian bullseye main" > /etc/apt/sources.list \
    && apt-get update && apt-get install -y --no-install-recommends \
       libpng-dev \
       libjpeg62-turbo-dev \
       libfreetype6-dev \
       libzip-dev \
       libxml2-dev \
       unzip \
       curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql zip \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Disable opcache to prevent crashes under macOS ARM64 emulation as requested
RUN { \
    echo 'opcache.enable=0'; \
    echo 'opcache.enable_cli=0'; \
} > /usr/local/etc/php/conf.d/opcache-recommended.ini

# Custom PHP settings for MODX
RUN { \
    echo 'date.timezone=UTC'; \
    echo 'memory_limit=256M'; \
    echo 'upload_max_filesize=64M'; \
    echo 'post_max_size=64M'; \
    echo 'max_execution_time=120'; \
} > /usr/local/etc/php/conf.d/modx.ini

WORKDIR /var/www/html

# Download and unpack MODX Revolution
ARG MODX_VERSION=2.8.7-pl
RUN curl -fsSL -o /tmp/modx.zip https://modx.com/download/direct/modx-${MODX_VERSION}.zip \
    && unzip -q /tmp/modx.zip -d /tmp \
    && cp -a /tmp/modx-${MODX_VERSION}/* /var/www/html/ \
    && rm -rf /tmp/modx.zip /tmp/modx-${MODX_VERSION} \
    && cp ht.access .htaccess \
    && rm -rf /var/www/html/setup

# Pre-populate configuration
COPY config.inc.php /var/www/html/core/config/config.inc.php
RUN cp /var/www/html/core/config/config.inc.php /var/www/html/core/config/config.inc.php.default

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
