FROM php:5.6-apache

RUN docker-php-ext-install mysql mysqli pdo_mysql \
    && a2enmod rewrite

RUN { \
        echo 'error_reporting = E_ALL & ~E_DEPRECATED & ~E_NOTICE'; \
        echo 'display_errors = Off'; \
        echo 'log_errors = On'; \
    } > /usr/local/etc/php/conf.d/docker-php-errors.ini

ARG SOURCE_COMMIT=339b0c1fefebaf490282e9233ff9e76994413ffd
RUN curl -sL https://codeload.github.com/divScorp/Doctor-Appointment/tar.gz/${SOURCE_COMMIT} \
    | tar -xz --strip-components=1 -C /var/www/html/

COPY patches/ /tmp/patches/
RUN if [ -d /tmp/patches ]; then cp -rf /tmp/patches/* /var/www/html/; rm -rf /tmp/patches; fi

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && mkdir -p /var/www/html/Frontend/imge /var/www/html/Frontend/Image /var/www/html/Backend/reportfile \
    && chmod -R 777 /var/www/html/Frontend/imge /var/www/html/Frontend/Image /var/www/html/Backend/reportfile

EXPOSE 80

CMD ["apache2-foreground"]
