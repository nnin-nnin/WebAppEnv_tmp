FROM php:8.2-apache

ARG ESPOCRM_COMMIT=06be47c3488c7c369ee879b920ec4c3fc4acbb5d

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      git curl unzip libicu-dev libpng-dev libjpeg62-turbo-dev libfreetype6-dev libzip-dev libxml2-dev \
      libcurl4-openssl-dev nodejs npm \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install exif gd intl mysqli pdo_mysql zip \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2.2 /usr/bin/composer /usr/local/bin/composer

WORKDIR /var/www/html
ENV PUPPETEER_SKIP_DOWNLOAD=true
COPY source/espocrm-8.2.5/ /var/www/html/
RUN composer install --no-dev --no-interaction --prefer-dist \
    && rm -f package-lock.json \
    && npm install --no-audit --no-fund \
    && npm install --global grunt-cli \
    && grunt \
    && chown -R www-data:www-data /var/www/html

HEALTHCHECK --interval=10s --timeout=5s --retries=20 CMD curl -fsS http://localhost/install/ >/dev/null || exit 1
