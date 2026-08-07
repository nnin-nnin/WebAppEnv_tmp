#!/usr/bin/env bash
set -u
mariadb-admin --protocol=socket -uroot ping >/dev/null 2>&1 || exit 1
pgrep -u elasticsearch -f 'org.elasticsearch.bootstrap.Elasticsearch' >/dev/null 2>&1 || exit 1
curl -fsS --max-time 4 http://127.0.0.1/ | grep -Eq '<div id="app"|/assets/[^" ]+\.js' || exit 1
