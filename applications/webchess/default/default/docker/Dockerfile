FROM --platform=linux/amd64 php:7.4-apache

RUN docker-php-ext-install mysqli \
    && a2enmod rewrite

RUN curl -sSL https://github.com/halojoy/PHP7-Webchess/archive/ee3e343dfd2cf766e1a88a1dcf2f2c4c292c3a10.tar.gz | tar -xz --strip-components=1 -C /var/www/html/

COPY config.php /var/www/html/config.php
COPY health.php /var/www/html/health.php

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE 80

HEALTHCHECK --interval=5s --timeout=5s --start-period=10s --retries=10 \
  CMD curl -f -s http://127.0.0.1:80/health.php || exit 1

CMD ["apache2-foreground"]
