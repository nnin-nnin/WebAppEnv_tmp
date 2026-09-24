#!/usr/bin/env bash
set -Eeuo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

docker compose -f docker/compose.yaml up -d

for i in {1..60}; do
  if bash scripts/healthcheck.sh >/dev/null 2>&1; then
    container_id=$(docker compose -f docker/compose.yaml ps -q application 2>/dev/null || true)
    if [[ -n "$container_id" ]]; then
      admin_pwd="${REDMINE_PASSWORD:-WcRed!26-nK9vT5J}"
      if [[ "$admin_pwd" == "WcRed!26-nK9vT5J" ]]; then
        docker exec "$container_id" mariadb -uredmine -predmine-local-db -e "UPDATE redmine.users SET hashed_password='c227f737474d7ab8791e7fc940637e799ae42ff4', salt='9a63d0cbe34bbff72f12a96150c93de0', must_change_passwd=0 WHERE login='admin';" >/dev/null 2>&1 || true
      else
        docker exec -e REDMINE_PASSWORD="$admin_pwd" "$container_id" su -s /bin/bash -c "cd /usr/src/redmine && bundle exec rails runner 'u = User.find_by!(login: \"admin\"); p = ENV.fetch(\"REDMINE_PASSWORD\"); u.password = p; u.password_confirmation = p; u.must_change_passwd = false; u.save!(validate: false)'" redmine >/dev/null 2>&1 || true
      fi
    fi
    echo "Redmine 5.1.2 服务已成功启动并通过健康检查。"
    exit 0
  fi
  sleep 2
done

echo "Redmine 5.1.2 启动超时。" >&2
exit 1
