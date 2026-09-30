FROM --platform=linux/amd64 php:7.4-apache

RUN echo "deb http://archive.debian.org/debian bullseye main" > /etc/apt/sources.list \
    && apt-get update && apt-get install -y --no-install-recommends \
       git \
       unzip \
       libpng-dev \
       libjpeg-dev \
       libfreetype6-dev \
       libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) mysqli pdo_mysql gd zip opcache \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf \
    && cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
    && echo "memory_limit = 512M" >> /usr/local/etc/php/conf.d/docker-php-custom.ini \
    && echo "upload_max_filesize = 64M" >> /usr/local/etc/php/conf.d/docker-php-custom.ini \
    && echo "post_max_size = 64M" >> /usr/local/etc/php/conf.d/docker-php-custom.ini \
    && echo "date.timezone = UTC" >> /usr/local/etc/php/conf.d/docker-php-custom.ini \
    && echo "max_execution_time = 300" >> /usr/local/etc/php/conf.d/docker-php-custom.ini

RUN git clone --depth 1 https://github.com/X2Engine/X2Engine.git /tmp/src \
    && cd /tmp/src \
    && git checkout e2b1011a2806a3f4efeaaafb60cc70cf39e2ebed \
    && cp -a /tmp/src/x2engine/. /var/www/html/ \
    && rm -rf /tmp/src /var/www/html/.git

WORKDIR /var/www/html

# Patch PHP 7.4 compatibility & private IP handling
RUN sed -i "s/return false;/return \!empty(\$_SERVER['REMOTE_ADDR']) ? \$_SERVER['REMOTE_ADDR'] : '127.0.0.1';/" \
        /var/www/html/protected/components/behaviors/CommonControllerBehavior.php \
    && sed -i "s/return false;/return \!empty(\$_SERVER['REMOTE_ADDR']) ? \$_SERVER['REMOTE_ADDR'] : '127.0.0.1';/" \
        /var/www/html/protected/modules/mobile/controllers/MobileController.php \
    && sed -i "s/return \$this->user\['lastLogin'\];/return \!empty(\$this->user) ? \$this->user['lastLogin'] : null;/" \
        /var/www/html/protected/models/Profile.php \
    && rm -f /var/www/html/install.php /var/www/html/installConfig.php /var/www/html/initialize.php

COPY X2Config.php /var/www/html/protected/config/X2Config.php
COPY encryption.key /var/www/html/protected/config/encryption.key
COPY encryption.iv /var/www/html/protected/config/encryption.iv
COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
    && mkdir -p /var/www/html/assets \
                /var/www/html/protected/runtime \
                /var/www/html/uploads \
                /var/www/html/custom \
                /var/www/html/protected/config \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/assets \
                    /var/www/html/protected/runtime \
                    /var/www/html/uploads \
                    /var/www/html/custom \
                    /var/www/html/protected/config

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
