FROM php:7.4-apache

RUN echo 'deb [trusted=yes] http://archive.debian.org/debian bullseye main' > /etc/apt/sources.list \
    && apt-get update -o Acquire::Check-Valid-Until=false \
    && apt-get install -y --no-install-recommends --allow-unauthenticated \
       mariadb-client \
       libpng-dev \
       libjpeg-dev \
       libfreetype6-dev \
       libzip-dev \
       unzip \
       curl \
       git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql zip \
    && a2enmod rewrite headers expires \
    && rm -rf /var/lib/apt/lists/*

# Suppress PHP deprecation notices and tune runtime
RUN echo "opcache.enable = 0" > /usr/local/etc/php/conf.d/custom.ini \
    && echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/custom.ini \
    && echo "max_execution_time = 300" >> /usr/local/etc/php/conf.d/custom.ini \
    && echo "date.timezone = UTC" >> /usr/local/etc/php/conf.d/custom.ini \
    && echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE" >> /usr/local/etc/php/conf.d/custom.ini \
    && echo "display_errors = Off" >> /usr/local/etc/php/conf.d/custom.ini

# Apache directory permissions and AllowOverride All
RUN echo '<Directory /var/www/html>' > /etc/apache2/conf-available/qdpm.conf \
    && echo '    Options FollowSymLinks' >> /etc/apache2/conf-available/qdpm.conf \
    && echo '    AllowOverride All' >> /etc/apache2/conf-available/qdpm.conf \
    && echo '    Require all granted' >> /etc/apache2/conf-available/qdpm.conf \
    && echo '</Directory>' >> /etc/apache2/conf-available/qdpm.conf \
    && a2enconf qdpm

# Fetch upstream repository at fixed ref HEAD (commit 28df4f2fe81f53dd4d37132753db945d61e91968)
RUN git clone https://github.com/qdpm/qdPM.git /tmp/upstream \
    && cd /tmp/upstream \
    && git checkout 28df4f2fe81f53dd4d37132753db945d61e91968 \
    && cp LICENSE /var/www/html/LICENSE-upstream \
    && rm -rf /tmp/upstream

# Download and extract qdPM application package
RUN (curl -fsSL "https://twds.dl.sourceforge.net/project/qdpm/qdPM_9.3.zip" -o /tmp/qdpm.zip || \
     curl -fsSL "https://downloads.sourceforge.net/project/qdpm/qdPM_9.3.zip" -o /tmp/qdpm.zip) \
    && unzip -q /tmp/qdpm.zip -d /var/www/html/ \
    && rm -f /tmp/qdpm.zip

# Setup pre-configured databases.yml and remove install directory
COPY docker/databases.yml /var/www/html/core/config/databases.yml
RUN rm -rf /var/www/html/install \
    && mkdir -p /var/www/html/core/cache /var/www/html/core/log /var/www/html/uploads /var/www/html/backups \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/core/cache /var/www/html/core/log /var/www/html/uploads /var/www/html/backups /var/www/html/core/config

COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/html
EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
