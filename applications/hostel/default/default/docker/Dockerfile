FROM --platform=linux/amd64 php:7.4-apache

RUN docker-php-ext-install mysqli

RUN a2enmod rewrite \
    && { \
        echo 'output_buffering = 4096'; \
        echo 'display_errors = Off'; \
        echo 'error_reporting = E_ALL & ~E_NOTICE & ~E_WARNING & ~E_DEPRECATED'; \
        echo 'session.cookie_httponly = 1'; \
    } > /usr/local/etc/php/conf.d/docker-php-custom.ini

WORKDIR /var/www/html

RUN curl -sL https://github.com/Bharat-Reddy/Hostel-Management-System/archive/179ff3e1c01a51a2e6e90ba88f6ca7ca9d63fd2b.tar.gz | tar -xz --strip-components=1 -C /var/www/html/

COPY config.inc.php /var/www/html/includes/config.inc.php
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["apache2-foreground"]
