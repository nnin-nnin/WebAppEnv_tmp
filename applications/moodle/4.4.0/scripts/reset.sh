#!/usr/bin/env bash
set -Eeuo pipefail

container="${MOODLE_CONTAINER:-moodle-app}"
echo "This removes the Moodle application and database volumes for ${container}."
read -r -p 'Type RESET to continue: ' confirmation
if [[ "$confirmation" != RESET ]]; then
    echo 'Reset cancelled.'
    exit 1
fi
docker rm -f "$container" >/dev/null 2>&1 || true
docker volume rm "${MOODLE_DATA_VOLUME:-moodle-data}" "${MOODLE_DB_VOLUME:-moodle-db}" >/dev/null 2>&1 || true
echo 'Moodle data reset. Start a new container with the README command.'
