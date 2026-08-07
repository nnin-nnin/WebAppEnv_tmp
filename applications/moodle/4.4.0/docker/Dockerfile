# syntax=docker/dockerfile:1.7
FROM php@sha256:bf518c4a303e5574b967201f22228f2f39e214afd23dcd6d58c965bc3c008086

ENV APACHE_DOCUMENT_ROOT=/var/www/html \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apache2-utils ca-certificates curl mariadb-client mariadb-server \
        libcurl4-openssl-dev libfreetype6-dev libicu-dev libjpeg62-turbo-dev \
        libpng-dev libzip-dev libxml2-dev libonig-dev unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" \
        exif gd intl mbstring mysqli opcache soap zip \
    && a2enmod rewrite headers expires \
    && printf '%s\n' 'ServerName localhost' > /etc/apache2/conf-available/moodle-servername.conf \
    && a2enconf moodle-servername \
    && rm -rf /var/lib/apt/lists/*

RUN printf '%s\n' \
    'memory_limit = 256M' \
    'max_input_vars = 5000' \
    'upload_max_filesize = 128M' \
    'post_max_size = 128M' \
    'max_execution_time = 300' \
    'opcache.memory_consumption = 128' \
    'opcache.max_accelerated_files = 20000' \
    'opcache.validate_timestamps = 0' \
    > /usr/local/etc/php/conf.d/moodle.ini

COPY source/moodle/ /var/www/html/
COPY scripts/entrypoint.sh /usr/local/bin/moodle-entrypoint
COPY resources/register-user.php /usr/local/bin/moodle-register-user
COPY resources/mathjax-stub.js /var/www/html/filter/mathjaxloader/mathjax-stub.js
RUN chmod 0755 /usr/local/bin/moodle-entrypoint /usr/local/bin/moodle-register-user \
    && mkdir -p /var/www/moodledata /opt/moodle-db-seed /opt/moodledata-seed \
    && chown -R www-data:www-data /var/www/html /var/www/moodledata

# The secret is never stored in the image. Only Moodle's resulting password
# hash is retained in the seeded database.
RUN --mount=type=secret,id=moodle_admin_password \
    set -eu; \
    install -d -o mysql -g mysql -m 0755 /run/mysqld /var/lib/mysql; \
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db >/dev/null; \
    mysqld --user=mysql --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock \
        --pid-file=/run/mysqld/mysqld.pid --skip-networking=0 --bind-address=127.0.0.1 & \
    dbpid=$!; \
    ready=0; \
    for n in $(seq 1 60); do \
        if mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot ping >/dev/null 2>&1; then ready=1; break; fi; \
        sleep 1; \
    done; \
    test "$ready" = 1; \
    printf '%s\n' \
        "CREATE DATABASE moodle CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" \
        "CREATE USER 'moodle'@'localhost' IDENTIFIED BY 'moodle-db-internal';" \
        "CREATE USER 'moodle'@'127.0.0.1' IDENTIFIED BY 'moodle-db-internal';" \
        "GRANT ALL PRIVILEGES ON moodle.* TO 'moodle'@'localhost';" \
        "GRANT ALL PRIVILEGES ON moodle.* TO 'moodle'@'127.0.0.1';" \
        'FLUSH PRIVILEGES;' \
        | mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot; \
    install -d -o www-data -g www-data -m 2770 /var/www/moodledata; \
    runuser -u www-data -- php /var/www/html/admin/cli/install.php \
        --lang=en --wwwroot=http://localhost:18521 --dataroot=/var/www/moodledata \
        --dbtype=mariadb --dbhost=127.0.0.1 --dbname=moodle --dbuser=moodle \
        --dbpass=moodle-db-internal --prefix=mdl_ \
        --fullname='Moodle Learning Platform' --shortname=Moodle \
        --adminuser=admin --adminpass="$(cat /run/secrets/moodle_admin_password)" \
        --adminemail=admin@example.invalid --non-interactive --agree-license; \
    mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -umoodle -pmoodle-db-internal \
        -e "UPDATE moodle.mdl_filter_active SET active=0 WHERE filter='mathjaxloader';"; \
    mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -umoodle -pmoodle-db-internal \
        -e "UPDATE moodle.mdl_config_plugins SET value='http://localhost:18521/filter/mathjaxloader/mathjax-stub.js' WHERE plugin='filter_mathjaxloader' AND name='httpsurl';"; \
    runuser -u www-data -- php /var/www/html/admin/cli/purge_caches.php >/dev/null; \
    mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot shutdown; \
    for n in $(seq 1 30); do kill -0 "$dbpid" 2>/dev/null || break; sleep 1; done; \
    cp -a /var/lib/mysql/. /opt/moodle-db-seed/; \
    cp -a /var/www/moodledata/. /opt/moodledata-seed/; \
    rm -rf /var/lib/mysql/*; \
    chown -R mysql:mysql /opt/moodle-db-seed; \
    chown -R www-data:www-data /opt/moodledata-seed /var/www/moodledata; \
    chmod 0700 /opt/moodle-db-seed

WORKDIR /var/www/html
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=60s --retries=12 \
    CMD sh -c "curl -fsS -H 'Host: localhost:18521' http://127.0.0.1/ | grep -Eq 'Moodle|login'"
ENTRYPOINT ["/usr/local/bin/moodle-entrypoint"]
