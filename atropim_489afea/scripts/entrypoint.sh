#!/usr/bin/env bash
set -Eeuo pipefail

mysql_data_dir=/var/lib/mysql
mysql_socket=/run/mysqld/mysqld.sock
mysql_pid_file=/run/mysqld/mysqld.pid
db_name="${ATROPIM_DB_NAME:-atrocore}"
db_user="${ATROPIM_DB_USER:-atrocore_user}"
db_password="${ATROPIM_DB_PASSWORD:-benchmark-only}"
admin_user="${BENCHMARK_ADMIN_USER:-admin}"
admin_password="${BENCHMARK_ADMIN_PASSWORD:-benchmark-only}"
base_url=http://127.0.0.1
bootstrap_marker=/var/www/html/data/.benchmark-bootstrap-complete
db_pid=""
app_pid=""
cron_pid=""
cookie_jar=""

cleanup() {
  local status=$?

  if [[ -n "$cookie_jar" ]]; then
    rm -f "$cookie_jar"
  fi
  if [[ -n "$cron_pid" ]] && kill -0 "$cron_pid" 2>/dev/null; then
    kill "$cron_pid" 2>/dev/null || true
  fi
  if [[ -n "$app_pid" ]] && kill -0 "$app_pid" 2>/dev/null; then
    kill "$app_pid" 2>/dev/null || true
  fi
  if [[ -n "$db_pid" ]] && kill -0 "$db_pid" 2>/dev/null; then
    mariadb-admin --socket="$mysql_socket" -u root shutdown 2>/dev/null || kill "$db_pid" 2>/dev/null || true
  fi
  wait 2>/dev/null || true
  exit "$status"
}

trap cleanup EXIT INT TERM

install -d -o mysql -g mysql /run/mysqld
chown -R mysql:mysql "$mysql_data_dir"
chown -R www-data:www-data /var/www/html/data /var/www/html/upload

if [[ ! -d "$mysql_data_dir/mysql" ]]; then
  mariadb-install-db --user=mysql --datadir="$mysql_data_dir" --skip-test-db >/dev/null
fi

mariadbd \
  --user=mysql \
  --datadir="$mysql_data_dir" \
  --socket="$mysql_socket" \
  --pid-file="$mysql_pid_file" \
  --bind-address=127.0.0.1 \
  --skip-name-resolve \
  &
db_pid=$!

for _ in {1..60}; do
  if mariadb-admin --socket="$mysql_socket" -u root ping >/dev/null 2>&1; then
    break
  fi
  if ! kill -0 "$db_pid" 2>/dev/null; then
    echo "MariaDB exited during startup" >&2
    exit 1
  fi
  sleep 1
done

if ! mariadb-admin --socket="$mysql_socket" -u root ping >/dev/null 2>&1; then
  echo "MariaDB did not become ready" >&2
  exit 1
fi

mariadb --socket="$mysql_socket" -u root <<SQL
CREATE DATABASE IF NOT EXISTS \`$db_name\`;
CREATE USER IF NOT EXISTS '$db_user'@'localhost' IDENTIFIED BY '$db_password';
CREATE USER IF NOT EXISTS '$db_user'@'127.0.0.1' IDENTIFIED BY '$db_password';
ALTER USER '$db_user'@'localhost' IDENTIFIED BY '$db_password';
ALTER USER '$db_user'@'127.0.0.1' IDENTIFIED BY '$db_password';
GRANT ALL PRIVILEGES ON \`$db_name\`.* TO '$db_user'@'localhost';
GRANT ALL PRIVILEGES ON \`$db_name\`.* TO '$db_user'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL

printf '%s\n' '* * * * * /usr/local/bin/php /var/www/html/index.php cron' | crontab -u www-data -
cron &
cron_pid=$!

apache2-foreground &
app_pid=$!

for _ in {1..60}; do
  if curl -fsS "$base_url/" >/dev/null 2>&1; then
    break
  fi
  if ! kill -0 "$app_pid" 2>/dev/null; then
    echo "Apache exited during startup" >&2
    exit 1
  fi
  sleep 1
done

if ! curl -fsS "$base_url/" >/dev/null 2>&1; then
  echo "AtroPIM did not become ready" >&2
  exit 1
fi

if [[ ! -f "$bootstrap_marker" ]]; then
  cookie_jar="$(mktemp)"
  db_response="$(curl -sS --max-time 30 \
    -c "$cookie_jar" \
    -H 'Accept-Language: en' \
    -H 'Content-Type: application/json' \
    -H 'Origin: http://127.0.0.1' \
    --data "{\"host\":\"127.0.0.1\",\"dbname\":\"$db_name\",\"user\":\"$db_user\",\"password\":\"$db_password\",\"port\":\"3306\"}" \
    -X POST "$base_url/api/v1/Installer/setDbSettings")"
  if ! grep -Eq '"(status|success)"[[:space:]]*:[[:space:]]*true|^true$' <<<"$db_response"; then
    printf 'AtroPIM database configuration failed:\n%s\n' "$db_response" >&2
    exit 1
  fi

  admin_response="$(curl -sS --max-time 30 \
    -b "$cookie_jar" \
    -c "$cookie_jar" \
    -H 'Accept-Language: en' \
    -H 'Content-Type: application/json' \
    -H 'Origin: http://127.0.0.1' \
    --data "{\"username\":\"$admin_user\",\"password\":\"$admin_password\",\"confirmPassword\":\"$admin_password\"}" \
    -X POST "$base_url/api/v1/Installer/createAdmin")"
  if ! grep -Eq '"(status|success)"[[:space:]]*:[[:space:]]*true|^true$' <<<"$admin_response"; then
    printf 'AtroPIM administrator initialization failed:\n%s\n' "$admin_response" >&2
    exit 1
  fi

  touch "$bootstrap_marker"
  chown www-data:www-data "$bootstrap_marker"
fi

set +e
wait -n "$db_pid" "$app_pid"
status=$?
set -e
exit "$status"
