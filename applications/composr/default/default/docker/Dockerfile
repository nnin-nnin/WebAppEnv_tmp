FROM php:8.2-apache

# Install required system packages, mariadb-client, git, unzip, and libraries for PHP extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libicu-dev \
    mariadb-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        gd \
        mysqli \
        pdo_mysql \
        zip \
        intl \
        exif \
        gettext \
        opcache \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

# Configure client SSL settings for MariaDB connection
RUN mkdir -p /etc/mysql/conf.d \
    && echo "[client]\nssl = 0" > /etc/mysql/conf.d/client.cnf

# Configure PHP settings
RUN echo "memory_limit = 512M" > /usr/local/etc/php/conf.d/composr.ini \
    && echo "max_execution_time = 300" >> /usr/local/etc/php/conf.d/composr.ini \
    && echo "upload_max_filesize = 50M" >> /usr/local/etc/php/conf.d/composr.ini \
    && echo "post_max_size = 50M" >> /usr/local/etc/php/conf.d/composr.ini \
    && echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE" >> /usr/local/etc/php/conf.d/composr.ini \
    && echo "display_errors = Off" >> /usr/local/etc/php/conf.d/composr.ini

# Copy entrypoint script into image
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Clone Composr source at exact immutable commit
RUN git clone https://github.com/composr-ecosystem/composr.git /tmp/src \
    && cd /tmp/src \
    && git checkout f204b0d038d08c6c663c25bbf344e55074841c7d \
    && cp -r . /var/www/html/ \
    && cp recommended.htaccess /var/www/html/.htaccess \
    && rm -rf /tmp/src /var/www/html/.git

WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
