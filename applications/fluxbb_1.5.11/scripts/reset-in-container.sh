#!/bin/bash
set -Eeuo pipefail
mysql --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot <<'SQL'
DROP DATABASE IF EXISTS fluxbb;
CREATE DATABASE fluxbb CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER IF NOT EXISTS 'fluxbb'@'127.0.0.1' IDENTIFIED BY 'benchmark-db-only';
GRANT ALL PRIVILEGES ON fluxbb.* TO 'fluxbb'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL
rm -f /var/lib/fluxbb/config.php /var/lib/fluxbb/initialized
echo 'FluxBB data cleared; restart the container to re-run the embedded installer.'
