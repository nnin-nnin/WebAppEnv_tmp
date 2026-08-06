#!/bin/bash
set -e
docker run -d --name espocrm -p 18292:80 -v espocrm-data:/var/www/html/data -v espocrm-db:/var/lib/mysql -v espocrm-custom:/var/www/html/custom asteriskax001/sop-espocrm:8.2.5
