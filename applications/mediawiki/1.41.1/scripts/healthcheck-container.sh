#!/usr/bin/env bash
set -Eeuo pipefail

page=$(curl --fail --location --silent --show-error --max-time 4 http://127.0.0.1/index.php)
if ! printf '%s' "$page" | grep -Eqi 'MediaWiki|Special:|mw-ui|mediawiki'; then
  exit 1
fi
mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot ping >/dev/null
