FROM alpine/git AS src
WORKDIR /src
RUN git init . \
    && git remote add origin https://github.com/neos/neos.git \
    && git fetch --depth 1 origin e2a96a3990249da59586ff3ea2f1514f837d03dd \
    && git checkout --detach FETCH_HEAD

FROM php:8.1-apache

ENV TZ="UTC"
ENV FLOW_CONTEXT="Production"

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        unzip \
        mariadb-client \
        libzip-dev \
        libicu-dev \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        pdo_mysql \
        zip \
        intl \
        gd \
    && a2enmod rewrite \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# Configure PHP settings (disable opcache for ARM64 macOS compatibility)
RUN { \
        echo "opcache.enable=0"; \
        echo "opcache.enable_cli=0"; \
        echo "memory_limit=512M"; \
        echo "max_execution_time=300"; \
        echo "upload_max_filesize=50M"; \
        echo "post_max_size=50M"; \
        echo "date.timezone=UTC"; \
    } > /usr/local/etc/php/conf.d/custom-neos.ini

# Configure Apache DocumentRoot to /var/www/html/Web
RUN sed -ri -e 's!/var/www/html!/var/www/html/Web!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!/var/www/html/Web!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
    && { \
        echo '<Directory /var/www/html/Web>'; \
        echo '    Options Indexes FollowSymLinks'; \
        echo '    AllowOverride All'; \
        echo '    Require all granted'; \
        echo '</Directory>'; \
    } >> /etc/apache2/apache2.conf

# Install Composer CLI
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install Neos Base Distribution
WORKDIR /var/www/html
RUN composer create-project --no-interaction --prefer-dist --no-dev neos/neos-base-distribution:~8.3.0 /var/www/html

# Replace Neos.Neos package with the fixed commit source
COPY --from=src /src/ /var/www/html/Packages/Application/Neos.Neos/

# Copy configuration and entrypoint
COPY Settings.yaml /var/www/html/Configuration/Settings.yaml
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh \
    && mkdir -p /var/www/html/Data/Logs /var/www/html/Data/Persistent /var/www/html/Data/Temporary /var/www/html/Web/_Resources \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/Data /var/www/html/Configuration

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
