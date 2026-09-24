FROM php:8.3-apache

# Install dependencies required by phpBB
RUN apt-get update && apt-get install -y \
    unzip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    libxml2-dev \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql zip \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

ENV PHPBB_VERSION=3.3.17

# Extract the fixed release archive shipped with this environment.
COPY source/phpBB-3.3.17.zip /tmp/phpBB-3.3.17.zip
RUN unzip /tmp/phpBB-3.3.17.zip -d /tmp/ \
    && rm -rf /var/www/html/* \
    && cp -R /tmp/phpBB3/* /var/www/html/ \
    && rm -rf /tmp/phpBB3 /tmp/phpBB-3.3.17.zip

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

COPY docker/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
