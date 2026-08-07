# syntax=docker/dockerfile:1.7
FROM php:8.1-apache

ENV APACHE_DOCUMENT_ROOT=/var/www/html \
    APP_ENV=prod \
    APP_DEBUG=0 \
    MAUTIC_DB_DRIVER=pdo_mysql \
    MAUTIC_DB_HOST=127.0.0.1 \
    MAUTIC_DB_PORT=3306 \
    MAUTIC_DB_NAME=mautic \
    MAUTIC_DB_USER=mautic \
    MAUTIC_DB_PASSWORD=mautic \
    MAUTIC_REQUEST_CONTEXT_HOST=localhost \
    MAUTIC_REQUEST_CONTEXT_SCHEME=http \
    MAUTIC_REQUEST_CONTEXT_HTTP_PORT=80 \
    MAUTIC_REQUEST_CONTEXT_HTTPS_PORT=443 \
    MAUTIC_MAILER_DSN=null://null \
    MAUTIC_MESSENGER_DSN_EMAIL=sync:// \
    MAUTIC_MESSENGER_DSN_HIT=sync:// \
    MAUTIC_MESSENGER_DSN_FAILED=null://null

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      default-mysql-client \
      git \
      libicu-dev \
      libkrb5-dev \
      libjpeg62-turbo-dev \
      libpng-dev \
      libwebp-dev \
      libxml2-dev \
      libzip-dev \
      mariadb-server \
      nodejs \
      npm \
      unzip \
      zip \
 && docker-php-ext-configure gd --with-jpeg --with-webp \
 && docker-php-ext-install -j"$(nproc)" bcmath gd intl mysqli opcache pdo_mysql sockets soap zip \
 && pecl install redis-6.0.2 \
 && docker-php-ext-enable redis \
 && curl -fsSL https://getcomposer.org/installer -o /tmp/composer-setup.php \
 && php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer --version=2.7.9 \
 && rm -f /tmp/composer-setup.php \
 && a2enmod rewrite headers expires \
 && sed -ri 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
 && printf '%s\n' '<Directory /var/www/html>' '    AllowOverride All' '    Require all granted' '</Directory>' > /etc/apache2/conf-available/mautic.conf \
 && a2enconf mautic \
 && rm -rf /var/lib/apt/lists/*

RUN printf '%s\n' 'memory_limit=512M' > /usr/local/etc/php/conf.d/mautic-memory.ini

WORKDIR /var/www/html
COPY source/mautic-5.0.4/ /var/www/html/

RUN rm -rf /var/www/html/.git /var/www/html/var/cache/* /var/www/html/var/logs/* \
 && COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --no-interaction --no-progress --prefer-dist --optimize-autoloader --ignore-platform-req=ext-imap \
 && mkdir -p /var/www/html/var/cache /var/www/html/var/logs /var/www/html/media/files /run/mysqld \
 && chown -R www-data:www-data /var/www/html/var /var/www/html/media /var/www/html/app/config \
 && chmod +x /var/www/html/bin/console

RUN --mount=type=secret,id=admin_password \
    set -eu; \
    MAUTIC_ADMIN_PASSWORD="$(cat /run/secrets/admin_password)"; \
    test -n "$MAUTIC_ADMIN_PASSWORD"; \
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql >/dev/null; \
    mysqld --user=mysql --datadir=/var/lib/mysql --pid-file=/tmp/mautic-build.pid --bind-address=127.0.0.1 --port=3306 --socket=/tmp/mautic-build.sock >/tmp/mautic-mysql.log 2>&1 & \
    db_pid=$!; \
    cleanup() { kill "$db_pid" 2>/dev/null || true; wait "$db_pid" 2>/dev/null || true; }; \
    trap cleanup EXIT; \
    for _ in $(seq 1 60); do \
      if mariadb-admin --socket=/tmp/mautic-build.sock --user=root ping >/dev/null 2>&1; then break; fi; \
      kill -0 "$db_pid" 2>/dev/null || { cat /tmp/mautic-mysql.log >&2; exit 1; }; \
      sleep 1; \
    done; \
    mariadb-admin --socket=/tmp/mautic-build.sock --user=root ping >/dev/null 2>&1; \
    mariadb --socket=/tmp/mautic-build.sock --user=root -e "CREATE DATABASE mautic CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; CREATE USER 'mautic'@'localhost' IDENTIFIED BY 'mautic'; GRANT ALL PRIVILEGES ON mautic.* TO 'mautic'@'localhost'; FLUSH PRIVILEGES;"; \
    MAUTIC_DB_DRIVER=pdo_mysql MAUTIC_DB_HOST=127.0.0.1 MAUTIC_DB_PORT=3306 MAUTIC_DB_NAME=mautic MAUTIC_DB_USER=mautic MAUTIC_DB_PASSWORD=mautic \
      php -d memory_limit=512M bin/console mautic:install 'http://localhost:18518' --force \
      --db_driver=pdo_mysql --db_host=127.0.0.1 --db_port=3306 --db_name=mautic --db_user=mautic --db_password=mautic \
      --admin_firstname=Admin --admin_lastname=Mautic --admin_username=admin --admin_email=admin@example.invalid \
      --admin_password="$MAUTIC_ADMIN_PASSWORD"; \
    php -d memory_limit=512M bin/console doctrine:migrations:sync-metadata-storage --no-interaction; \
    php -d memory_limit=512M bin/console doctrine:migrations:version --add --all --no-interaction; \
    sed -i "/'site_url'/i\\\t'api_enabled' => true," /var/www/html/config/local.php; \
    sed -i "/'site_url'/i\\\t'api_enable_basic_auth' => true," /var/www/html/config/local.php

RUN rm -rf /var/www/html/.git /var/www/html/node_modules /root/.composer /root/.npm \
 && cp -a /var/lib/mysql /opt/mautic-db-seed \
 && rm -f /tmp/mautic-build.sock /tmp/mautic-mysql.log \
 && chown -R mysql:mysql /var/lib/mysql /opt/mautic-db-seed \
 && chown -R www-data:www-data /var/www/html/var /var/www/html/media /var/www/html/app/config

COPY scripts/entrypoint.sh /usr/local/bin/mautic-entrypoint
RUN chmod 0755 /usr/local/bin/mautic-entrypoint \
 && printf '%s\n' 'ServerName localhost' > /etc/apache2/conf-available/servername.conf \
 && a2enconf servername \
 && docker-php-ext-enable opcache

VOLUME ["/var/www/html/var", "/var/www/html/media/files", "/var/lib/mysql"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=60s --retries=12 CMD curl -fsS http://127.0.0.1/s/login >/dev/null || exit 1
ENTRYPOINT ["/usr/local/bin/mautic-entrypoint"]
