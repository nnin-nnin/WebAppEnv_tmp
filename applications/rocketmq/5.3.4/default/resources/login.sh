#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18594}"
HOST="${HOST:-127.0.0.1}"

echo "[*] Probing Apache RocketMQ NameServer at ${HOST}:${HOST_PORT}..."

# Probe TCP connectivity
if ! nc -z -w 3 "$HOST" "$HOST_PORT" 2>/dev/null; then
    echo "[-] FAILED: Cannot connect to RocketMQ NameServer on ${HOST}:${HOST_PORT}"
    exit 1
fi

echo "[+] Successfully connected to RocketMQ NameServer port ${HOST_PORT}"

# Query NameServer cluster metadata using mqadmin
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

if docker compose -f "$APP_DIR/docker/compose.yaml" ps app --status running --format "{{.Name}}" 2>/dev/null | grep -q .; then
    if docker compose -f "$APP_DIR/docker/compose.yaml" exec -T app sh mqadmin clusterList -n 127.0.0.1:9876 >/dev/null 2>&1; then
        echo "[+] SUCCESS: RocketMQ NameServer clusterList command verified successfully"
    fi
fi

echo "[+] SUCCESS: RocketMQ NameServer port probe verified successfully"
exit 0
