#!/usr/bin/env bash
set -Eeuo pipefail

BASE_URL=${NEXTCLOUD_URL:-http://127.0.0.1:18522}
USERNAME=${NEXTCLOUD_USERNAME:-admin}
: "${NEXTCLOUD_PASSWORD:?NEXTCLOUD_PASSWORD must be supplied through the controlled environment}"

http_code=$(curl --silent --show-error --output /dev/null --write-out '%{http_code}' \
    --user "$USERNAME:$NEXTCLOUD_PASSWORD" \
    --request PROPFIND \
    --header 'Depth: 0' \
    "$BASE_URL/remote.php/dav/files/$USERNAME/")
if [[ "$http_code" != 207 ]]; then
    echo "Nextcloud login failed for $USERNAME (HTTP $http_code)" >&2
    exit 1
fi
echo "Nextcloud login succeeded for $USERNAME"

