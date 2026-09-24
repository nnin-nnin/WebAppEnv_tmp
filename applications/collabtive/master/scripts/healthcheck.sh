#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."

echo "Waiting for services..."
for i in {1..36}; do
    if docker compose -f docker/compose.yaml ps | grep -q "healthy"; then
        if docker compose -f docker/compose.yaml exec -T db mysql -uroot -proot collabtive -e "SELECT ID FROM user WHERE name='admin';" >/dev/null 2>&1; then
            break
        fi
    fi
    sleep 2
done

echo "Checking HTTP endpoint..."
ready=0
for i in {1..30}; do
  if curl -sSf "${APP_URL:-http://127.0.0.1:18089}" > /dev/null 2>&1; then
    ready=1
    break
  fi
  sleep 2
done
if [ "$ready" -ne 1 ]; then
  echo "HTTP check failed"
  exit 1
fi
echo "Environment is healthy."
