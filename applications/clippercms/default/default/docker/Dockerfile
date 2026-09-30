FROM --platform=linux/amd64 php:7.4-apache

RUN echo "deb http://archive.debian.org/debian bullseye main" > /etc/apt/sources.list \
    && apt-get update && apt-get install -y --no-install-recommends \
       git \
       unzip \
    && docker-php-ext-install -j$(nproc) mysqli pdo_mysql opcache \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

RUN git clone https://github.com/ClipperCMS/ClipperCMS.git /tmp/src \
    && cd /tmp/src \
    && git checkout 9787f6c91232cbcd39352c22601102a99be35dcd \
    && cp -a /tmp/src/. /var/www/html/ \
    && rm -rf /tmp/src /var/www/html/.git /var/www/html/install

WORKDIR /var/www/html

COPY config.inc.php /var/www/html/manager/includes/config.inc.php

RUN mkdir -p /var/www/html/assets/cache \
             /var/www/html/assets/images \
             /var/www/html/assets/files \
             /var/www/html/assets/backup \
             /var/www/html/assets/export \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/assets/cache

EXPOSE 80
