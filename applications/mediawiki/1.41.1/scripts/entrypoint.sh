#!/usr/bin/env bash
set -Eeuo pipefail

db_dir=/var/lib/mysql
socket=/run/mysqld/mysqld.sock

mkdir -p /run/mysqld "$db_dir" /var/www/html/images
reset_marker="$db_dir/.mediawiki-reset-requested"
if [[ -f "$reset_marker" ]]; then
  echo '恢复 MediaWiki 初始数据库和上传文件'
  rm -rf "$db_dir"/* "$db_dir"/.[!.]* "$db_dir"/..?* 2>/dev/null || true
  rm -rf /var/www/html/images/* /var/www/html/images/.[!.]* /var/www/html/images/..?* 2>/dev/null || true
  cp -a /opt/mediawiki/mysql-seed/. "$db_dir/"
  rm -f "$reset_marker"
elif [[ ! -d "$db_dir/mysql" ]]; then
  echo '复制 MediaWiki 初始数据库'
  cp -a /opt/mediawiki/mysql-seed/. "$db_dir/"
fi
chown -R mysql:mysql /run/mysqld "$db_dir"
chown -R www-data:www-data /var/www/html/images

mariadbd --user=mysql --datadir="$db_dir" --bind-address=127.0.0.1 \
  --socket="$socket" --pid-file=/run/mysqld/mysqld.pid --skip-name-resolve \
  --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci &
mysql_pid=$!
apache_pid=''

shutdown() {
  apachectl -k stop >/dev/null 2>&1 || true
  mariadb-admin --protocol=socket --socket="$socket" -uroot shutdown >/dev/null 2>&1 || true
  if [[ -n "$mysql_pid" ]]; then wait "$mysql_pid" 2>/dev/null || true; fi
  if [[ -n "$apache_pid" ]]; then wait "$apache_pid" 2>/dev/null || true; fi
}
trap shutdown TERM INT

ready=0
for attempt in $(seq 1 90); do
  if mariadb-admin --protocol=socket --socket="$socket" -uroot ping >/dev/null 2>&1; then
    ready=1
    break
  fi
  if ! kill -0 "$mysql_pid" 2>/dev/null; then
    echo 'MariaDB 在启动期间退出' >&2
    exit 1
  fi
  sleep 1
done
if [[ "$ready" != 1 ]]; then
  echo 'MariaDB 未在限定时间内就绪' >&2
  exit 1
fi

apachectl -DFOREGROUND &
apache_pid=$!

while kill -0 "$mysql_pid" 2>/dev/null && kill -0 "$apache_pid" 2>/dev/null; do
  sleep 1
done

if ! kill -0 "$mysql_pid" 2>/dev/null; then
  echo 'MariaDB unexpectedly exited' >&2
  exit 1
fi
echo 'Apache unexpectedly exited' >&2
exit 1
