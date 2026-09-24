#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18594}"
HOST="${HOST:-127.0.0.1}"

echo "Checking Apache RocketMQ NameServer health on ${HOST}:${HOST_PORT}..."

if nc -z -w 2 "$HOST" "$HOST_PORT" 2>/dev/null; then
    echo "SUCCESS: Apache RocketMQ NameServer is listening on port ${HOST_PORT}."
    exit 0
else
    echo "FAILED: Apache RocketMQ NameServer port ${HOST_PORT} is not accessible."
    exit 1
fi
