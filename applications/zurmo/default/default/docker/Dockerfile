FROM php:7.4-apache

# Configure Debian archive sources for Bullseye
RUN echo "deb http://archive.debian.org/debian bullseye main" > /etc/apt/sources.list

# Install system dependencies, mysql client, and development libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    patch \
    libmcrypt-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libxml2-dev \
    default-mysql-client \
    unzip \
    curl \
    && pecl install mcrypt-1.0.4 \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) pdo_mysql mysqli gd zip soap bcmath opcache \
    && a2enmod rewrite headers \
    && rm -rf /var/lib/apt/lists/*

# PHP configurations
RUN echo "opcache.enable = 0" > /usr/local/etc/php/conf.d/disable-opcache.ini \
    && echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE & ~E_WARNING" > /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "display_errors = Off" >> /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "upload_max_filesize = 32M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "post_max_size = 32M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "max_execution_time = 300" >> /usr/local/etc/php/conf.d/uploads.ini

# Apache directory permissions
RUN echo '<Directory /var/www/html>' > /etc/apache2/conf-available/zurmo.conf \
    && echo '    Options FollowSymLinks' >> /etc/apache2/conf-available/zurmo.conf \
    && echo '    AllowOverride All' >> /etc/apache2/conf-available/zurmo.conf \
    && echo '    Require all granted' >> /etc/apache2/conf-available/zurmo.conf \
    && echo '</Directory>' >> /etc/apache2/conf-available/zurmo.conf \
    && a2enconf zurmo

# Clone Zurmo at commit 849e52029997ced4f7b571ded20dae824e9bfb55
RUN git clone https://github.com/Zurmo/Zurmo.git /tmp/src \
    && cd /tmp/src \
    && git checkout 849e52029997ced4f7b571ded20dae824e9bfb55 \
    && cp -r . /var/www/html/ \
    && rm -rf /tmp/src /var/www/html/.git /var/www/html/.hg

# Copy and apply PHP 7 compatibility patch
COPY docker/php7-compatibility.patch /tmp/php7-compatibility.patch
RUN cd /var/www/html && patch -p1 < /tmp/php7-compatibility.patch && rm -f /tmp/php7-compatibility.patch

# Copy pre-configured perInstance.php and debug.php
RUN mkdir -p /usr/local/etc/zurmo
COPY docker/perInstance.php /usr/local/etc/zurmo/perInstance.php
COPY docker/debug.php /usr/local/etc/zurmo/debug.php
RUN cp /usr/local/etc/zurmo/perInstance.php /var/www/html/app/protected/config/perInstance.php \
    && cp /usr/local/etc/zurmo/debug.php /var/www/html/app/protected/config/debug.php \
    && chown -R www-data:www-data /var/www/html

# Copy entrypoint script
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
