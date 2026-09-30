FROM --platform=linux/amd64 php:8.1-apache

# Install system dependencies and PHP extensions required by Lodel
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    libzip-dev \
    libicu-dev \
    curl \
    mariadb-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        mysqli \
        pdo_mysql \
        gd \
        zip \
        intl \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

# Install composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Configure PHP settings (disable opcache for macOS/emulation stability)
RUN echo "opcache.enable=0" > /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini \
    && echo "memory_limit=256M" > /usr/local/etc/php/conf.d/memory-limit.ini \
    && echo "date.timezone=UTC" > /usr/local/etc/php/conf.d/timezone.ini

WORKDIR /var/www/html

# Clone lodel at commit b3c30be6a60683d8e0f79eee259d792b5482956e
RUN git clone https://github.com/OpenEdition/lodel.git /tmp/repo \
    && cd /tmp/repo \
    && git checkout b3c30be6a60683d8e0f79eee259d792b5482956e \
    && cp -a /tmp/repo/. /var/www/html/ \
    && rm -rf /tmp/repo /var/www/html/.git

# Install composer dependencies
RUN cd /var/www/html/lodel/scripts \
    && composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader

# Copy entrypoint and fallback init sql
COPY entrypoint.sh /entrypoint.sh
COPY init.sql /usr/local/share/lodel/init.sql

RUN chmod +x /entrypoint.sh \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
