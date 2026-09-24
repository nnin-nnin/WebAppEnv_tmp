FROM php:5.6-apache
RUN sed -i -e 's/deb.debian.org/archive.debian.org/g' \
           -e 's|security.debian.org/debian-security|archive.debian.org/debian-security|g' \
           -e '/stretch-updates/d' /etc/apt/sources.list
RUN apt-get update -o Acquire::Check-Valid-Until=false || true \
    && apt-get install -y --allow-unauthenticated git && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install mysql mysqli pdo_mysql mbstring
COPY src /var/www/html/
RUN mkdir -p /var/www/html/templates_c /var/www/html/files/standard/avatar /var/www/html/files/standard/ics && \
    chmod -R 777 /var/www/html/templates_c /var/www/html/files /var/www/html/config/standard/
COPY config/config.php /var/www/html/config/standard/config.php
RUN chmod 644 /var/www/html/config/standard/config.php
