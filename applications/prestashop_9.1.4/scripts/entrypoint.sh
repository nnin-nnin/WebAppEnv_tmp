#!/usr/bin/env bash
set -Eeuo pipefail

APP_ROOT=${APP_ROOT:-/var/www/html}
DB_DIR=${DB_DIR:-/var/lib/mysql}
DB_SOCKET=${DB_SOCKET:-/run/mysqld/mysqld.sock}
DB_NAME=${DB_NAME:-prestashop}
DB_USER=${DB_USER:-prestashop}
DB_PASSWORD=${DB_PASSWORD:-prestashop}
DB_PREFIX=${DB_PREFIX:-ps_}
PS_DOMAIN=${PS_DOMAIN:-localhost:18401}
ADMIN_EMAIL=${ADMIN_EMAIL:-admin@example.com}
ADMIN_PASSWORD=${ADMIN_PASSWORD:-benchmark-only}
ADMIN_FIRSTNAME=${ADMIN_FIRSTNAME:-Admin}
ADMIN_LASTNAME=${ADMIN_LASTNAME:-User}
PS_COUNTRY=${PS_COUNTRY:-us}
PS_LANGUAGE=${PS_LANGUAGE:-en}
PS_INSTALL_DEMO_PRODUCTS=${PS_INSTALL_DEMO_PRODUCTS:-1}

log() { printf '[prestashop] %s\n' "$*"; }
die() { log "ERROR: $*" >&2; exit 1; }

[[ "$DB_NAME" =~ ^[A-Za-z0-9_]+$ ]] || die 'DB_NAME contains unsupported characters'
[[ "$DB_USER" =~ ^[A-Za-z0-9_]+$ ]] || die 'DB_USER contains unsupported characters'
[[ "$DB_PREFIX" =~ ^[A-Za-z0-9_]+$ ]] || die 'DB_PREFIX contains unsupported characters'

mkdir -p /run/mysqld "$DB_DIR" "$APP_ROOT/var/cache/prod" "$APP_ROOT/var/logs" "$APP_ROOT/var/sessions"
chown -R mysql:mysql /run/mysqld "$DB_DIR"
chown -R www-data:www-data "$APP_ROOT/app/config" "$APP_ROOT/var" "$APP_ROOT/img" "$APP_ROOT/upload" "$APP_ROOT/download"

if [[ ! -d "$DB_DIR/mysql" ]]; then
  log '初始化 MariaDB 数据目录'
  mariadb-install-db --user=mysql --datadir="$DB_DIR" --skip-test-db >/dev/null
fi

log '启动容器内 MariaDB'
mysqld --user=mysql --datadir="$DB_DIR" --socket="$DB_SOCKET" --port=3306 --bind-address=127.0.0.1 --skip-name-resolve --pid-file=/run/mysqld/mysqld.pid &
DB_PID=$!

cleanup() {
  trap - TERM INT EXIT
  if kill -0 "$DB_PID" 2>/dev/null; then
    log '停止 MariaDB'
    mysqladmin --protocol=socket --socket="$DB_SOCKET" -uroot shutdown >/dev/null 2>&1 || kill -TERM "$DB_PID" 2>/dev/null || true
  fi
  if [[ -n "${APACHE_PID:-}" ]] && kill -0 "$APACHE_PID" 2>/dev/null; then
    kill -TERM "$APACHE_PID" 2>/dev/null || true
  fi
}
trap cleanup TERM INT EXIT

for attempt in $(seq 1 120); do
  if ! kill -0 "$DB_PID" 2>/dev/null; then
    die 'MariaDB 在启动等待期间退出'
  fi
  if mariadb-admin --protocol=socket --socket="$DB_SOCKET" -uroot ping >/dev/null 2>&1; then
    break
  fi
  [[ "$attempt" -eq 120 ]] && die 'MariaDB 120 秒内未就绪'
  sleep 1
done

log '创建应用数据库和最小权限数据库用户'
mariadb --protocol=socket --socket="$DB_SOCKET" -uroot <<SQL
CREATE DATABASE IF NOT EXISTS \`$DB_NAME\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '$DB_USER'@'127.0.0.1' IDENTIFIED BY '$DB_PASSWORD';
ALTER USER '$DB_USER'@'127.0.0.1' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL

if [[ ! -f "$APP_ROOT/app/config/parameters.php" ]]; then
  log '运行 PrestaShop 官方 CLI 安装器（首次启动）'
  cd "$APP_ROOT"
  runuser -u www-data -- php "$PS_FOLDER_INSTALL/index_cli.php" \
    --domain="$PS_DOMAIN" \
    --db_server=127.0.0.1:3306 \
    --db_name="$DB_NAME" \
    --db_user="$DB_USER" \
    --db_password="$DB_PASSWORD" \
    --prefix="$DB_PREFIX" \
    --firstname="$ADMIN_FIRSTNAME" \
    --lastname="$ADMIN_LASTNAME" \
    --password="$ADMIN_PASSWORD" \
    --email="$ADMIN_EMAIL" \
    --language="$PS_LANGUAGE" \
    --country="$PS_COUNTRY" \
    --all_languages=0 \
    --newsletter=0 \
    --send_email=0 \
    --ssl=0 \
    --fixtures="$PS_INSTALL_DEMO_PRODUCTS" \
    --db_clear=1 \
    --db_create=0
  touch "$DB_DIR/.prestashop-installed"
  chown mysql:mysql "$DB_DIR/.prestashop-installed"
else
  log '检测到已有 PrestaShop 配置，跳过重复安装'
fi

rm -f "$APP_ROOT/var/cache/prod"/*.php 2>/dev/null || true
chown -R www-data:www-data "$APP_ROOT/app/config" "$APP_ROOT/var" "$APP_ROOT/img" "$APP_ROOT/upload" "$APP_ROOT/download"
log "启动 Apache；浏览器入口 http://${PS_DOMAIN}/，后台 http://${PS_DOMAIN}/${PS_FOLDER_ADMIN}/login"

apache2-foreground &
APACHE_PID=$!
while kill -0 "$APACHE_PID" 2>/dev/null; do
  if ! kill -0 "$DB_PID" 2>/dev/null; then
    log 'MariaDB 异常退出，停止 Apache' >&2
    kill -TERM "$APACHE_PID" 2>/dev/null || true
    wait "$APACHE_PID" || true
    exit 1
  fi
  sleep 1
done
wait "$APACHE_PID"
