FROM --platform=linux/amd64 php:8.4-apache

RUN apt-get update && apt-get install -y \
    git \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    mariadb-client \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql zip curl xml intl bcmath \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

RUN printf 'opcache.enable=0\nopcache.jit=0\n' > /usr/local/etc/php/conf.d/zz-disable-opcache.ini

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/eshop

RUN git clone https://github.com/OXID-eSales/oxideshop_ce.git . \
    && git checkout fb4428902f8a30b8a72903d3b5d0f2c23dfeafbc \
    && composer require --no-interaction "oxid-esales/twig-component:dev-b-8.0.x" "oxid-esales/twig-admin-theme:dev-b-8.0.x" "oxid-esales/apex-theme:dev-b-8.0.x" \
    && rm -rf /root/.composer /var/www/eshop/.git

RUN sed -ri -e 's!/var/www/html!/var/www/eshop/source!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!/var/www/eshop/source!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
    && echo '<Directory /var/www/eshop/source>\n    AllowOverride All\n    Require all granted\n</Directory>' >> /etc/apache2/apache2.conf

COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN mkdir -p /var/www/eshop/var/cache /var/www/eshop/var/configuration /var/www/eshop/source/log \
    && chown -R www-data:www-data /var/www/eshop/var /var/www/eshop/source/log

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
