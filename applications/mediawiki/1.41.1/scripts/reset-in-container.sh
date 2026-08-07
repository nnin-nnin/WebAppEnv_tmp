#!/usr/bin/env bash
set -Eeuo pipefail

reset_marker=/var/lib/mysql/.mediawiki-reset-requested
mkdir -p /var/lib/mysql
touch "$reset_marker"
chown mysql:mysql "$reset_marker"
echo '已请求在下一次容器启动时恢复镜像内的初始数据库和上传文件。'
