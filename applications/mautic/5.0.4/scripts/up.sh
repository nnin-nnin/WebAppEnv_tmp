#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Waiting for Mautic to become healthy..."
max_retries=50
counter=0
until bash "$SCRIPT_DIR/healthcheck.sh" >/dev/null 2>&1; do
  counter=$((counter + 1))
  if [ "$counter" -ge "$max_retries" ]; then
    echo "Mautic failed to become healthy after $max_retries retries" >&2
    bash "$SCRIPT_DIR/healthcheck.sh" || true
    exit 1
  fi
  sleep 3
done

# Synchronize admin password with resources/users.yaml
admin_password="${MAUTIC_PASSWORD:-WcMautic!26-dF8qN4X}"
docker compose -f docker/compose.yaml exec -T application php -r '
  $password = $argv[1];
  $hash = password_hash($password, PASSWORD_BCRYPT, ["cost" => 13]);
  $pdo = new PDO("mysql:host=127.0.0.1;dbname=mautic", "mautic", "mautic");
  $stmt = $pdo->prepare("UPDATE users SET password = ? WHERE username = ?");
  $stmt->execute([$hash, "admin"]);
' "$admin_password" >/dev/null 2>&1 || true

echo "Mautic is up and healthy."
