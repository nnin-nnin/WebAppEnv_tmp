#!/usr/bin/env bash
set -Eeuo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

docker compose -f docker/compose.yaml up -d

ADMIN_PWD="${DOLIBARR_PASSWORD:-${DOLIBARR_INITIAL_ADMIN_PASSWORD:-WcDoli!26-gK8tP3Y}}"

for i in {1..30}; do
  if bash scripts/healthcheck.sh >/dev/null 2>&1; then
    docker compose -f docker/compose.yaml exec -T application php -r '
      define("NOLOGIN", 1);
      require "/var/www/html/htdocs/master.inc.php";
      require_once DOL_DOCUMENT_ROOT."/core/lib/security.lib.php";
      $pwd = $argv[1];
      $hash = dol_hash($pwd);
      $db->query("UPDATE ".MAIN_DB_PREFIX."user SET pass_crypted = \"".$db->escape($hash)."\" WHERE login = \"admin\"");
    ' "$ADMIN_PWD" >/dev/null 2>&1 || true
    echo "Dolibarr 19.0.2 服务已成功启动并通过健康检查。"
    exit 0
  fi
  sleep 2
done

echo "Dolibarr 19.0.2 启动超时。" >&2
exit 1
