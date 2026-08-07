FROM composer:2.7.9 AS mediawiki-composer

FROM php:8.2-apache

ARG MEDIAWIKI_VERSION=1.41.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        mariadb-server mariadb-client curl ca-certificates git unzip \
        libicu-dev libxml2-dev libzip-dev libonig-dev \
    && docker-php-ext-install -j"$(nproc)" calendar mysqli pdo_mysql intl mbstring xml \
    && a2enmod rewrite headers expires \
    && printf '%s\n' 'ServerName localhost' > /etc/apache2/conf-available/servername.conf \
    && a2enconf servername \
    && printf '%s\n' \
        'Alias /favicon.ico /var/www/html/resources/assets/change-your-logo-icon.svg' \
        '<Location "/favicon.ico">' \
        '    ForceType image/svg+xml' \
        '</Location>' \
        > /etc/apache2/conf-available/mediawiki-favicon.conf \
    && a2enconf mediawiki-favicon \
    && rm -rf /var/lib/apt/lists/*

COPY --from=mediawiki-composer /usr/bin/composer /usr/local/bin/composer
COPY source/mediawiki/ /var/www/html/
COPY source/vector/ /var/www/html/skins/Vector/

WORKDIR /var/www/html
RUN composer install --no-dev --no-interaction --no-progress --prefer-dist --optimize-autoloader

COPY scripts/entrypoint.sh /usr/local/bin/mediawiki-entrypoint
COPY scripts/healthcheck-container.sh /usr/local/bin/mediawiki-healthcheck
COPY scripts/reset-in-container.sh /usr/local/bin/mediawiki-reset

RUN chmod 0755 /usr/local/bin/mediawiki-entrypoint /usr/local/bin/mediawiki-healthcheck \
        /usr/local/bin/mediawiki-reset \
    && mkdir -p /run/mysqld /var/lib/mysql /var/www/html/images /opt/mediawiki \
    && chown -R mysql:mysql /run/mysqld /var/lib/mysql \
    && chown -R www-data:www-data /var/www/html

# The supplied administrator secret is consumed only during image construction.
# Only MediaWiki's generated password verifier remains in the database seed.
RUN --mount=type=secret,id=mediawiki_admin_password \
    set -Eeuo pipefail; \
    rm -rf /var/lib/mysql/* /var/lib/mysql/.[!.]* /var/lib/mysql/..?* 2>/dev/null || true; \
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db >/var/log/mariadb-install.log 2>&1; \
    mariadbd --user=mysql --datadir=/var/lib/mysql --bind-address=127.0.0.1 \
      --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid \
      --skip-name-resolve --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci & \
    mysql_pid=$!; \
    ready=0; \
    for attempt in $(seq 1 90); do \
      if mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot ping >/dev/null 2>&1; then ready=1; break; fi; \
      if ! kill -0 "$mysql_pid" 2>/dev/null; then cat /var/log/mariadb-install.log >&2; exit 1; fi; \
      sleep 1; \
    done; \
    test "$ready" = 1; \
    printf '%s\n' \
      "CREATE DATABASE IF NOT EXISTS mediawiki CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" \
      "CREATE USER IF NOT EXISTS 'mediawiki'@'localhost' IDENTIFIED BY 'mediawiki-local-db-password';" \
      "CREATE USER IF NOT EXISTS 'mediawiki'@'127.0.0.1' IDENTIFIED BY 'mediawiki-local-db-password';" \
      "ALTER USER 'mediawiki'@'localhost' IDENTIFIED BY 'mediawiki-local-db-password';" \
      "ALTER USER 'mediawiki'@'127.0.0.1' IDENTIFIED BY 'mediawiki-local-db-password';" \
      "GRANT ALL PRIVILEGES ON mediawiki.* TO 'mediawiki'@'localhost';" \
      "GRANT ALL PRIVILEGES ON mediawiki.* TO 'mediawiki'@'127.0.0.1';" \
      'FLUSH PRIVILEGES;' \
      | mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot; \
    printf '%s\n' 'build-bootstrap-password' > /tmp/mediawiki-bootstrap-password; \
    php maintenance/install.php --dbtype mysql --dbserver 127.0.0.1 \
      --dbname mediawiki --dbuser mediawiki --dbpass mediawiki-local-db-password \
      --installdbuser mediawiki --installdbpass mediawiki-local-db-password \
      --server http://localhost --scriptpath '' --lang zh-cn \
      --passfile /tmp/mediawiki-bootstrap-password \
      --confpath /var/www/html 'MediaWiki' admin; \
    printf '%s\n' '$password = trim( file_get_contents( "/run/secrets/mediawiki_admin_password" ) ); $hash = \MediaWiki\MediaWikiServices::getInstance()->getPasswordFactory()->newFromPlaintext( $password )->toString(); $db = \MediaWiki\MediaWikiServices::getInstance()->getDBLoadBalancerFactory()->getMainLB()->getConnectionRef( 0 ); $db->update( "user", [ "user_password" => $hash ], [ "user_name" => "Admin" ], __METHOD__ );' | php maintenance/run.php eval; \
    rm -f /tmp/mediawiki-bootstrap-password; \
    printf '%s\n' \
      '' \
      '// Keep links and redirects usable through the published host port.' \
      "if ( isset( \$_SERVER['HTTP_HOST'] ) && preg_match( '/^[A-Za-z0-9.:[\\\\]-]+$/', \$_SERVER['HTTP_HOST'] ) ) {" \
      "    \$wgServer = 'http://' . \$_SERVER['HTTP_HOST'];" \
      '}' \
      "\$wgEnableUploads = true;" \
      '$wgFavicon = "$wgResourceBasePath/resources/assets/change-your-logo-icon.svg";' \
      '$wgPasswordPolicy["policies"]["bureaucrat"]["MinimalPasswordLength"] = 9;' \
      '$wgPasswordPolicy["policies"]["sysop"]["MinimalPasswordLength"] = 9;' \
      '$wgPasswordPolicy["policies"]["interface-admin"]["MinimalPasswordLength"] = 9;' \
      "\$wgGroupPermissions['user']['createaccount'] = false;" \
      >> /var/www/html/LocalSettings.php; \
    chown www-data:www-data /var/www/html/LocalSettings.php; \
    mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot shutdown; \
    wait "$mysql_pid"; \
    cp -a /var/lib/mysql /opt/mediawiki/mysql-seed; \
    rm -rf /var/lib/mysql/* /var/lib/mysql/.[!.]* /var/lib/mysql/..?* 2>/dev/null || true; \
    chown -R mysql:mysql /opt/mediawiki/mysql-seed /var/lib/mysql

WORKDIR /var/www/html
VOLUME ["/var/lib/mysql", "/var/www/html/images"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=60s --retries=12 CMD ["/usr/local/bin/mediawiki-healthcheck"]
ENTRYPOINT ["/usr/local/bin/mediawiki-entrypoint"]
