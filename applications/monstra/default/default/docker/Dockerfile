FROM alpine/git AS src
WORKDIR /src
RUN git init . \
    && git remote add origin https://github.com/monstra-cms/monstra.git \
    && git fetch --depth 1 origin 5f6573facc118f476ab49103c1b42a32918d43dd \
    && git checkout --detach FETCH_HEAD

FROM php:7.4-apache

ENV TZ="UTC"
ENV APACHE_DOCUMENT_ROOT="/var/www/html"

# Configure Debian archive sources for Bullseye
RUN echo "deb [trusted=yes] http://archive.debian.org/debian bullseye main" > /etc/apt/sources.list \
    && echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99no-check

RUN apt-get update && apt-get install -y --no-install-recommends \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libzip-dev \
        curl \
        unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd zip \
    && a2enmod rewrite headers \
    && printf "opcache.enable=0\nopcache.enable_cli=0\n" > /usr/local/etc/php/conf.d/disable-opcache.ini \
    && printf "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE\ndisplay_errors = Off\n" > /usr/local/etc/php/conf.d/error-reporting.ini \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN { \
        echo '<Directory /var/www/html>'; \
        echo '    Options Indexes FollowSymLinks'; \
        echo '    AllowOverride All'; \
        echo '    Require all granted'; \
        echo '</Directory>'; \
    } >> /etc/apache2/apache2.conf

WORKDIR /var/www/html

COPY --from=src /src /var/www/html

# Patch Option::get to support dynamic siteurl
RUN php -r ' \
    $f = "/var/www/html/engine/Option.php"; \
    $c = file_get_contents($f); \
    $search = "public static function get(\$option)\n    {\n        // Redefine vars\n        \$option = (string) \$option;"; \
    $replace = "public static function get(\$option)\n    {\n        // Redefine vars\n        \$option = (string) \$option;\n        if (\$option === \"siteurl\" && !empty(\$_SERVER[\"HTTP_HOST\"])) {\n            \$proto = (!empty(\$_SERVER[\"HTTPS\"]) && \$_SERVER[\"HTTPS\"] !== \"off\") ? \"https\" : \"http\";\n            return \$proto . \"://\" . \$_SERVER[\"HTTP_HOST\"];\n        }"; \
    $c = str_replace($search, $replace, $c); \
    file_put_contents($f, $c); \
'

COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Pre-initialize directories, permissions, and initial files
RUN mkdir -p /var/www/html/backups /var/www/html/public /var/www/html/storage /var/www/html/tmp \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/html/backups /var/www/html/public /var/www/html/storage /var/www/html/tmp

EXPOSE 80
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
