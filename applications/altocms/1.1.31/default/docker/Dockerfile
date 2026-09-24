FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) mysqli pdo_mysql gd zip opcache \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

# Configure Apache AllowOverride
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Fetch fixed source commit
RUN git clone https://github.com/altocms/altocms.git /tmp/src \
    && cd /tmp/src \
    && git checkout d9f47c2f99d7aa13dc60e7181e632ce6697182af \
    && cp -a /tmp/src/. /var/www/html/ \
    && rm -rf /tmp/src /var/www/html/install /var/www/html/.git

WORKDIR /var/www/html

RUN rm -f /var/www/html/app/config/config.local.php
COPY config.local.php /var/www/html/app/config/config.local.php

# Ensure required directories exist and set correct ownership
RUN mkdir -p /var/www/html/_tmp /var/www/html/_run /var/www/html/uploads /var/www/html/app/config \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80
