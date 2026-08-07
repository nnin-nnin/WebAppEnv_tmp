#!/usr/bin/env bash
set -Eeuo pipefail

mysql_data_dir="${MYSQL_DATA_DIR:-/var/lib/mysql}"
redis_data_dir="${REDIS_DATA_DIR:-/var/lib/redis}"
mysql_socket="${MYSQL_SOCKET:-/run/mysqld/mysqld.sock}"
seed_file="/opt/mall/database-seed.sql"
seed_marker="$mysql_data_dir/.mall-seed-imported"

mysql_pid=""
redis_pid=""
app_pid=""

cleanup() {
  local pid
  for pid in "$app_pid" "$redis_pid" "$mysql_pid"; do
    if [[ -n "$pid" ]] && kill -0 "$pid" 2>/dev/null; then
      kill "$pid" 2>/dev/null || true
    fi
  done
  for pid in "$app_pid" "$redis_pid" "$mysql_pid"; do
    if [[ -n "$pid" ]]; then
      wait "$pid" 2>/dev/null || true
    fi
  done
}

trap cleanup EXIT
trap 'exit 143' INT TERM

mkdir -p "$mysql_data_dir" "$redis_data_dir" /run/mysqld /var/log/mall
chown -R mysql:mysql "$mysql_data_dir" /run/mysqld
chown -R redis:redis "$redis_data_dir"
chown -R mysql:mysql /var/log/mall

if [[ ! -d "$mysql_data_dir/mysql" ]]; then
  echo "Initializing MariaDB data directory"
  mariadb-install-db --user=mysql --datadir="$mysql_data_dir" --skip-test-db >/dev/null
fi

echo "Starting MariaDB"
mysqld \
  --user=mysql \
  --datadir="$mysql_data_dir" \
  --socket="$mysql_socket" \
  --pid-file=/run/mysqld/mysqld.pid \
  --bind-address=127.0.0.1 \
  --port=3306 \
  --skip-name-resolve \
  --character-set-server=utf8mb4 \
  --collation-server=utf8mb4_unicode_ci \
  --skip-log-bin \
  --log-error=/var/log/mall/mysqld.err &
mysql_pid=$!

echo "Starting Redis"
runuser -u redis -- redis-server \
  --dir "$redis_data_dir" \
  --appendonly yes \
  --bind 127.0.0.1 \
  --port 6379 \
  --protected-mode yes &
redis_pid=$!

mysql_ready=false
for _ in $(seq 1 90); do
  if mariadb-admin --protocol=socket --socket="$mysql_socket" --user=root ping --silent >/dev/null 2>&1; then
    mysql_ready=true
    break
  fi
  if ! kill -0 "$mysql_pid" 2>/dev/null; then
    echo "MariaDB exited before becoming ready" >&2
    exit 1
  fi
  sleep 1
done
if [[ "$mysql_ready" != true ]]; then
  echo "MariaDB did not become ready within 90 seconds" >&2
  exit 1
fi

mariadb --protocol=socket --socket="$mysql_socket" --user=root <<'SQL'
CREATE DATABASE IF NOT EXISTS mall CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'mall'@'127.0.0.1' IDENTIFIED BY 'mall';
CREATE USER IF NOT EXISTS 'mall'@'localhost' IDENTIFIED BY 'mall';
ALTER USER 'mall'@'127.0.0.1' IDENTIFIED BY 'mall';
ALTER USER 'mall'@'localhost' IDENTIFIED BY 'mall';
GRANT ALL PRIVILEGES ON mall.* TO 'mall'@'127.0.0.1';
GRANT ALL PRIVILEGES ON mall.* TO 'mall'@'localhost';
FLUSH PRIVILEGES;
SQL

if [[ ! -f "$seed_marker" ]]; then
  echo "Importing mall initial database"
  mariadb --protocol=socket --socket="$mysql_socket" --user=root \
    --default-character-set=utf8mb4 mall < "$seed_file"
  touch "$seed_marker"
  chown mysql:mysql "$seed_marker"
else
  echo "Using existing mall database"
fi

echo "Starting mall-admin on port 80"
java ${JAVA_OPTS:--Xms256m -Xmx768m} -jar /opt/mall/mall-admin.jar \
  --spring.profiles.active=all-in-one \
  --spring.config.additional-location=file:/opt/mall/config/ \
  --server.port=80 &
app_pid=$!

while true; do
  if ! kill -0 "$mysql_pid" 2>/dev/null; then
    wait "$mysql_pid" || true
    echo "MariaDB exited; stopping all-in-one container" >&2
    exit 1
  fi
  if ! kill -0 "$redis_pid" 2>/dev/null; then
    wait "$redis_pid" || true
    echo "Redis exited; stopping all-in-one container" >&2
    exit 1
  fi
  if ! kill -0 "$app_pid" 2>/dev/null; then
    wait "$app_pid" || true
    echo "mall-admin exited; stopping all-in-one container" >&2
    exit 1
  fi
  sleep 2
done
