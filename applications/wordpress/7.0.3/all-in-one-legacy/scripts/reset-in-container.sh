#!/usr/bin/env bash
set -Eeuo pipefail
mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot -e \
  "DROP DATABASE IF EXISTS wordpress; CREATE DATABASE wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

