# syntax=docker/dockerfile:1.7
FROM php:8.2-apache

ARG ADMIN_SECRET_VERSION
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates curl git libcurl4-openssl-dev libfreetype6-dev \
        libicu-dev libjpeg62-turbo-dev libldap2-dev libonig-dev libpng-dev \
        libxml2-dev libzip-dev mariadb-client mariadb-server nodejs npm unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure ldap \
    && docker-php-ext-install -j"$(nproc)" bcmath exif gd intl ldap mbstring \
        opcache pcntl pdo_mysql zip \
    && a2enmod rewrite headers expires \
    && rm -rf /var/lib/apt/lists/*

RUN curl --fail --silent --show-error https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer --version=2.7.9

COPY source/leantime/ /var/www/html/
WORKDIR /var/www/html

RUN COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --no-interaction \
        --no-progress --prefer-dist --optimize-autoloader \
    && npm ci --no-audit --no-fund \
    && npx mix --production \
    && node generateBlocklist.mjs \
    && rm -rf node_modules .npm _cacache \
    && rm -rf /root/.composer/cache \
    && mkdir -p /var/www/html/cache /var/www/html/logs /var/www/html/userfiles \
        /var/www/html/backupdb /var/lib/mysql /run/mysqld \
    && chown -R www-data:www-data /var/www/html \
    && chmod +x /var/www/html/bin/leantime

RUN --mount=type=secret,id=leantime_admin_password \
    test -n "$ADMIN_SECRET_VERSION" \
    && php -r '$p = trim(file_get_contents("/run/secrets/leantime_admin_password")); if ($p === "") { fwrite(STDERR, "controlled admin secret is empty\n"); exit(1); } $h = password_hash($p, PASSWORD_DEFAULT); file_put_contents("/usr/local/share/leantime-admin-password.hash", $h . "\n"); chmod("/usr/local/share/leantime-admin-password.hash", 0600);'

COPY scripts/entrypoint.sh /usr/local/bin/leantime-entrypoint
COPY scripts/healthcheck-container.sh /usr/local/bin/leantime-healthcheck

RUN chmod 0755 /usr/local/bin/leantime-entrypoint /usr/local/bin/leantime-healthcheck \
    && printf '%s\n' 'ServerName localhost' > /etc/apache2/conf-available/servername.conf \
    && a2enconf servername \
    && sed -ri 's!DocumentRoot /var/www/html$!DocumentRoot /var/www/html/public!' /etc/apache2/sites-available/000-default.conf \
    && printf '%s\n' '<Directory /var/www/html/public>' '    AllowOverride All' '    Require all granted' '</Directory>' \
        > /etc/apache2/conf-available/leantime.conf \
    && a2enconf leantime

VOLUME ["/var/lib/mysql", "/var/www/html/userfiles"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=90s --retries=12 CMD ["/usr/local/bin/leantime-healthcheck"]
ENTRYPOINT ["/usr/local/bin/leantime-entrypoint"]
