#!/bin/bash
cd $(dirname $0)/..

echo "Starting Ampache environment..."
docker-compose -f docker/compose.yaml up -d

echo "Waiting for containers to be healthy..."
sleep 10
bash scripts/healthcheck.sh

echo "Ensuring admin user is created..."
docker exec docker-ampache-1 php /var/www/bin/cli admin:addUser admin -p benchmark-only -l 100 || true

echo "Environment is up and ready!"
