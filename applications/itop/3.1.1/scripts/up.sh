#!/bin/bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${APP_DIR}"

docker compose -f docker/compose.yaml up -d

echo "等待 iTop 服务就绪..."
for i in $(seq 1 40); do
  if bash "${APP_DIR}/scripts/healthcheck.sh" >/dev/null 2>&1; then
    ADMIN_PWD="${ITOP_PASSWORD:-WcITop!26-bL9hS5C}"
    for attempt in $(seq 1 5); do
      if docker compose -f docker/compose.yaml exec -T application php -r '
$pwd = $argv[1];
$hash = password_hash($pwd, PASSWORD_BCRYPT);
$db = new mysqli("localhost", "root", "", "itop", 0, "/run/mysqld/mysqld.sock");
if ($db->connect_errno) { exit(1); }
$stmt = $db->prepare("UPDATE priv_user_local SET password_hash = ? WHERE id = 1");
$stmt->bind_param("s", $hash);
$stmt->execute();
' "$ADMIN_PWD" >/dev/null 2>&1; then
        break
      fi
      sleep 1
    done
    echo "iTop 服务已就绪 (第 $i 次检查成功)"
    exit 0
  fi
  sleep 3
done

echo "iTop 未能在限定时间内就绪" >&2
bash "${APP_DIR}/scripts/healthcheck.sh" || true
exit 1
