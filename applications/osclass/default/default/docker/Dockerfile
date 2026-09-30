FROM php:7.4-apache

# Switch to Debian archive repositories for Bullseye
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list \
    && sed -i '/security/d' /etc/apt/sources.list \
    && sed -i '/updates/d' /etc/apt/sources.list

# Install required system packages, MariaDB client and PHP extensions
RUN apt-get -o Acquire::Check-Valid-Until=false update && apt-get install -y --no-install-recommends \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libzip-dev \
        mariadb-client \
        git \
        curl \
        ca-certificates \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        gd \
        mysqli \
        pdo_mysql \
        zip \
    && a2enmod rewrite \
    && sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure PHP settings (disable opcache on ARM64, suppress deprecation warnings)
RUN { \
    echo 'opcache.enable=0'; \
    echo 'opcache.enable_cli=0'; \
    echo 'error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE'; \
    echo 'display_errors = Off'; \
    echo 'upload_max_filesize = 64M'; \
    echo 'post_max_size = 64M'; \
    echo 'memory_limit = 256M'; \
    echo 'date.timezone = UTC'; \
} > /usr/local/etc/php/conf.d/docker-php-osclass.ini

# Clone Osclass repository and checkout immutable target commit
RUN git clone https://github.com/osclass/Osclass.git /tmp/osclass \
    && cd /tmp/osclass \
    && git checkout b1c67a2bd623748a3090b66d8ac5a0baf78172c8 \
    && cp -a /tmp/osclass/. /var/www/html/ \
    && rm -rf /tmp/osclass /var/www/html/.git

WORKDIR /var/www/html

# Backup and place pre-configured config.php
COPY docker/config.php /usr/local/share/osclass/config.php
RUN cp /usr/local/share/osclass/config.php /var/www/html/config.php

# Copy entrypoint script
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Ensure required writable directories exist and set permissions
RUN mkdir -p /var/www/html/oc-content/uploads \
             /var/www/html/oc-content/downloads \
             /var/www/html/oc-content/languages \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 775 /var/www/html/oc-content/uploads /var/www/html/oc-content/downloads /var/www/html/oc-content/languages

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
