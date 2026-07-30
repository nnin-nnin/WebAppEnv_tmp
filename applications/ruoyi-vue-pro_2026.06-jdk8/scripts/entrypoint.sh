#!/usr/bin/env bash
set -Eeuo pipefail

mysql_root_password="${MYSQL_ROOT_PASSWORD:-123456}"
mysql_database="${MYSQL_DATABASE:-ruoyi-vue-pro}"
java_pid=0
mysql_pid=0
redis_pid=0
nginx_pid=0

mkdir -p /var/lib/redis /var/lib/yudao/logs /var/www/yudao-ui
chown -R redis:redis /var/lib/redis

stop_children() {
  local exit_code="${1:-0}"
  trap - TERM INT HUP
  for pid in "$nginx_pid" "$java_pid" "$redis_pid" "$mysql_pid"; do
    if [[ "$pid" -gt 0 ]] && kill -0 "$pid" 2>/dev/null; then
      kill -TERM "$pid" 2>/dev/null || true
    fi
  done
  wait || true
  exit "$exit_code"
}

trap 'stop_children 143' TERM INT HUP

su -s /bin/sh redis -c \
  'exec redis-server --bind 127.0.0.1 --port 6379 --dir /var/lib/redis --appendonly yes --daemonize no' &
redis_pid=$!

export MYSQL_ROOT_PASSWORD="$mysql_root_password"
export MYSQL_DATABASE="$mysql_database"
export MYSQL_ALLOW_EMPTY_PASSWORD=""
/usr/local/bin/docker-entrypoint.sh mysqld --skip-name-resolve &
mysql_pid=$!

echo "Waiting for Redis and MySQL initialization..."
for attempt in $(seq 1 180); do
  redis_ok=0
  mysql_ok=0
  redis-cli -h 127.0.0.1 ping 2>/dev/null | grep -q '^PONG$' && redis_ok=1 || true
  mysqladmin --protocol=TCP --host=127.0.0.1 --user=root --password="$mysql_root_password" ping --silent 2>/dev/null && mysql_ok=1 || true
  if [[ "$redis_ok" -eq 1 && "$mysql_ok" -eq 1 ]]; then
    break
  fi
  if ! kill -0 "$redis_pid" 2>/dev/null || ! kill -0 "$mysql_pid" 2>/dev/null; then
    echo "Redis or MySQL exited during initialization" >&2
    stop_children 1
  fi
  if [[ "$attempt" -eq 180 ]]; then
    echo "Timed out waiting for Redis/MySQL" >&2
    stop_children 1
  fi
  sleep 1
done

echo "Redis and MySQL are ready; starting Spring Boot and Nginx..."
read -r -a java_opts_array <<< "${JAVA_OPTS:--Xms512m -Xmx512m -Djava.security.egd=file:/dev/./urandom}"
java "${java_opts_array[@]}" -jar /yudao-server/app.jar \
  --spring.profiles.active=all-in-one \
  --spring.config.additional-location=optional:file:/yudao-server/config/ &
java_pid=$!

nginx -g 'daemon off;' &
nginx_pid=$!

while true; do
  for service in "mysql:$mysql_pid" "redis:$redis_pid" "spring-boot:$java_pid" "nginx:$nginx_pid"; do
    service_name="${service%%:*}"
    service_pid="${service##*:}"
    if ! kill -0 "$service_pid" 2>/dev/null; then
      echo "$service_name exited unexpectedly" >&2
      stop_children 1
    fi
  done
  sleep 2
done
