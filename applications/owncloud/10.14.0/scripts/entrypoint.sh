#!/usr/bin/env bash
set -Eeuo pipefail

DATA_ROOT="${OWNCLOUD_DATA_ROOT:-/mnt/data}"
DB_DIR="${OWNCLOUD_DB_DIR:-/var/lib/mysql}"
DB_SOCKET="/run/mysqld/mysqld.sock"
DB_PASSWORD='owncloud-db-internal-10-14-0'
SEED_ROOT='/opt/owncloud-seed'

if [[ -f /etc/entrypoint.d/99-apache.sh ]]; then
  # Reuse the fixed base image's Apache defaults without running its server hooks.
  set +u
  source /etc/entrypoint.d/99-apache.sh
  set -u
fi

export APACHE_RUN_USER="${APACHE_RUN_USER:-www-data}"
export APACHE_RUN_GROUP="${APACHE_RUN_GROUP:-www-data}"
export APACHE_RUN_DIR="${APACHE_RUN_DIR:-/var/run/apache2}"
export APACHE_LOCK_DIR="${APACHE_LOCK_DIR:-/var/lock/apache2}"
export APACHE_PID_FILE="${APACHE_PID_FILE:-${APACHE_RUN_DIR}/apache2.pid}"
export APACHE_LOG_DIR="${APACHE_LOG_DIR:-/var/log/apache2}"

mkdir -p "${DATA_ROOT}/config" "${DATA_ROOT}/files" "${DATA_ROOT}/sessions" "${DB_DIR}" /run/mysqld
mkdir -p "${APACHE_RUN_DIR}" "${APACHE_LOCK_DIR}" "${APACHE_LOG_DIR}"

if [[ ! -f "${DATA_ROOT}/config/config.php" ]]; then
  cp -a "${SEED_ROOT}/config/." "${DATA_ROOT}/config/"
fi
if [[ ! -f "${DATA_ROOT}/files/.ocdata" ]]; then
  cp -a "${SEED_ROOT}/files/." "${DATA_ROOT}/files/"
fi

if [[ ! -d "${DB_DIR}/owncloud" ]]; then
  if find "${DB_DIR}" -mindepth 1 -maxdepth 1 -print -quit | grep -q .; then
    echo 'Database directory is non-empty but has no ownCloud database; refusing to overwrite it.' >&2
    exit 1
  fi
  cp -a "${SEED_ROOT}/mysql/." "${DB_DIR}/"
fi

rm -rf /var/www/owncloud/config
ln -s "${DATA_ROOT}/config" /var/www/owncloud/config
chown -R www-data:root "${DATA_ROOT}"
chown -R mysql:mysql "${DB_DIR}" /run/mysqld

cleanup() {
  local status=$?
  trap - TERM INT HUP EXIT
  if [[ -n "${APACHE_PID:-}" ]] && kill -0 "${APACHE_PID}" 2>/dev/null; then
    kill -TERM "${APACHE_PID}" 2>/dev/null || true
  fi
  if [[ -n "${DB_PID:-}" ]] && kill -0 "${DB_PID}" 2>/dev/null; then
    mysqladmin --protocol=socket --socket="${DB_SOCKET}" -uroot shutdown >/dev/null 2>&1 || kill -TERM "${DB_PID}" 2>/dev/null || true
    wait "${DB_PID}" 2>/dev/null || true
  fi
  exit "${status}"
}
trap cleanup TERM INT HUP EXIT

mysqld --user=mysql --datadir="${DB_DIR}" --bind-address=127.0.0.1 --port=3306 --socket="${DB_SOCKET}" --pid-file=/run/mysqld/mysqld.pid --skip-log-bin &
DB_PID=$!

for attempt in $(seq 1 120); do
  if mysqladmin --protocol=socket --socket="${DB_SOCKET}" -uowncloud -p"${DB_PASSWORD}" ping >/dev/null 2>&1; then
    break
  fi
  if ! kill -0 "${DB_PID}" 2>/dev/null; then
    echo 'MariaDB exited during startup.' >&2
    exit 1
  fi
  if [[ "${attempt}" -eq 120 ]]; then
    echo 'Timed out waiting for MariaDB.' >&2
    exit 1
  fi
  sleep 1
done

apache2ctl -DFOREGROUND &
APACHE_PID=$!

while true; do
  if ! kill -0 "${DB_PID}" 2>/dev/null; then
    echo 'MariaDB exited unexpectedly.' >&2
    exit 1
  fi
  if ! kill -0 "${APACHE_PID}" 2>/dev/null; then
    echo 'Apache exited unexpectedly.' >&2
    exit 1
  fi
  sleep 2
done
