FROM php:8.2-apache

ARG WORDPRESS_VERSION=7.0.3

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        mariadb-server mariadb-client curl ca-certificates \
        libicu-dev libzip-dev libpng-dev libjpeg62-turbo-dev libfreetype6-dev \
        libxml2-dev libonig-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" mysqli pdo_mysql intl mbstring xml zip gd exif \
    && a2enmod rewrite headers expires \
    && rm -rf /var/lib/apt/lists/*

COPY source/wordpress-7.0.3/ /var/www/html/
COPY scripts/entrypoint.sh /usr/local/bin/wordpress-entrypoint
COPY scripts/healthcheck-container.sh /usr/local/bin/wordpress-healthcheck
COPY scripts/user-create.php /usr/local/bin/wordpress-user-create.php
COPY scripts/reset-in-container.sh /usr/local/bin/wordpress-reset
COPY scripts/wp-bootstrap.php /usr/local/lib/wordpress/wp-bootstrap.php

RUN chmod 0755 /usr/local/bin/wordpress-entrypoint /usr/local/bin/wordpress-healthcheck \
        /usr/local/bin/wordpress-user-create.php /usr/local/bin/wordpress-reset \
    && printf '%s\n' 'ServerName localhost' > /etc/apache2/conf-available/servername.conf \
    && a2enconf servername \
    && mkdir -p /run/mysqld /var/lib/mysql /var/www/html/wp-content \
        /usr/local/lib/wordpress \
    && chown -R mysql:mysql /run/mysqld /var/lib/mysql \
    && chown -R www-data:www-data /var/www/html

# The secret is used only during this build step. The resulting WordPress
# phpass verifier is not the supplied plaintext credential.
RUN --mount=type=secret,id=wp_admin_password \
    php -r 'require "/var/www/html/wp-includes/class-phpass.php"; $p=trim(file_get_contents("/run/secrets/wp_admin_password")); if ($p === "") { fwrite(STDERR, "empty admin secret\n"); exit(1); } $h=(new PasswordHash(8, true))->HashPassword($p); file_put_contents("/opt/wordpress-admin-password.hash", $h."\n"); chmod("/opt/wordpress-admin-password.hash", 0600);'

WORKDIR /var/www/html
VOLUME ["/var/lib/mysql", "/var/www/html/wp-content"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=60s --retries=12 CMD ["/usr/local/bin/wordpress-healthcheck"]
ENTRYPOINT ["/usr/local/bin/wordpress-entrypoint"]
