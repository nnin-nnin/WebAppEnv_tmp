#!/usr/bin/env bash
set -Eeuo pipefail

APP_ROOT=/var/www/MintHCM
DB_DIR=${MARIADB_DATADIR:-/var/lib/mysql}
DB_NAME=${MARIADB_DATABASE:-minthcm}
DB_USER=${MARIADB_USER:-minthcm}
DB_PASSWORD=${MARIADB_PASSWORD:-minthcm-local-db}
ES_HOME=${ES_HOME:-/usr/share/elasticsearch}
ES_DATA=${ES_DATA:-/var/lib/elasticsearch}
APP_URL=${MINTHCM_URL:-http://localhost:18520}

mysql_pid=
es_pid=
apache_pid=
cron_pid=

cleanup() {
    set +e
    [ -n "${apache_pid}" ] && kill -TERM "${apache_pid}" 2>/dev/null || true
    [ -n "${cron_pid}" ] && kill -TERM "${cron_pid}" 2>/dev/null || true
    [ -n "${es_pid}" ] && kill -TERM "${es_pid}" 2>/dev/null || true
    [ -n "${mysql_pid}" ] && kill -TERM "${mysql_pid}" 2>/dev/null || true
    sleep 2
    [ -n "${es_pid}" ] && kill -KILL "${es_pid}" 2>/dev/null || true
    [ -n "${mysql_pid}" ] && kill -KILL "${mysql_pid}" 2>/dev/null || true
}
trap cleanup EXIT TERM INT

mkdir -p "${DB_DIR}" /run/mysqld "${ES_DATA}" /var/log/minthcm
chown mysql:mysql /run/mysqld
chown -R elasticsearch:elasticsearch "${ES_DATA}"

if [ ! -d "${DB_DIR}/mysql" ]; then
    mariadb-install-db --user=mysql --datadir="${DB_DIR}" >/var/log/minthcm/mariadb-init.log 2>&1
fi

mariadbd \
    --user=mysql \
    --datadir="${DB_DIR}" \
    --socket=/run/mysqld/mysqld.sock \
    --pid-file=/run/mysqld/mysqld.pid \
    --bind-address=127.0.0.1 \
    --port=3306 \
    --skip-name-resolve \
    --log-error=/var/log/minthcm/mariadb.log &
mysql_pid=$!

for _ in $(seq 1 90); do
    if mariadb-admin --protocol=socket -uroot ping >/dev/null 2>&1; then break; fi
    if ! kill -0 "${mysql_pid}" 2>/dev/null; then exit 1; fi
    sleep 1
done
mariadb-admin --protocol=socket -uroot ping >/dev/null 2>&1 || exit 1

mariadb --protocol=socket -uroot <<SQL
CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';
CREATE USER IF NOT EXISTS '${DB_USER}'@'127.0.0.1' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'127.0.0.1' WITH GRANT OPTION;
CREATE DATABASE IF NOT EXISTS ${DB_NAME} CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
FLUSH PRIVILEGES;
SQL

if [ -s "${APP_ROOT}/legacy/config.php" ]; then
    mariadb --protocol=socket -uroot <<SQL
CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';
CREATE USER IF NOT EXISTS '${DB_USER}'@'127.0.0.1' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'127.0.0.1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SQL
fi

if ! curl -fsS --max-time 3 http://127.0.0.1:9200/ >/dev/null 2>&1; then
    mkdir -p "${ES_DATA}"
    chown -R elasticsearch:elasticsearch "${ES_DATA}"
    su -s /bin/bash elasticsearch -c "ES_JAVA_OPTS='${ES_JAVA_OPTS:--Xms128m -Xmx128m -XX:MaxDirectMemorySize=512m}' ${ES_HOME}/bin/elasticsearch -Epath.data='${ES_DATA}' -Enetwork.host=127.0.0.1 -Ehttp.port=9200 -Ediscovery.type=single-node -Expack.security.enabled=false" >>/proc/1/fd/1 2>>/proc/1/fd/2 &
    es_pid=$!
fi

for _ in $(seq 1 120); do
    if curl -fsS --max-time 3 http://127.0.0.1:9200/ 2>/dev/null | grep -q '"version"'; then break; fi
    if [ -n "${es_pid}" ] && ! kill -0 "${es_pid}" 2>/dev/null; then exit 1; fi
    sleep 1
done
curl -fsS --max-time 5 http://127.0.0.1:9200/ >/dev/null 2>&1 || exit 1

if [ ! -s "${APP_ROOT}/legacy/config.php" ] || [ ! -f "${APP_ROOT}/.minthcm-installed" ]; then
    admin_password=${MINTHCM_ADMIN_PASSWORD:-}
    if [ -z "${admin_password}" ]; then
        echo 'MintHCM is not initialized: provide MINTHCM_ADMIN_PASSWORD through a controlled channel.' >&2
        exit 1
    fi
    umask 077
    cat > "${APP_ROOT}/configMint4" <<EOF
admin
${admin_password}
127.0.0.1
3306
${DB_USER}
${DB_PASSWORD}
${DB_NAME}
utf8mb4_general_ci
localhost
9200
elastic
changeme
no
no
${APP_URL}
/var/www
no
EOF
    chown www-data:www-data "${APP_ROOT}/configMint4"
    install_status=0
    (cd "${APP_ROOT}" && php MintCLI install < configMint4 > /var/log/minthcm/install.log 2>&1) || install_status=$?
    if [ "${install_status}" -ne 0 ] || [ ! -s "${APP_ROOT}/legacy/config.php" ]; then
        rm -f "${APP_ROOT}/configMint4"
        echo "MintHCM installation failed with status ${install_status}; no application configuration was created." >&2
        exit 1
    fi
    rm -f "${APP_ROOT}/configMint4" "${APP_ROOT}/install.log" "${APP_ROOT}/index.php"
    if [ -f "${APP_ROOT}/vue/dist/index.html" ]; then cp -f "${APP_ROOT}/vue/dist/index.html" "${APP_ROOT}/index.html"; chmod 644 "${APP_ROOT}/index.html"; fi
    touch "${APP_ROOT}/.minthcm-installed"
    unset MINTHCM_ADMIN_PASSWORD
fi

umask 022
cat > "${APP_ROOT}/.htaccess" <<'EOF'
<IfModule mod_rewrite.c>
    Options +SymLinksIfOwnerMatch
    RewriteEngine On
    RewriteBase /
    RewriteRule ^legacy/(.*?)$ legacy/index.php/$1 [L]
    RewriteRule ^api/(.*?)$ api/index.php [L]
    RewriteRule ^index.php$ legacy/index.php [L]
    RewriteRule ^favicon.ico$ favicon.ico [L]
    RewriteRule ^bg.jpg$ bg.jpg [L]
    RewriteRule .* index.html [L]
</IfModule>
EOF
chmod 644 "${APP_ROOT}/.htaccess"

chown -R www-data:www-data "${APP_ROOT}/legacy/cache" "${APP_ROOT}/legacy/custom" "${APP_ROOT}/legacy/data" "${APP_ROOT}/legacy/upload"
cron -f &
cron_pid=$!
apache2ctl -D FOREGROUND &
apache_pid=$!

while :; do
    if ! kill -0 "${mysql_pid}" 2>/dev/null; then exit 1; fi
    if [ -n "${es_pid}" ] && ! kill -0 "${es_pid}" 2>/dev/null; then exit 1; fi
    if ! kill -0 "${apache_pid}" 2>/dev/null; then exit 1; fi
    sleep 3
done
