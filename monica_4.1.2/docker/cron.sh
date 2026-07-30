#!/bin/sh
set -eu

test -d /var/spool/cron/crontabs
exec busybox crond -f -l 0 -L /proc/1/fd/1
