FROM php:8.2-apache

# Install required system packages and PHP extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libzip-dev \
        libxml2-dev \
        unzip \
        git \
        curl \
        ca-certificates \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        mysqli \
        pdo \
        pdo_mysql \
        gd \
        zip \
        opcache \
    && a2enmod rewrite headers expires deflate \
    && sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf \
    && rm -f /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini \
    && printf "opcache.enable=0\nopcache.enable_cli=0\n" > /usr/local/etc/php/conf.d/docker-php-ext-opcache-disable.ini \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Clone CubeCart v6 repository and checkout fixed commit
RUN git clone https://github.com/cubecart/v6.git /tmp/cubecart \
    && cd /tmp/cubecart \
    && git checkout de2e53977870bfb236c1b22740ed7719fd570575 \
    && cp -a /tmp/cubecart/. /var/www/html/ \
    && rm -rf /tmp/cubecart /var/www/html/.git

# Copy banner images from setup to images/source and remove setup folder
RUN mkdir -p /var/www/html/images/source/website_images \
    && cp -a /var/www/html/setup/images/website_images/. /var/www/html/images/source/website_images/ \
    && rm -rf /var/www/html/setup

WORKDIR /var/www/html

# Install en-GB default language pack
COPY en-GB.zip /tmp/en-GB.zip
RUN unzip -o /tmp/en-GB.zip -d /var/www/html/language/ && rm -f /tmp/en-GB.zip

# Copy pre-configured files
COPY global.inc.php /var/www/html/includes/global.inc.php
COPY ssl-custom.inc.php /var/www/html/ssl-custom.inc.php
COPY htaccess /var/www/html/.htaccess

# Ensure required directories exist and set appropriate permissions
RUN mkdir -p /var/www/html/backup \
             /var/www/html/cache \
             /var/www/html/cache/skin \
             /var/www/html/files \
             /var/www/html/images/cache \
             /var/www/html/images/logos \
             /var/www/html/images/source \
             /var/www/html/includes/extra \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 777 /var/www/html/backup /var/www/html/cache /var/www/html/files /var/www/html/images /var/www/html/includes

EXPOSE 80

CMD ["apache2-foreground"]
