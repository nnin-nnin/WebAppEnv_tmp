FROM php:5.6-apache

RUN sed -i -e 's/deb.debian.org/archive.debian.org/g' \
           -e 's|security.debian.org/debian-security|archive.debian.org/debian-security|g' \
           -e '/stretch-updates/d' /etc/apt/sources.list

RUN apt-get update -o Acquire::Check-Valid-Until=false || true \
    && apt-get install -y --allow-unauthenticated git && rm -rf /var/lib/apt/lists/*
# Copy source code from build context
COPY source_repo /var/www/html/
RUN chown -R www-data:www-data /var/www/html \
    && mkdir -p /var/www/html/templates_c \
    && mkdir -p /var/www/html/files/standard/avatar \
    && mkdir -p /var/www/html/files/standard/ics \
    && chmod -R 777 /var/www/html/templates_c /var/www/html/files /var/www/html/config

# Copy config.php
COPY docker/config.php /var/www/html/config/standard/config.php
RUN chown www-data:www-data /var/www/html/config/standard/config.php && chmod 755 /var/www/html/config/standard/config.php
