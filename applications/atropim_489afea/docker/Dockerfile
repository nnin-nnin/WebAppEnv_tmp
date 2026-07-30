FROM php:7.4-apache-bullseye

COPY --from=composer:2.2 /usr/bin/composer /usr/local/bin/composer

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      ca-certificates cron curl git libcurl4-openssl-dev libfreetype6-dev \
      libjpeg62-turbo-dev libmagickwand-dev libonig-dev libpng-dev libxml2-dev \
      libzip-dev mariadb-client mariadb-server unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install curl exif gd mbstring mysqli pdo_mysql xml zip \
    && curl --fail --location --retry 3 --retry-all-errors \
      --output /tmp/imagick-3.7.0.tgz https://pecl.php.net/get/imagick-3.7.0.tgz \
    && pecl install /tmp/imagick-3.7.0.tgz \
    && docker-php-ext-enable imagick \
    && php -m | grep -qx imagick \
    && a2enmod rewrite \
    && rm -f /tmp/imagick-3.7.0.tgz \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html
COPY source/atropim-489afea/ /var/www/html/

RUN composer install --no-dev --no-interaction --prefer-dist --no-progress \
    && cp -a vendor/atrocore/core/copy/. /var/www/html/ \
    && cp vendor/atrocore/core/app/Espo/Core/defaults/config.php /var/www/html/data/config.php \
    && mkdir -p /var/www/html/client \
    && cp -a vendor/atrocore/core/client/. /var/www/html/client/ \
    && cp -a vendor/atrocore/pim/client/. /var/www/html/client/ \
    && cp -a vendor/atrocore/dam/client/. /var/www/html/client/ \
    && cp -a vendor/atrocore/export-feeds/client/. /var/www/html/client/ \
    && cp -a vendor/atrocore/import-feeds/client/. /var/www/html/client/ \
    && chown -R www-data:www-data /var/www/html \
    && find /var/www/html -type d -exec chmod 755 {} + \
    && find /var/www/html -type f -exec chmod 644 {} + \
    && find /var/www/html/data /var/www/html/custom /var/www/html/upload -type d -exec chmod 775 {} + \
    && find /var/www/html/data /var/www/html/custom /var/www/html/upload -type f -exec chmod 664 {} +

COPY resources/users.yaml /usr/local/share/atropim/users.yaml
COPY resources/roles.yaml /usr/local/share/atropim/roles.yaml
COPY scripts/entrypoint.sh /usr/local/bin/atropim-entrypoint

RUN chmod 755 /usr/local/bin/atropim-entrypoint \
    && install -d -o mysql -g mysql /run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql

VOLUME ["/var/lib/mysql", "/var/www/html/data", "/var/www/html/upload"]
EXPOSE 80

HEALTHCHECK --interval=10s --timeout=5s --retries=20 \
  CMD curl -fsS http://localhost/ >/dev/null || exit 1

ENTRYPOINT ["/usr/local/bin/atropim-entrypoint"]
