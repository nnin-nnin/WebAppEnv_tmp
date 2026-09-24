#!/usr/bin/env bash
set -Eeuo pipefail

if [[ $# -lt 3 || $# -gt 5 ]]; then
    echo "Usage: $0 USERNAME PASSWORD EMAIL [FIRSTNAME] [LASTNAME]" >&2
    exit 2
fi
container="${MOODLE_CONTAINER:-}"
if [[ -z "$container" ]]; then
    container="$(docker ps --filter ancestor=yorem/moodle:4.4.0 --format '{{.ID}}' | head -n 1)"
fi
if [[ -z "$container" ]]; then
    echo 'Set MOODLE_CONTAINER to the running Moodle container.' >&2
    exit 2
fi

docker exec \
    -e "MOODLE_NEW_USERNAME=$1" \
    -e "MOODLE_NEW_PASSWORD=$2" \
    -e "MOODLE_NEW_EMAIL=$3" \
    -e "MOODLE_NEW_FIRSTNAME=${4:-Moodle}" \
    -e "MOODLE_NEW_LASTNAME=${5:-User}" \
    "$container" /usr/local/bin/php /usr/local/bin/moodle-register-user
