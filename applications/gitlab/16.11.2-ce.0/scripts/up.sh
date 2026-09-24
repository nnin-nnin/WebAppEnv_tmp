#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

for i in $(seq 1 90); do
  if bash "$SCRIPT_DIR/healthcheck.sh" >/dev/null 2>&1; then
    # Ensure background admin initialization/rename completes before claiming readiness
    for j in $(seq 1 30); do
      if docker compose -f docker/compose.yaml exec -T application gitlab-psql -d gitlabhq_production -tAc "SELECT EXISTS (SELECT 1 FROM users WHERE username='admin' AND admin=true);" 2>/dev/null | grep -q "t"; then
        break
      fi
      sleep 2
    done
    echo "GitLab is up and ready"
    exit 0
  fi
  sleep 3
done

echo "Timed out waiting for GitLab to become healthy" >&2
exit 1
