FROM php:8.3.33-apache-bookworm@sha256:973e11c67c1c81e7811077a0efa0f910cf903af0ba972cab6ba0c0e15913c771

ARG DEBIAN_FRONTEND=noninteractive
ENV APACHE_DOCUMENT_ROOT=/var/www/html \
    APP_DB_NAME=oscommerce \
    APP_DB_USER=oscommerce \
    APP_DB_PASSWORD=oscommerce-internal \
    APP_PUBLIC_URL=http://127.0.0.1:18402 \
    TZ=Asia/Shanghai

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        mariadb-server mariadb-client libfreetype6-dev libjpeg62-turbo-dev \
        libpng-dev libzip-dev libicu-dev libonig-dev libcurl4-openssl-dev locales \
    && sed -i 's/^# *en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" pdo_mysql mysqli curl gd mbstring zip intl \
    && a2enmod rewrite headers \
    && rm -rf /var/lib/apt/lists/* /var/lib/mysql/* /var/www/html/*

COPY source/oscommerce2/catalog/ /var/www/html/
COPY source/oscommerce2/catalog/includes/OSC/Schema/ /opt/oscommerce/bootstrap/Schema/
COPY resources/initial-data/database-seed.sql /opt/oscommerce/bootstrap/oscommerce.sql
COPY scripts/entrypoint.sh scripts/initialize.php /opt/oscommerce/

RUN sed -i \
        -e 's/public function exec(\$statement)/public function exec(string \$statement): int|false/' \
        -e 's/public function prepare(\$statement, \$driver_options = null)/public function prepare(string \$statement, array \$driver_options = []): \\PDOStatement|false/' \
        -e 's/public function query(\$statement)/public function query(string \$statement, ?int \$fetchMode = null, mixed ...\$fetchModeArgs): \\PDOStatement|false/' \
        /var/www/html/includes/OSC/OM/Db.php \
    && sed -i -E '/public function (bindValue|execute|fetch|fetchAll)/i #[\\ReturnTypeWillChange]' \
       /var/www/html/includes/OSC/OM/DbStatement.php \
    && sed -i -E \
       -e 's|public function fetchAll(.*)|public function fetchAll(int \$fetch_style = \\PDO::FETCH_DEFAULT, mixed ...\$args): array|' \
       -e 's|parent::fetchAll(.*)|parent::fetchAll(\$fetch_style, ...\$args);|' \
       /var/www/html/includes/OSC/OM/DbStatement.php \
    && sed -i 's/function(\&\$v, \&\$k)/function(\&\$v, \$k)/' /var/www/html/includes/OSC/OM/Db.php \
    && mkdir -p /var/log/mysql \
    && mkdir -p /run/mysqld /var/lib/oscommerce /var/www/html/includes/OSC/Work/Cache \
        /var/www/html/includes/OSC/Work/Logs /var/www/html/includes/OSC/Work/Session \
    && chown -R mysql:mysql /run/mysqld /var/lib/mysql /var/lib/oscommerce \
    && chown -R www-data:www-data /var/www/html/includes/OSC/Work /var/www/html/images \
        /var/www/html/admin/includes/backups

WORKDIR /var/www/html
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=60s --retries=12 \
    CMD curl -fsS --max-time 4 http://127.0.0.1/ >/dev/null || exit 1
ENTRYPOINT ["/opt/oscommerce/entrypoint.sh"]
