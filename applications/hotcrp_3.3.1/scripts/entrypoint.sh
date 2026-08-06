#!/usr/bin/env bash
set -Eeuo pipefail

mysql_data_dir="${MYSQL_DATA_DIR:-/var/lib/mysql}"
mysql_socket="/run/mysqld/mysqld.sock"
mysql_pid="/run/mysqld/mysqld.pid"
mkdir -p "$mysql_data_dir" /run/mysqld /var/www/html/docs /var/www/html/conf
chown -R mysql:mysql "$mysql_data_dir" /run/mysqld /var/www/html/docs

if [[ ! -d "$mysql_data_dir/mysql" ]]; then
  echo "初始化 MariaDB 数据目录"
  mariadb-install-db --user=mysql --datadir="$mysql_data_dir" --skip-test-db >/dev/null
fi

cleanup() {
  local code=$?
  trap - EXIT INT TERM
  if [[ -n "${apache_pid:-}" ]] && kill -0 "$apache_pid" 2>/dev/null; then
    kill -TERM "$apache_pid" 2>/dev/null || true
  fi
  if [[ -n "${mariadb_pid:-}" ]] && kill -0 "$mariadb_pid" 2>/dev/null; then
    mariadb-admin --protocol=socket --socket="$mysql_socket" -uroot shutdown >/dev/null 2>&1 || kill -TERM "$mariadb_pid" 2>/dev/null || true
  fi
  wait || true
  exit "$code"
}
trap cleanup EXIT INT TERM

echo "启动 MariaDB（容器内 127.0.0.1）"
mariadbd --user=mysql --datadir="$mysql_data_dir" \
  --socket="$mysql_socket" --pid-file="$mysql_pid" \
  --bind-address=127.0.0.1 --port=3306 --max_allowed_packet=32M \
  --skip-name-resolve --log-error=/run/mysqld/mariadb.err &
mariadb_pid=$!

for _ in $(seq 1 120); do
  if mariadb-admin --protocol=socket --socket="$mysql_socket" -uroot ping >/dev/null 2>&1; then
    break
  fi
  if ! kill -0 "$mariadb_pid" 2>/dev/null; then
    echo "MariaDB 启动失败" >&2
    exit 1
  fi
  sleep 1
done
if ! mariadb-admin --protocol=socket --socket="$mysql_socket" -uroot ping >/dev/null 2>&1; then
  echo "MariaDB 在 120 秒内未就绪" >&2
  exit 1
fi

mariadb --protocol=socket --socket="$mysql_socket" -uroot <<'SQL'
CREATE DATABASE IF NOT EXISTS hotcrp CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER IF NOT EXISTS 'hotcrp'@'localhost' IDENTIFIED BY 'hotcrp';
CREATE USER IF NOT EXISTS 'hotcrp'@'127.0.0.1' IDENTIFIED BY 'hotcrp';
GRANT ALL PRIVILEGES ON hotcrp.* TO 'hotcrp'@'localhost';
GRANT ALL PRIVILEGES ON hotcrp.* TO 'hotcrp'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL

if ! mariadb --protocol=socket --socket="$mysql_socket" -uroot -N -B \
    -e "SELECT 1 FROM information_schema.tables WHERE table_schema='hotcrp' AND table_name='Settings'" | grep -q '^1$'; then
  echo "导入 HotCRP 官方数据库 schema"
  mariadb --protocol=socket --socket="$mysql_socket" -uroot hotcrp < /var/www/html/src/schema.sql
fi

if ! mariadb --protocol=socket --socket="$mysql_socket" -uroot -N -B hotcrp \
    -e "SELECT 1 FROM ContactInfo WHERE email='admin@hotcrp.local' LIMIT 1" | grep -q '^1$'; then
  # HotCRP stores hashes as " $" followed by password_hash(), so there are
  # two consecutive dollar signs before the hash method.
  admin_hash="$(php -r 'echo " $" . password_hash("benchmark-only", PASSWORD_BCRYPT);')"
  sed "s|__ADMIN_PASSWORD_HASH__|$admin_hash|" \
    /opt/hotcrp/initial-data/database-seed.sql \
    | mariadb --protocol=socket --socket="$mysql_socket" -uroot hotcrp
fi

chown -R www-data:www-data /var/www/html/docs
echo "启动 Apache/PHP HotCRP"
apache2-foreground &
apache_pid=$!

while true; do
  if ! kill -0 "$mariadb_pid" 2>/dev/null; then
    echo "MariaDB 已退出，容器停止" >&2
    exit 1
  fi
  if ! kill -0 "$apache_pid" 2>/dev/null; then
    echo "Apache 已退出，容器停止" >&2
    exit 1
  fi
  sleep 2
done
