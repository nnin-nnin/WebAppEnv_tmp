FROM owncloud/server:10.14.0@sha256:8f3a46b3ffa429eb8fbaf575e1af260c44789da6e94281d34cf16613095ff6c9

ARG SOURCE_COMMIT=f8c196c1d17abca4e8c2ce17e936cb9fe4ebd316

USER root

ENV APACHE_LISTEN=80 \
    APACHE_DOCUMENT_ROOT=/var/www/owncloud \
    OWNCLOUD_DATA_ROOT=/mnt/data \
    OWNCLOUD_DB_DIR=/var/lib/mysql \
    OWNCLOUD_DB_HOST=127.0.0.1:3306 \
    OWNCLOUD_DB_NAME=owncloud \
    OWNCLOUD_DB_USERNAME=owncloud \
    OWNCLOUD_DB_TYPE=mysql \
    OWNCLOUD_DOMAIN=localhost \
    OWNCLOUD_TRUSTED_DOMAINS=localhost,127.0.0.1

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        mariadb-client mariadb-server \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /run/mysqld /var/lib/mysql /mnt/data \
    && chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY source/owncloud-core/ /var/www/owncloud/
COPY scripts/entrypoint.sh /usr/local/bin/owncloud-all-in-one

RUN set -e \
    && chown -R www-data:root /var/www/owncloud \
    && chmod 755 /usr/local/bin/owncloud-all-in-one \
    && sed -i 's#\${APACHE_LISTEN}#80#g; s#\${APACHE_DOCUMENT_ROOT}#/var/www/owncloud#g; s#\${APACHE_SERVER_ADMIN}#webmaster@localhost#g; s#\${APACHE_ERROR_LOG}#/dev/stderr#g; s#\${APACHE_ACCESS_LOG}#/dev/stdout#g; s#\${APACHE_LOG_FORMAT}#combined#g' /etc/apache2/sites-enabled/default.conf \
    && sed -i 's#\${APACHE_LISTEN}#80#g' /etc/apache2/ports.conf

RUN --mount=type=secret,id=admin_password <<'BUILD_SCRIPT'
#!/usr/bin/env bash
set -euo pipefail

ADMIN_PASSWORD="$(cat /run/secrets/admin_password)"
test -n "${ADMIN_PASSWORD}"
echo 'initializing MariaDB seed'
rm -rf /var/lib/mysql/* /mnt/data/* /opt/owncloud-seed
mkdir -p /var/lib/mysql /run/mysqld /mnt/data/config /mnt/data/files \
  /opt/owncloud-seed/mysql /opt/owncloud-seed/config /opt/owncloud-seed/files
chown -R mysql:mysql /var/lib/mysql /run/mysqld
mysql_install_db --user=mysql --datadir=/var/lib/mysql >/dev/null
echo 'starting MariaDB seed server'
mysqld --user=mysql --datadir=/var/lib/mysql --bind-address=127.0.0.1 \
  --port=3306 --socket=/run/mysqld/mysqld.sock \
  --pid-file=/run/mysqld/mysqld.pid --skip-log-bin >/var/log/mysql-bootstrap.log 2>&1 &
DB_PID=$!
trap 'kill "${DB_PID}" 2>/dev/null || true' EXIT
for attempt in $(seq 1 60); do
  if mysqladmin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot ping >/dev/null 2>&1; then
    break
  fi
  if [[ "${attempt}" -eq 60 ]]; then
    cat /var/log/mysql-bootstrap.log >&2 || true
    exit 1
  fi
  sleep 1
done
echo 'creating ownCloud database'
mysql --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot -e \
  "CREATE DATABASE owncloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci; CREATE USER 'owncloud'@'127.0.0.1' IDENTIFIED BY 'owncloud-db-internal-10-14-0'; CREATE USER 'owncloud'@'localhost' IDENTIFIED BY 'owncloud-db-internal-10-14-0'; GRANT ALL PRIVILEGES ON owncloud.* TO 'owncloud'@'127.0.0.1'; GRANT ALL PRIVILEGES ON owncloud.* TO 'owncloud'@'localhost'; FLUSH PRIVILEGES;"
rm -rf /var/www/owncloud/config
ln -s /mnt/data/config /var/www/owncloud/config
chown -R www-data:root /mnt/data
cd /var/www/owncloud
echo 'installing ownCloud database and administrator'
/usr/bin/occ maintenance:install --no-interaction --database mysql \
  --database-host 127.0.0.1:3306 --database-name owncloud \
  --database-user owncloud --database-pass owncloud-db-internal-10-14-0 \
  --database-table-prefix oc_ --admin-user admin --admin-pass "${ADMIN_PASSWORD}" \
  --data-dir /mnt/data/files
/usr/bin/occ config:system:set trusted_domains 1 --value=127.0.0.1
/usr/bin/occ config:system:set trusted_domains 2 --value=localhost
/usr/bin/occ config:system:set overwrite.cli.url --value=http://localhost:18524
/usr/bin/occ background:cron
echo 'saving initialized seed data'
mysqladmin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot shutdown
wait "${DB_PID}"
trap - EXIT
cp -a /var/lib/mysql/. /opt/owncloud-seed/mysql/
cp -a /mnt/data/config/. /opt/owncloud-seed/config/
cp -a /mnt/data/files/. /opt/owncloud-seed/files/
chown -R mysql:mysql /opt/owncloud-seed/mysql
chown -R www-data:root /opt/owncloud-seed/config /opt/owncloud-seed/files
rm -rf /var/lib/mysql/* /mnt/data/* /var/www/owncloud/config
mkdir -p /var/lib/mysql /mnt/data
chown mysql:mysql /var/lib/mysql
BUILD_SCRIPT

WORKDIR /var/www/owncloud
EXPOSE 80
VOLUME ["/mnt/data", "/var/lib/mysql"]
HEALTHCHECK --interval=10s --timeout=5s --start-period=90s --retries=12 CMD ["bash", "-c", "mysqladmin --protocol=socket --socket=/run/mysqld/mysqld.sock -uowncloud -powncloud-db-internal-10-14-0 ping >/dev/null 2>&1 && curl -fsS http://127.0.0.1/status.php | grep -q '\"installed\":true'"]
ENTRYPOINT ["/usr/local/bin/owncloud-all-in-one"]
