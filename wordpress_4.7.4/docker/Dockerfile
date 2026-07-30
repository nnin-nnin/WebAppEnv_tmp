FROM php:7.4-apache-bullseye

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      ca-certificates curl mariadb-client mariadb-server \
    && docker-php-ext-install mysqli \
    && a2enmod rewrite \
    && printf '%s\n' 'ServerName localhost' > /etc/apache2/conf-available/servername.conf \
    && a2enconf servername \
    && printf '%s\n' 'sendmail_path = /bin/true' > /usr/local/etc/php/conf.d/benchmark-mail.ini \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html
COPY source/wordpress-4.7.4/ /var/www/html/
COPY scripts/entrypoint.sh /usr/local/bin/wordpress-entrypoint
COPY scripts/wordpress-bootstrap.php /usr/local/bin/wordpress-bootstrap.php
COPY scripts/wordpress-user-create.php /usr/local/bin/wordpress-user-create.php

RUN chmod 755 /usr/local/bin/wordpress-entrypoint \
    && chmod 755 /usr/local/bin/wordpress-bootstrap.php /usr/local/bin/wordpress-user-create.php \
    && chown -R www-data:www-data /var/www/html/wp-content \
    && install -d -o mysql -g mysql /run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql

VOLUME ["/var/lib/mysql", "/var/www/html/wp-content"]
EXPOSE 80

HEALTHCHECK --interval=10s --timeout=5s --retries=20 \
  CMD curl -fsS -H 'Host: localhost:18084' http://127.0.0.1/wp-login.php >/dev/null || exit 1

ENTRYPOINT ["/usr/local/bin/wordpress-entrypoint"]
