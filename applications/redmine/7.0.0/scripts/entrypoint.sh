#!/usr/bin/env bash
set -Eeuo pipefail

app_dir=/usr/src/redmine
db_dir=/var/lib/mysql
db_socket=/run/mysqld/mysqld.sock

mkdir -p /run/mysqld "$app_dir/files" "$app_dir/log" "$app_dir/tmp" "$app_dir/public/plugin_assets"
chown -R mysql:mysql /run/mysqld "$db_dir"
chown -R redmine:redmine "$app_dir/files" "$app_dir/log" "$app_dir/tmp" "$app_dir/public/plugin_assets"

if [[ ! -d "$db_dir/redmine" ]]; then
  rm -rf "$db_dir"/*
  cp -a /usr/local/share/redmine-initial-db/. "$db_dir/"
  chown -R mysql:mysql "$db_dir"
fi

cleanup() {
  set +e
  [[ -n "${puma_pid:-}" ]] && kill "$puma_pid" 2>/dev/null || true
  [[ -n "${nginx_pid:-}" ]] && kill "$nginx_pid" 2>/dev/null || true
  [[ -n "${mariadb_pid:-}" ]] && mariadb-admin --protocol=socket --socket="$db_socket" -uroot shutdown >/dev/null 2>&1 || true
  [[ -n "${mariadb_pid:-}" ]] && kill "$mariadb_pid" 2>/dev/null || true
}
trap cleanup TERM INT EXIT

mysqld --user=mysql --datadir="$db_dir" --bind-address=127.0.0.1 --port=3306 --socket="$db_socket" --pid-file=/run/mysqld/mysqld.pid --console &
mariadb_pid=$!

db_ready=0
for _ in $(seq 1 90); do
  if mariadb-admin --protocol=tcp -h127.0.0.1 -uredmine -predmine-local-db ping >/dev/null 2>&1; then
    db_ready=1
    break
  fi
  sleep 1
done
if [[ "$db_ready" != 1 ]]; then
  echo 'MariaDB did not become ready' >&2
  exit 1
fi

cd "$app_dir"
bundle exec rake db:migrate RAILS_ENV=production >/dev/null

su -s /bin/bash -c 'cd /usr/src/redmine && bundle exec puma -e production -b tcp://127.0.0.1:3000 --workers 0 --threads 0:5' redmine &
puma_pid=$!

nginx -g 'daemon off;' &
nginx_pid=$!

set +e
wait -n "$puma_pid" "$nginx_pid"
status=$?
set -e
echo "A core process exited; stopping container (status ${status})" >&2
exit "$status"
