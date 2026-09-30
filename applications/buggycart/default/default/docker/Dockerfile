FROM --platform=linux/amd64 php:7.4-apache

RUN sed -i '/bullseye-security/d' /etc/apt/sources.list \
    && sed -i '/bullseye-updates/d' /etc/apt/sources.list \
    && apt-get update && apt-get install -y --no-install-recommends \
        libpng-dev \
        libjpeg62-turbo-dev \
        libfreetype6-dev \
        libzip-dev \
        git \
        unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql zip \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

RUN { \
    echo 'opcache.enable=0'; \
    echo 'memory_limit=256M'; \
    echo 'upload_max_filesize=100M'; \
    echo 'post_max_size=100M'; \
    echo 'date.timezone=UTC'; \
    echo 'display_errors=Off'; \
    echo 'log_errors=On'; \
} > /usr/local/etc/php/conf.d/buggycart.ini

WORKDIR /var/www/html

RUN git clone https://github.com/sazzad114/buggycart.git /tmp/buggycart \
    && cd /tmp/buggycart \
    && git checkout 6a1485230c96b6ea12a336d7559dffb450538460 \
    && cp -a /tmp/buggycart/upload/. /var/www/html/ \
    && rm -rf /tmp/buggycart /var/www/html/install

COPY config.php /var/www/html/config.php
COPY admin-config.php /var/www/html/admin/config.php
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/system/storage /var/www/html/image

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
