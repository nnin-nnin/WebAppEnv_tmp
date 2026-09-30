FROM php:7.4-apache

# Install required system packages, mariadb-client, and development libraries
RUN echo 'deb [trusted=yes] http://archive.debian.org/debian bullseye main' > /etc/apt/sources.list \
    && apt-get update -o Acquire::Check-Valid-Until=false \
    && apt-get install -y --no-install-recommends --allow-unauthenticated \
    git \
    curl \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libzip-dev \
    libxslt1-dev \
    libxml2-dev \
    mariadb-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql mbstring zip xsl xml \
    && a2enmod rewrite headers expires deflate mime \
    && rm -rf /var/lib/apt/lists/*

# Copy Composer from official image
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# PHP configuration (disable opcache for ARM64 Rosetta compatibility, set sensible limits)
RUN { \
    echo "opcache.enable = 0"; \
    echo "opcache.enable_cli = 0"; \
    echo "date.timezone = UTC"; \
    echo "display_errors = Off"; \
    echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE"; \
    echo "upload_max_filesize = 32M"; \
    echo "post_max_size = 32M"; \
    echo "memory_limit = 256M"; \
} > /usr/local/etc/php/conf.d/symphony.ini

# Apache directory permissions and AllowOverride All
RUN echo '<Directory /var/www/html>' > /etc/apache2/conf-available/symphony.conf \
    && echo '    Options FollowSymLinks MultiViews' >> /etc/apache2/conf-available/symphony.conf \
    && echo '    AllowOverride All' >> /etc/apache2/conf-available/symphony.conf \
    && echo '    Require all granted' >> /etc/apache2/conf-available/symphony.conf \
    && echo '</Directory>' >> /etc/apache2/conf-available/symphony.conf \
    && a2enconf symphony

# Disable SSL requirement for mariadb client
RUN mkdir -p /etc/mysql/conf.d && printf "[client]\nssl=0\n" > /etc/mysql/conf.d/disable-ssl.cnf

# Clone Symphony CMS repository at immutable commit ea690f74cbc5b325014e45fb44b7ad5501b7da5e
RUN git clone https://github.com/symphonycms/symphony-2.git /tmp/src \
    && cd /tmp/src \
    && git checkout ea690f74cbc5b325014e45fb44b7ad5501b7da5e \
    && cp -r . /var/www/html/ \
    && rm -rf /tmp/src /var/www/html/.git \
    && cd /var/www/html \
    && composer install --no-dev --optimize-autoloader --no-interaction

# Copy entrypoint and init scripts
COPY docker/init-symphony.php /usr/local/bin/init-symphony.php
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/init-symphony.php

WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
