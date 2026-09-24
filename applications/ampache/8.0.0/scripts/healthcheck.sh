#!/bin/bash
cd $(dirname $0)/..

echo 'Checking compose services...'
docker-compose -f docker/compose.yaml ps

echo 'Waiting for application to be available on port 18088...'
for i in {1..12}; do
    code=$(curl -sL -o /dev/null -w "%{http_code}" http://localhost:18088 || echo "000")
    if [ "$code" -eq 200 ]; then
        echo "Application is up and returning HTTP 200."
        exit 0
    fi
    echo "Waiting... ($code)"
    sleep 5
done

echo "Healthcheck failed, application did not return HTTP 200 in time."
exit 1
