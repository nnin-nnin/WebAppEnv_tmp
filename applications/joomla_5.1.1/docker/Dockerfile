FROM php:8.2-apache@sha256:e71d4502e5569f46b638c81c420d552d8776e4703c06a90775792497ab982230

ENV DEBIAN_FRONTEND=noninteractive \
    JOOMLA_DB_NAME=joomla_db \
    JOOMLA_DB_USER=joomla \
    JOOMLA_DB_PASSWORD=joomla-local-password \
    JOOMLA_DB_ROOT_PASSWORD=joomla-root-password

RUN apt-get update && apt-get install -y --no-install-recommends \
      mariadb-server mariadb-client curl libicu-dev libzip-dev libpng-dev \
      libjpeg62-turbo-dev libfreetype6-dev libonig-dev libxml2-dev unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" mysqli pdo_mysql intl mbstring xml zip gd \
    && a2enmod rewrite headers expires \
    && rm -rf /var/lib/apt/lists/*

COPY source/joomla-runtime/ /var/www/html/
COPY resources/initial-data/database-seed.sql /opt/joomla/database-seed.sql
COPY scripts/entrypoint.sh /usr/local/bin/joomla-entrypoint
COPY scripts/healthcheck.sh /usr/local/bin/joomla-healthcheck
RUN chmod +x /usr/local/bin/joomla-entrypoint /usr/local/bin/joomla-healthcheck \
    && printf '%s\n' 'ServerName localhost' > /etc/apache2/conf-available/servername.conf \
    && a2enconf servername \
    && chown -R www-data:www-data /var/www/html \
    && mkdir -p /run/mysqld /var/lib/mysql \
    && chown -R mysql:mysql /run/mysqld /var/lib/mysql

WORKDIR /var/www/html
VOLUME ["/var/lib/mysql", "/var/www/html/images", "/var/www/html/media", "/var/www/html/cache", "/var/www/html/tmp"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=45s --retries=12 CMD /usr/local/bin/joomla-healthcheck
ENTRYPOINT ["/usr/local/bin/joomla-entrypoint"]
