FROM node:20.11.1-bookworm-slim AS glpi-assets

RUN apt-get update \
    && apt-get install -y --no-install-recommends php-cli \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
COPY source/glpi-10.0.26/ /workspace/
RUN npm ci --no-audit --no-fund --fetch-retries=5 --fetch-retry-mintimeout=20000 --fetch-retry-maxtimeout=120000 \
    && npm run build:pack

FROM php:8.2-cli-bookworm AS glpi-dependencies

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates gettext git libcurl4-openssl-dev libfreetype6-dev libicu-dev \
        libjpeg62-turbo-dev libonig-dev libpng-dev libxml2-dev libzip-dev unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j2 curl gd intl mbstring mysqli pdo_mysql xml zip \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2.7.9 /usr/bin/composer /usr/bin/composer
WORKDIR /workspace
COPY source/glpi-10.0.26/ /workspace/
RUN composer install --no-dev --no-interaction --no-progress --prefer-dist --optimize-autoloader \
    && php bin/console locales:compile \
    && sha1sum package-lock.json | cut -d' ' -f1 | tr -d '\n' > .package.hash

FROM php:8.2-cli-bookworm AS glpi-admin-secret

RUN --mount=type=secret,id=glpi_admin_password \
    php -r '$p = trim(file_get_contents("/run/secrets/glpi_admin_password")); if ($p === "") { fwrite(STDERR, "controlled admin secret is empty\n"); exit(1); } $h = password_hash($p, PASSWORD_DEFAULT); file_put_contents("/tmp/glpi-admin-password.hash", $h . "\n"); chmod("/tmp/glpi-admin-password.hash", 0600);'

FROM php:8.2-apache

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates curl libcurl4-openssl-dev libfreetype6-dev libicu-dev libjpeg62-turbo-dev \
        libonig-dev libpng-dev libxml2-dev libzip-dev mariadb-client mariadb-server \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j2 curl exif gd intl mbstring mysqli pdo_mysql xml zip \
    && a2enmod rewrite headers expires \
    && rm -rf /var/lib/apt/lists/*

COPY --from=glpi-dependencies /workspace/ /var/www/html/
COPY --from=glpi-assets /workspace/public/ /var/www/html/public/
COPY --from=glpi-assets /workspace/css/lib/ /var/www/html/css/lib/
COPY --from=glpi-admin-secret /tmp/glpi-admin-password.hash /usr/local/share/glpi-admin-password.hash
COPY scripts/entrypoint.sh /usr/local/bin/glpi-entrypoint
COPY scripts/healthcheck-container.sh /usr/local/bin/glpi-healthcheck

RUN chmod 0755 /usr/local/bin/glpi-entrypoint /usr/local/bin/glpi-healthcheck \
        && chmod 0600 /usr/local/share/glpi-admin-password.hash \
        && printf '%s\n' 'ServerName localhost' > /etc/apache2/conf-available/servername.conf \
        && a2enconf servername \
        && mkdir -p /run/mysqld /var/lib/mysql /var/www/html/config /var/www/html/files \
        && chown -R mysql:mysql /run/mysqld /var/lib/mysql \
        && chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html
VOLUME ["/var/lib/mysql", "/var/www/html/config", "/var/www/html/files"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=90s --retries=12 CMD ["/usr/local/bin/glpi-healthcheck"]
ENTRYPOINT ["/usr/local/bin/glpi-entrypoint"]
