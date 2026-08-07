#!/usr/bin/env bash
set -Eeuo pipefail

docker run -d --name "${MOODLE_CONTAINER:-moodle-app}" -p "${MOODLE_PORT:-18521}:80" \
    -v "${MOODLE_DATA_VOLUME:-moodle-data}:/var/www/moodledata" \
    -v "${MOODLE_DB_VOLUME:-moodle-db}:/var/lib/mysql" \
    asteriskax001/sop-moodle:4.4.0
