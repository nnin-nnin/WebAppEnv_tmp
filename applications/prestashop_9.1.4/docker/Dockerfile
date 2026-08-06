ARG BASE_IMAGE=php:8.3.33-apache-bookworm
FROM ${BASE_IMAGE}

ENV APACHE_DOCUMENT_ROOT=/var/www/html \
    COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_MEMORY_LIMIT=-1 \
    APP_ENV=prod \
    PS_DEV_MODE=0 \
    PS_FOLDER_ADMIN=admin-dev \
    PS_FOLDER_INSTALL=install-dev

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apache2-utils \
        ca-certificates \
        curl \
        git \
        libfreetype6-dev \
        libicu-dev \
        libjpeg62-turbo-dev \
        libonig-dev \
        libpng-dev \
        libwebp-dev \
        libxml2-dev \
        libzip-dev \
        mariadb-client \
        mariadb-server \
        nodejs \
        npm \
        unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j"$(nproc)" \
        bcmath \
        exif \
        gd \
        intl \
        mysqli \
        opcache \
        pdo_mysql \
        soap \
        zip \
    && a2enmod rewrite headers expires \
    && sed -ri 's!DocumentRoot /var/www/html!DocumentRoot ${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri 's!<Directory /var/www/>!<Directory ${APACHE_DOCUMENT_ROOT}/>!g' /etc/apache2/apache2.conf \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fsSL https://getcomposer.org/installer -o /tmp/composer-setup.php \
    && php /tmp/composer-setup.php --no-interaction --install-dir=/usr/local/bin --filename=composer \
    && rm -f /tmp/composer-setup.php

RUN sed -ri 's!^(\s*DocumentRoot ).*!\1/var/www/html!' /etc/apache2/sites-available/*.conf \
    && sed -ri 's!<Directory \$\{APACHE_DOCUMENT_ROOT\}/>!<Directory /var/www/html/>!g; /<Directory \/var\/www\/html\/>/,/<\/Directory>/{s/AllowOverride None/AllowOverride All/}' /etc/apache2/apache2.conf

COPY source/prestashop/ /var/www/html/

RUN composer install --working-dir=/var/www/html --no-dev --prefer-dist --no-interaction --no-progress --optimize-autoloader \
    && cd /var/www/html \
    && ./tools/assets/build.sh all --force \
    && rm -rf /root/.composer /var/www/html/.git \
    && mkdir -p /var/www/html/var/cache/prod /var/www/html/var/logs /var/www/html/var/sessions \
    && chown -R www-data:www-data /var/www/html \
    && find /var/www/html -type d -exec chmod 755 {} + \
    && find /var/www/html -type f -exec chmod 644 {} + \
    && chmod 755 /var/www/html/index.php /var/www/html/admin-dev/index.php /var/www/html/install-dev/index_cli.php

RUN find /var/www/html -type d -name node_modules -prune -exec rm -rf {} + \
    && rm -rf /root/.npm /root/.cache

COPY scripts/entrypoint.sh /usr/local/bin/prestashop-entrypoint
COPY scripts/healthcheck-internal.sh /usr/local/bin/prestashop-healthcheck
RUN chmod 755 /usr/local/bin/prestashop-entrypoint /usr/local/bin/prestashop-healthcheck \
    && printf '%s\n' 'ServerName localhost' > /etc/apache2/conf-available/servername.conf \
    && a2enconf servername \
    && mkdir -p /run/mysqld /var/lib/mysql \
    && chown -R mysql:mysql /run/mysqld /var/lib/mysql \
    && printf '%s\n' 'memory_limit=512M' 'upload_max_filesize=64M' 'post_max_size=64M' 'max_execution_time=300' > /usr/local/etc/php/conf.d/prestashop.ini

VOLUME ["/var/lib/mysql", "/var/www/html/app/config", "/var/www/html/var", "/var/www/html/img", "/var/www/html/upload", "/var/www/html/download"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=60s --retries=12 CMD ["/usr/local/bin/prestashop-healthcheck"]
ENTRYPOINT ["/usr/local/bin/prestashop-entrypoint"]
