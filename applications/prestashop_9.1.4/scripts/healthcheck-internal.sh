#!/usr/bin/env bash
set -Eeuo pipefail

mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot ping >/dev/null 2>&1
test -f /var/www/html/app/config/parameters.php
curl -fsS --max-time 4 http://localhost/ >/dev/null
