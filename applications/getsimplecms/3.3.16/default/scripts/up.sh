#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18762}"
ADMIN_PASS="${PASSWORD:-${ADMIN_PASSWORD:-admin}}"

echo "Starting GetSimple CMS 3.3.16 with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Waiting for GetSimple CMS service to be ready on port ${HOST_PORT}..."
ready=0
for i in {1..60}; do
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
  if [ "$HTTP_CODE" -eq 200 ]; then
    ready=1
    break
  fi
  sleep 1
done

if [ "$ready" -ne 1 ]; then
  echo "GetSimple CMS service failed to respond with HTTP 200 within 60s"
  exit 1
fi

echo "Configuring administrator credentials and site URL..."
docker compose -f docker/compose.yaml exec -T application php -r "
\$user_file = '/var/www/html/data/users/admin.xml';
if (file_exists(\$user_file)) {
  \$c = file_get_contents(\$user_file);
  \$c = preg_replace('/<PWD>.*<\/PWD>/', '<PWD>' . sha1('${ADMIN_PASS}') . '</PWD>', \$c);
  file_put_contents(\$user_file, \$c);
}
\$site_file = '/var/www/html/data/other/website.xml';
if (file_exists(\$site_file)) {
  \$c = file_get_contents(\$site_file);
  \$c = preg_replace('/<SITEURL><!\[CDATA\[.*?\]\]><\/SITEURL>/', '<SITEURL><![CDATA[http://127.0.0.1:${HOST_PORT}/]]></SITEURL>', \$c);
  file_put_contents(\$site_file, \$c);
}
" >/dev/null 2>&1 || true

echo "GetSimple CMS 3.3.16 is ready at http://127.0.0.1:${HOST_PORT}/"
