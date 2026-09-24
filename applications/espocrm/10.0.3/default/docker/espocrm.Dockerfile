FROM php:8.3-apache

ENV MAKEFLAGS="-j1"
ARG ESPOCRM_COMMIT=42dc989e63f62682752431b31cfc21aef7740fc8

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN apt-get update \
    && apt-get install -y --no-install-recommends git curl unzip nodejs npm \
    && install-php-extensions exif gd intl mysqli pdo_mysql zip \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

WORKDIR /var/www/html
ENV PUPPETEER_SKIP_DOWNLOAD=true
COPY source/espocrm-10.0.3/ /var/www/html/
RUN composer install --no-dev --no-interaction --prefer-dist \
    && rm -f package-lock.json \
    && npm install --no-audit --no-fund \
    && npm install --global grunt-cli \
    && grunt \
    && chown -R www-data:www-data /var/www/html

HEALTHCHECK --interval=10s --timeout=5s --retries=20 CMD curl -fsS http://localhost/install/ >/dev/null || exit 1
