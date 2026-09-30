FROM php:8.1-apache

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    unzip \
    libzip-dev \
    libicu-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j4 intl zip gd pdo pdo_mysql calendar opcache \
    && a2enmod rewrite \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo 'post_max_size = 64M' > /usr/local/etc/php/conf.d/thelia.ini \
    && echo 'upload_max_filesize = 32M' >> /usr/local/etc/php/conf.d/thelia.ini \
    && echo 'memory_limit = 512M' >> /usr/local/etc/php/conf.d/thelia.ini \
    && echo 'date.timezone = UTC' >> /usr/local/etc/php/conf.d/thelia.ini

COPY docker/apache.conf /etc/apache2/sites-available/000-default.conf

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

WORKDIR /var/www/html

RUN git config --global --add safe.directory '*' \
    && composer config -g policy.advisories.block false \
    && git clone --depth 1 -b 2.5.4 https://github.com/thelia/thelia.git . \
    && composer update --no-dev --no-audit --optimize-autoloader --no-interaction \
    && rm -rf .git

RUN mkdir -p /var/www/html/local/config /var/www/html/local/media /var/www/html/local/session /var/www/html/var /var/www/html/cache

RUN printf "\n###> thelia/database-configuration ###\nDB_HOST=db\nDB_PORT=3306\nDB_NAME=thelia\nDB_USER=thelia\nDB_PASSWORD=AdminPassword123!\n###< thelia/database-configuration ###\n" > /var/www/html/.env.local

RUN printf 'database:\n  connection:\n    driver: mysql\n    user: thelia\n    password: AdminPassword123!\n    dsn: "mysql:host=db;port=3306;dbname=thelia;charset=utf8mb4"\n' > /var/www/html/local/config/database.yml

RUN printf '<?xml version="1.0" encoding="UTF-8"?>\n<config>\n    <database>\n        <driver>mysql</driver>\n        <host>db</host>\n        <port>3306</port>\n        <user>thelia</user>\n        <password>AdminPassword123!</password>\n        <name>thelia</name>\n    </database>\n</config>\n' > /var/www/html/local/config/local.xml

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/html/local/media /var/www/html/local/session /var/www/html/var /var/www/html/cache

COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

HEALTHCHECK --interval=5s --timeout=5s --retries=30 CMD curl -f http://localhost/ || exit 1

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
