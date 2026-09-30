FROM php:7.4-apache

# Configure Debian archive sources for Bullseye
RUN echo "deb http://archive.debian.org/debian bullseye main" > /etc/apt/sources.list

# Install system dependencies, mysql client and PHP development libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libzip-dev \
    default-mysql-client \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql mbstring zip \
    && a2enmod rewrite headers \
    && rm -rf /var/lib/apt/lists/*

# Suppress PHP deprecation notices, disable opcache (ARM64 emulation safety), set memory and upload limits
RUN echo "opcache.enable = 0" > /usr/local/etc/php/conf.d/disable-opcache.ini \
    && echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE" > /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "display_errors = Off" >> /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "upload_max_filesize = 32M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "post_max_size = 32M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/uploads.ini

# Apache directory permissions and AllowOverride All
RUN echo '<Directory /var/www/html>' > /etc/apache2/conf-available/jizhicms.conf \
    && echo '    Options FollowSymLinks' >> /etc/apache2/conf-available/jizhicms.conf \
    && echo '    AllowOverride All' >> /etc/apache2/conf-available/jizhicms.conf \
    && echo '    Require all granted' >> /etc/apache2/conf-available/jizhicms.conf \
    && echo '</Directory>' >> /etc/apache2/conf-available/jizhicms.conf \
    && a2enconf jizhicms

# Copy entrypoint script
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Clone JiZhiCMS source code at immutable commit ff2c965c26018ae7c3fdb70f180a3b76f40bc3fe
RUN git clone https://github.com/Cherry-toto/jizhicms.git /tmp/src \
    && cd /tmp/src \
    && git checkout ff2c965c26018ae7c3fdb70f180a3b76f40bc3fe \
    && cp -r . /var/www/html/ \
    && rm -rf /tmp/src /var/www/html/.git \
    && chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
