#!/usr/bin/env bash
set -Eeuo pipefail

readonly MOODLE_ROOT=/var/www/html
readonly MOODLE_DATA=/var/www/moodledata
readonly MYSQL_DATA=/var/lib/mysql
readonly MYSQL_SOCKET=/run/mysqld/mysqld.sock
readonly MOODLE_WWWROOT="${MOODLE_WWWROOT:-http://localhost:18521}"
mysql_pid=''
apache_pid=''

shutdown() {
    trap - TERM INT EXIT
    if [[ -n "${apache_pid}" ]] && kill -0 "${apache_pid}" 2>/dev/null; then
        kill -TERM "${apache_pid}" 2>/dev/null || true
    fi
    if [[ -n "${mysql_pid}" ]] && kill -0 "${mysql_pid}" 2>/dev/null; then
        mariadb-admin --protocol=socket --socket="${MYSQL_SOCKET}" -uroot shutdown >/dev/null 2>&1 || kill -TERM "${mysql_pid}" 2>/dev/null || true
    fi
    wait || true
}
trap shutdown TERM INT EXIT

install -d -o mysql -g mysql -m 0755 /run/mysqld "${MYSQL_DATA}"
if [[ ! -d "${MYSQL_DATA}/mysql" ]]; then
    cp -a /opt/moodle-db-seed/. "${MYSQL_DATA}/"
    chown -R mysql:mysql "${MYSQL_DATA}"
fi

install -d -o www-data -g www-data -m 2770 "${MOODLE_DATA}"
if [[ ! -e "${MOODLE_DATA}/.moodledata-seeded" ]]; then
    cp -a /opt/moodledata-seed/. "${MOODLE_DATA}/"
    touch "${MOODLE_DATA}/.moodledata-seeded"
    chown -R www-data:www-data "${MOODLE_DATA}"
fi

cat > "${MOODLE_ROOT}/config.php" <<PHP_CONFIG
<?php
unset(\$CFG);
global \$CFG;
\$CFG = new stdClass();
\$CFG->dbtype = 'mariadb';
\$CFG->dblibrary = 'native';
\$CFG->dbhost = '127.0.0.1';
\$CFG->dbname = 'moodle';
\$CFG->dbuser = 'moodle';
\$CFG->dbpass = 'moodle-db-internal';
\$CFG->prefix = 'mdl_';
\$CFG->dboptions = ['dbpersist' => false, 'dbsocket' => false, 'dbport' => ''];
\$CFG->wwwroot = '${MOODLE_WWWROOT}';
\$CFG->dataroot = '${MOODLE_DATA}';
\$CFG->admin = 'admin';
\$CFG->directorypermissions = 02770;
require_once(__DIR__ . '/lib/setup.php');
PHP_CONFIG
chown www-data:www-data "${MOODLE_ROOT}/config.php"
chmod 0640 "${MOODLE_ROOT}/config.php"

mysqld --user=mysql --datadir="${MYSQL_DATA}" --socket="${MYSQL_SOCKET}" \
    --pid-file=/run/mysqld/mysqld.pid --skip-networking=0 --bind-address=127.0.0.1 \
    --console &
mysql_pid=$!
for _ in $(seq 1 60); do
    if mariadb-admin --protocol=socket --socket="${MYSQL_SOCKET}" -uroot ping >/dev/null 2>&1; then
        break
    fi
    if ! kill -0 "${mysql_pid}" 2>/dev/null; then
        echo 'Moodle database process exited during startup.' >&2
        exit 1
    fi
    sleep 1
done
mariadb-admin --protocol=socket --socket="${MYSQL_SOCKET}" -uroot ping >/dev/null 2>&1

apache2-foreground &
apache_pid=$!
wait -n "${mysql_pid}" "${apache_pid}"
status=$?
echo "A core Moodle process exited with status ${status}." >&2
exit "${status}"
