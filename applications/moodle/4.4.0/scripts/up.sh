#!/usr/bin/env bash
set -Eeuo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

docker compose -f docker/compose.yaml up -d

# Wait for service to be healthy
for i in {1..40}; do
  if bash scripts/healthcheck.sh >/dev/null 2>&1; then
    # Ensure administrator credentials match users.yaml
    docker compose -f docker/compose.yaml exec -T -u www-data application \
      php /var/www/html/admin/cli/reset_password.php \
      --username=admin --password="${MOODLE_PASSWORD:-WcMood!26-mQ6rS2F}" \
      --ignore-password-policy >/dev/null 2>&1 || true
    echo "Moodle 4.4.0 服务已成功启动并通过健康检查。"
    exit 0
  fi
  sleep 3
done

echo "Moodle 启动超时。" >&2
exit 1
