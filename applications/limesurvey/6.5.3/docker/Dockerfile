FROM php:8.2-cli-bookworm AS dependencies
WORKDIR /workspace
COPY source/limesurvey-6.5.3/ /workspace/
# The fixed upstream tree includes its production vendor tree; no dependency
# resolution or network access is needed when building or running the image.

FROM php:8.2-cli-bookworm AS admin-secret
RUN --mount=type=secret,id=limesurvey_admin_password \
    php -r '$p=trim(file_get_contents("/run/secrets/limesurvey_admin_password")); if ($p === "") { fwrite(STDERR, "controlled admin secret is empty\n"); exit(1); } $h=password_hash($p, PASSWORD_DEFAULT); file_put_contents("/tmp/limesurvey-admin-password.hash", $h."\n"); chmod("/tmp/limesurvey-admin-password.hash", 0600);'

FROM php:8.2-apache-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl libcurl4-openssl-dev \
       libfreetype6-dev libicu-dev libjpeg62-turbo-dev libonig-dev libpng-dev \
       libxml2-dev libzip-dev mariadb-client mariadb-server \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" curl gd intl mbstring mysqli pdo_mysql xml zip opcache \
    && a2enmod rewrite headers expires \
    && rm -rf /var/lib/apt/lists/*

COPY --from=dependencies /workspace/ /var/www/html/
COPY resources/initial-data/config.php /var/www/html/application/config/config.php
COPY --from=admin-secret /tmp/limesurvey-admin-password.hash /usr/local/share/limesurvey-admin-password.hash
COPY scripts/entrypoint.sh /usr/local/bin/limesurvey-entrypoint
COPY scripts/healthcheck-container.sh /usr/local/bin/limesurvey-healthcheck

RUN chmod 0755 /usr/local/bin/limesurvey-entrypoint /usr/local/bin/limesurvey-healthcheck \
    && chmod 0600 /usr/local/share/limesurvey-admin-password.hash \
    && printf '%s\n' 'ServerName localhost' > /etc/apache2/conf-available/servername.conf \
    && a2enconf servername \
    && mkdir -p /run/mysqld /var/lib/mysql /var/www/html/application/runtime /var/www/html/upload /var/www/html/tmp \
    && chown -R mysql:mysql /run/mysqld /var/lib/mysql \
    && chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html
VOLUME ["/var/lib/mysql", "/var/www/html/application/runtime", "/var/www/html/upload"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=8s --start-period=120s --retries=12 CMD ["/usr/local/bin/limesurvey-healthcheck"]
ENTRYPOINT ["/usr/local/bin/limesurvey-entrypoint"]
