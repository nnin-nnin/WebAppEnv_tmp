#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${SUGARCRM_PORT:-18629}"

cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for SugarCRM to become ready on port ${HOST_PORT}..."
for i in $(seq 1 60); do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "302" ]; then
        echo "Initializing SugarCRM via SilentInstall..."
        curl -s "http://127.0.0.1:${HOST_PORT}/install.php?goto=SilentInstall&cli=true" >/dev/null || true
    fi

    FINAL_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/index.php?action=Login&module=Users" 2>/dev/null || true)
    if [ "$FINAL_CODE" = "200" ]; then
        echo "SugarCRM is ready (HTTP $FINAL_CODE)!"
        exit 0
    fi
    sleep 2
done

echo "SugarCRM startup wait timed out"
docker compose -f docker/compose.yaml ps
docker compose -f docker/compose.yaml logs --tail=50
exit 1
