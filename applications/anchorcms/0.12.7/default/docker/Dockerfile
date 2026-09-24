FROM registry.hub.docker.com/library/php@sha256:c9d7e608f73832673479770d66aacc8100011ec751d1905ff63fae3fe2e0ca6d

# Install required system packages, mariadb-client and PHP extensions
RUN apt-get update && apt-get install -y \
    git \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libzip-dev \
    mariadb-client \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql mbstring zip opcache \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

# Suppress PHP 7.4 deprecation notices in production environment
RUN echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE" > /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "display_errors = Off" >> /usr/local/etc/php/conf.d/error-reporting.ini

# Copy entrypoint script into image
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Clone AnchorCMS source at exact immutable commit
RUN git clone https://github.com/anchorcms/anchor-cms.git /tmp/src \
    && cd /tmp/src \
    && git checkout 08e8e507909ee55b588674563b8ea21646ed9425 \
    && cp -r . /var/www/html/ \
    && rm -rf /tmp/src /var/www/html/.git

WORKDIR /var/www/html

# Fix get_magic_quotes_gpc PHP 7.4 compatibility in Nano framework
RUN sed -i 's/if (get_magic_quotes_gpc())/if (function_exists("get_magic_quotes_gpc") \&\& @get_magic_quotes_gpc())/' system/boot.php

# Copy Composer binary from official Composer image
COPY --from=registry.hub.docker.com/library/composer@sha256:8fa35f42911ff8bbee92aa37d781de6799168d4a0535ac6991f1b250bc2e0245 /usr/bin/composer /usr/local/bin/composer

# Install PHP dependencies via Composer during build time
RUN sed -i 's/"type": "CMS"/"type": "cms"/' composer.json \
    && composer install --no-dev --no-interaction --optimize-autoloader

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
