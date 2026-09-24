FROM espocrm:10.0.3-base

ARG MARIADB_SERVER_VERSION=1:10.6.27+maria~ubu2204

RUN printf '#!/bin/sh\nexit 101\n' > /usr/sbin/policy-rc.d \
    && apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates gnupg \
    && curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup \
      | bash -s -- \
        --os-type=ubuntu \
        --os-version=jammy \
        --mariadb-server-version=mariadb-10.6 \
        --skip-maxscale \
        --skip-tools \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      "mariadb-server=${MARIADB_SERVER_VERSION}" \
    && rm -f /usr/sbin/policy-rc.d \
    && rm -rf /var/lib/apt/lists/*

COPY resources/initial-data/app-data/ /var/www/html/data/
COPY resources/initial-data/espocrmdb.sql /usr/local/share/espocrm/espocrmdb.sql
COPY scripts/espocrm-entrypoint.sh /usr/local/bin/espocrm-entrypoint

RUN sed -i "s/'host' => 'db'/'host' => '127.0.0.1'/" /var/www/html/data/config-internal.php \
    && chown -R www-data:www-data /var/www/html/data \
    && chmod 755 /usr/local/bin/espocrm-entrypoint \
    && install -d -o mysql -g mysql /run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql

VOLUME ["/var/lib/mysql", "/var/www/html/data"]
EXPOSE 80

HEALTHCHECK --interval=10s --timeout=5s --retries=20 \
  CMD curl -fsS http://localhost/ >/dev/null || exit 1

ENTRYPOINT ["/usr/local/bin/espocrm-entrypoint"]
