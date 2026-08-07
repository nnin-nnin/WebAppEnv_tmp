FROM php:8.3.33-apache-bookworm@sha256:973e11c67c1c81e7811077a0efa0f910cf903af0ba972cab6ba0c0e15913c771

ENV DEBIAN_FRONTEND=noninteractive \
    APACHE_DOCUMENT_ROOT=/var/www/html \
    MYSQL_DATA_DIR=/var/lib/mysql

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       curl libicu-dev libzip-dev mariadb-server poppler-utils \
    && docker-php-ext-install -j"$(nproc)" mysqli intl zip \
    && a2enmod rewrite \
    && printf '%s\n' 'ServerName localhost' > /etc/apache2/conf-available/hotcrp-servername.conf \
    && a2enconf hotcrp-servername \
    && sed -ri 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf \
    && rm -rf /var/lib/apt/lists/*

COPY source/hotcrp-718e6f4be3/ /var/www/html/
COPY resources/initial-data/application-data/options.php /var/www/html/conf/options.php
COPY resources/initial-data/ /opt/hotcrp/initial-data/
COPY scripts/entrypoint.sh /usr/local/sbin/hotcrp-entrypoint

RUN rm -rf /var/www/html/.git /var/www/html/conf/.git \
    && mkdir -p /var/www/html/docs /var/www/html/cacheable /run/mysqld \
    && chown -R www-data:www-data /var/www/html/docs /var/www/html/cacheable \
    && chmod 0755 /usr/local/sbin/hotcrp-entrypoint \
    && printf '%s\n' 'upload_max_filesize=15M' 'post_max_size=20M' 'max_input_vars=4096' 'session.gc_maxlifetime=86400' > /usr/local/etc/php/conf.d/hotcrp.ini

VOLUME ["/var/lib/mysql", "/var/www/html/docs"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=12 CMD curl --fail --silent http://127.0.0.1/ >/dev/null || exit 1
ENTRYPOINT ["/usr/local/sbin/hotcrp-entrypoint"]
