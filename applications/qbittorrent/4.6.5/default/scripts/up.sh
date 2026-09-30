#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18681}"

echo "Starting qBittorrent 4.6.5 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Configuring qBittorrent WebUI settings..."
for i in {1..30}; do
    if docker compose -f docker/compose.yaml exec -T app test -f /config/qBittorrent/qBittorrent.conf 2>/dev/null; then
        break
    fi
    sleep 1
done

docker compose -f docker/compose.yaml exec -T app python3 - << 'PYEOF'
import os

conf_path = "/config/qBittorrent/qBittorrent.conf"
if not os.path.exists(conf_path):
    with open(conf_path, "w") as f:
        f.write("[Preferences]\n")

with open(conf_path, "r") as f:
    lines = f.read().splitlines()

target_hash = r'WebUI\Password_PBKDF2="@ByteArray(ARQ77eY1NUZaQsuDHbIMCA==:0WMRkYTUWVT9wVvdDtHAjU9b3b7uB8NR1Gur2hmQCvCDpm39Q+PsJRJPaCU51dEiz+dTzh8qbPsL8WkFljQYFQ==)"'
target_hhv = r"WebUI\HostHeaderValidation=false"

new_lines = []
has_pwd = False
has_hhv = False

for line in lines:
    if line.startswith(r"WebUI\Password_PBKDF2="):
        new_lines.append(target_hash)
        has_pwd = True
    elif line.startswith(r"WebUI\HostHeaderValidation="):
        new_lines.append(target_hhv)
        has_hhv = True
    elif line.strip() == "[Preferences]":
        new_lines.append(line)
        if not has_pwd:
            new_lines.append(target_hash)
            has_pwd = True
        if not has_hhv:
            new_lines.append(target_hhv)
            has_hhv = True
    else:
        new_lines.append(line)

if not has_pwd:
    new_lines.append(target_hash)
if not has_hhv:
    new_lines.append(target_hhv)

with open(conf_path, "w") as f:
    f.write("\n".join(new_lines) + "\n")
PYEOF

docker compose -f docker/compose.yaml exec -T app pkill -9 qbittorrent-nox 2>/dev/null || true

echo "Waiting for qBittorrent WebUI to be ready..."
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "qBittorrent is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 1
done

echo "qBittorrent startup complete on port ${HOST_PORT}."
