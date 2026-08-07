#!/usr/bin/env bash
set -Eeuo pipefail

mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot ping >/dev/null 2>&1
curl --fail --silent --show-error --connect-timeout 3 --max-time 5 \
    http://127.0.0.1/auth/login >/tmp/leantime-healthcheck.html
grep -Eiq 'name="username"|headlines.login|Leantime' /tmp/leantime-healthcheck.html
