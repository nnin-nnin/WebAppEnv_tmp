FROM alpine/git AS src
WORKDIR /src
RUN git init . \
    && git remote add origin https://github.com/GilaCMS/gila.git \
    && git fetch --depth 1 origin 03717370d4cb456aacb5f5df5eb806b3679764b6 \
    && git checkout --detach FETCH_HEAD

FROM php:8.1-apache

ENV TZ="UTC"
ENV APACHE_DOCUMENT_ROOT="/var/www/html"

RUN apt-get update && apt-get install -y --no-install-recommends \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libzip-dev \
        curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        mysqli \
        pdo \
        pdo_mysql \
        gd \
        zip \
    && a2enmod rewrite \
    && printf "opcache.enable=0\nopcache.enable_cli=0\n" > /usr/local/etc/php/conf.d/disable-opcache.ini \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN { \
        echo '<Directory /var/www/html>'; \
        echo '    Options Indexes FollowSymLinks'; \
        echo '    AllowOverride All'; \
        echo '    Require all granted'; \
        echo '</Directory>'; \
    } >> /etc/apache2/apache2.conf

WORKDIR /var/www/html

COPY --from=src /src /var/www/html

COPY config.php /var/www/html/config.php
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh \
    && php -r "require_once 'src/core/autoload.php'; Gila\Package::copyAssets('core'); Gila\Theme::copyAssets('gila-blog'); Gila\Theme::copyAssets('gila-mag');" \
    && mkdir -p /var/www/html/log/cacheItem /var/www/html/log/sessions /var/www/html/log/stats /var/www/html/tmp /var/www/html/data /var/www/html/sites /var/www/html/assets/uploads \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/html/log /var/www/html/tmp /var/www/html/data /var/www/html/sites /var/www/html/assets

EXPOSE 80
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
