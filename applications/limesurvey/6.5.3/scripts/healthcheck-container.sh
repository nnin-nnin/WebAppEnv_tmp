#!/usr/bin/env bash
set -Eeuo pipefail
mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot ping >/dev/null
probe_file="$(mktemp)"
trap 'rm -f "$probe_file"' EXIT
curl --fail --silent --show-error --max-time 5 --output "$probe_file" http://127.0.0.1/index.php
grep -Eiq 'LimeSurvey|Administration|login' "$probe_file"
