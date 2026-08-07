# Build the application image from the requested immutable Monica commit.
FROM composer:2.7.6 AS vendor

WORKDIR /build
COPY source/monica-4.1.2/composer.json source/monica-4.1.2/composer.lock ./
RUN mkdir -p database/seeds database/factories; \
    composer install --no-dev --no-interaction --no-progress --prefer-dist \
      --optimize-autoloader --no-scripts --ignore-platform-reqs
COPY source/monica-4.1.2/ ./
RUN cp .env.example .env; \
    php artisan lang:generate -vvv

FROM node:20.11.1-bookworm AS frontend

WORKDIR /build
ENV PATH="/build/node_modules/.bin:${PATH}"
COPY source/monica-4.1.2/package.json source/monica-4.1.2/yarn.lock ./
RUN rm -f /usr/local/bin/yarn /usr/local/bin/yarnpkg; \
    corepack enable; \
    corepack prepare yarn@1.22.22 --activate
RUN yarn install --frozen-lockfile --non-interactive --ignore-scripts
RUN yarn add --ignore-scripts --dev --exact webpack@5.89.0 webpack-cli@4.10.0
COPY --from=vendor /build/vendor/ /build/vendor/
COPY --from=vendor /build/public/js/langs/ /build/public/js/langs/
COPY source/monica-4.1.2/ ./
RUN ./node_modules/.bin/mix --production

FROM php:8.2-fpm-bookworm

ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0" \
    PHP_OPCACHE_MAX_ACCELERATED_FILES="20000" \
    PHP_OPCACHE_MEMORY_CONSUMPTION="192" \
    PHP_OPCACHE_MAX_WASTED_PERCENTAGE="10" \
    PHP_MEMORY_LIMIT="512M" \
    PHP_UPLOAD_LIMIT="10G"

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      bash busybox-static ca-certificates procps \
      libcurl4-openssl-dev libfreetype6-dev libgmp-dev libicu-dev \
      libjpeg62-turbo-dev libmemcached-dev libpng-dev libpq-dev \
      libssl-dev libwebp-dev libxml2-dev libzip-dev zlib1g-dev; \
    debMultiarch="$(dpkg-architecture --query DEB_BUILD_MULTIARCH)"; \
    if [ ! -e /usr/include/gmp.h ]; then ln -s "/usr/include/${debMultiarch}/gmp.h" /usr/include/gmp.h; fi; \
    docker-php-ext-configure gd --with-jpeg --with-freetype --with-webp; \
    docker-php-ext-configure gmp; \
    docker-php-ext-install -j1 \
      intl zip bcmath gd gmp pdo_mysql mysqli pdo_pgsql soap; \
    pecl install APCu-5.1.26; \
    pecl install memcached-3.3.0; \
    pecl install redis-6.2.0; \
    docker-php-ext-enable apcu memcached redis opcache; \
    { \
      echo '[opcache]'; \
      echo 'opcache.enable=1'; \
      echo 'opcache.revalidate_freq=0'; \
      echo 'opcache.validate_timestamps=${PHP_OPCACHE_VALIDATE_TIMESTAMPS}'; \
      echo 'opcache.max_accelerated_files=${PHP_OPCACHE_MAX_ACCELERATED_FILES}'; \
      echo 'opcache.memory_consumption=${PHP_OPCACHE_MEMORY_CONSUMPTION}'; \
      echo 'opcache.max_wasted_percentage=${PHP_OPCACHE_MAX_WASTED_PERCENTAGE}'; \
      echo 'opcache.interned_strings_buffer=16'; \
      echo 'opcache.fast_shutdown=1'; \
    } > "$PHP_INI_DIR/conf.d/opcache-recommended.ini"; \
    { \
      echo 'memory_limit=${PHP_MEMORY_LIMIT}'; \
      echo 'upload_max_filesize=${PHP_UPLOAD_LIMIT}'; \
      echo 'post_max_size=${PHP_UPLOAD_LIMIT}'; \
    } > "$PHP_INI_DIR/conf.d/limits.ini"; \
    rm -rf /var/lib/apt/lists/* /tmp/pear

RUN printf 'opcache.enable=0\n' > "$PHP_INI_DIR/conf.d/zz-opcache-disabled.ini"

WORKDIR /var/www/html
COPY source/monica-4.1.2/ /var/www/html/
COPY --from=vendor /build/vendor/ /var/www/html/vendor/
COPY --from=frontend /build/public/ /var/www/html/public/
COPY --from=composer:2.7.6 /usr/bin/composer /usr/local/bin/composer
COPY docker/monica-entrypoint.sh docker/cron.sh docker/queue.sh /usr/local/bin/

RUN set -eux; \
    printf '4.1.2\n' > config/.version; \
    printf '50c266f7beb9d8fe6cd8c8929a759529275143f4\n' > config/.commit; \
    cp .env.example .env; \
    mkdir -p bootstrap/cache storage/logs storage/app/public storage/framework/views \
      storage/framework/cache storage/framework/sessions; \
    php artisan lang:generate -vvv; \
    php artisan package:discover --ansi; \
    chown -R www-data:www-data /var/www/html; \
    mkdir -p /var/spool/cron/crontabs; \
    chown -R www-data:www-data /var/spool/cron; \
    chmod +x /usr/local/bin/monica-entrypoint.sh /usr/local/bin/cron.sh /usr/local/bin/queue.sh

USER www-data
EXPOSE 9000
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=18 \
  CMD php -r '$s = @fsockopen("127.0.0.1", 9000); exit($s === false ? 1 : 0);'

ENTRYPOINT ["/usr/local/bin/monica-entrypoint.sh"]
CMD ["php-fpm"]
