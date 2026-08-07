#!/usr/bin/env bash
set -Eeuo pipefail

if [[ $# -ne 2 ]]; then
    echo "Usage: NEXTCLOUD_PASSWORD=... $0 USERNAME PASSWORD" >&2
    exit 2
fi
BASE_URL=${NEXTCLOUD_URL:-http://127.0.0.1:18522}
ADMIN_USERNAME=${NEXTCLOUD_USERNAME:-admin}
: "${NEXTCLOUD_PASSWORD:?NEXTCLOUD_PASSWORD must be supplied through the controlled environment}"
NEW_USERNAME=$1
NEW_PASSWORD=$2

response=$(curl --fail --silent --show-error \
    --user "$ADMIN_USERNAME:$NEXTCLOUD_PASSWORD" \
    --header 'OCS-APIRequest: true' \
    --header 'Accept: application/xml' \
    --request POST \
    --data-urlencode "userid=$NEW_USERNAME" \
    --data-urlencode "password=$NEW_PASSWORD" \
    "$BASE_URL/ocs/v1.php/cloud/users")
if ! grep -Eiq '<status>[[:space:]]*ok[[:space:]]*</status>' <<< "$response"; then
    echo 'Nextcloud user creation failed' >&2
    exit 1
fi
echo "Nextcloud user created: $NEW_USERNAME"

