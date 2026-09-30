FROM alpine/git AS src
WORKDIR /src
RUN git init . \
    && git remote add origin https://github.com/maxsite/cms.git \
    && git fetch --depth 1 origin 338f586e3ff7bb5453654e2d1c05695a65b69ba6 \
    && git checkout --detach FETCH_HEAD

FROM php:7.4-apache

# Configure Debian archive sources for Bullseye
RUN echo "deb [trusted=yes] http://archive.debian.org/debian bullseye main" > /etc/apt/sources.list \
    && echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99no-check

# Install system dependencies, mysql client and PHP development libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    default-mysql-client \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql zip \
    && a2enmod rewrite headers \
    && rm -rf /var/lib/apt/lists/*

# Suppress PHP deprecation notices, disable opcache (ARM64 emulation safety), set memory and upload limits
RUN echo "opcache.enable = 0" > /usr/local/etc/php/conf.d/disable-opcache.ini \
    && echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE" > /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "display_errors = Off" >> /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "upload_max_filesize = 32M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "post_max_size = 32M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/uploads.ini

# Apache directory permissions and AllowOverride All
RUN echo '<Directory /var/www/html>' > /etc/apache2/conf-available/maxsite.conf \
    && echo '    Options Indexes FollowSymLinks' >> /etc/apache2/conf-available/maxsite.conf \
    && echo '    AllowOverride All' >> /etc/apache2/conf-available/maxsite.conf \
    && echo '    Require all granted' >> /etc/apache2/conf-available/maxsite.conf \
    && echo '</Directory>' >> /etc/apache2/conf-available/maxsite.conf \
    && a2enconf maxsite

# Disable SSL requirement for mariadb client
RUN mkdir -p /etc/mysql/conf.d && printf "[client]\nssl=0\n" > /etc/mysql/conf.d/disable-ssl.cnf

WORKDIR /var/www/html

# Copy source from git clone stage
COPY --from=src /src /var/www/html

# Copy entrypoint script
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
