FROM php:5.6-apache
ENV CFLAGS=-O0 CXXFLAGS=-O0

RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list \
    && sed -i 's|security.debian.org|archive.debian.org/|g' /etc/apt/sources.list \
    && sed -i '/stretch-updates/d' /etc/apt/sources.list \
    && apt-get update && apt-get install -y --allow-unauthenticated \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        unzip \
    && docker-php-source extract \
    && cd /usr/src/php/ext/gd \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --without-xpm --without-webp \
    && make -j1 \
    && cp modules/gd.so "$(php-config --extension-dir)/gd.so" \
    && cd /usr/src/php/ext/mysqli \
    && docker-php-ext-configure mysqli \
    && make -j1 \
    && cp modules/mysqli.so "$(php-config --extension-dir)/mysqli.so" \
    && cd /usr/src/php/ext/pdo_mysql \
    && docker-php-ext-configure pdo_mysql \
    && make -j1 \
    && cp modules/pdo_mysql.so "$(php-config --extension-dir)/pdo_mysql.so" \
    && printf '%s\n' 'extension=gd.so' 'extension=mysqli.so' 'extension=pdo_mysql.so' > /usr/local/etc/php/conf.d/docker-php-ext-webid.ini \
    && cd / \
    && docker-php-source delete \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://github.com/renlok/WeBid/archive/0f9e5b1804472e9b863c637982ff945162953929.zip -o webid.zip \
    && unzip -q webid.zip \
    && cp -a WeBid-0f9e5b1804472e9b863c637982ff945162953929/. /var/www/html/ \
    && rm -rf WeBid-0f9e5b1804472e9b863c637982ff945162953929 webid.zip \
    && chown -R www-data:www-data /var/www/html

RUN chmod 777 /var/www/html/includes/config.inc.php.new \
    && chmod 777 /var/www/html/language/EN/categories.inc.php \
    && chmod 777 /var/www/html/language/EN/categories_select_box.inc.php \
    && chmod 777 /var/www/html/cache \
    && chmod 777 /var/www/html/uploaded \
    && chmod 777 /var/www/html/uploaded/cache

COPY docker/entrypoint.sh /usr/local/bin/docker-entrypoint-webid.sh
RUN chmod +x /usr/local/bin/docker-entrypoint-webid.sh

RUN a2enmod rewrite

ENTRYPOINT ["docker-entrypoint-webid.sh"]
CMD ["apache2-foreground"]
