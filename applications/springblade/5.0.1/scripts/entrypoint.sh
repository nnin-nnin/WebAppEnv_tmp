#!/bin/bash
set -e

# Initialize MySQL
chown -R mysql:mysql /var/lib/mysql
if [ -z "$(ls -A /var/lib/mysql)" ]; then
    echo "Initializing MySQL..."
    mysqld --initialize-insecure --user=mysql
fi

echo "Starting Redis..."
redis-server --daemonize yes

echo "Starting MySQL..."
mysqld_safe --user=mysql &

# The first boot starts with an empty root password; later boots use the
# password configured below. Try both credentials while waiting for MySQL,
# then reuse the matching client arguments for every subsequent command.
MYSQL_ARGS=(-u root)
for i in {1..30}; do
    if mysqladmin -u root -proot ping --silent; then
        MYSQL_ARGS=(-u root -proot)
        break
    elif mysqladmin -u root ping --silent; then
        MYSQL_ARGS=(-u root)
        break
    fi
    sleep 1
done

echo "Setting up database..."
mysql "${MYSQL_ARGS[@]}" -e "CREATE DATABASE IF NOT EXISTS blade DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"
# Keep the root account usable by the Java TCP client as well as local tools.
mysql "${MYSQL_ARGS[@]}" -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';" || true
MYSQL_ARGS=(-u root -proot)
mysql "${MYSQL_ARGS[@]}" -e "FLUSH PRIVILEGES;"

if [ ! -f "/var/lib/mysql/.initialized" ]; then
    if [ -f "/docker-entrypoint-initdb.d/database-seed.sql" ]; then
        echo "Importing initial data..."
        mysql "${MYSQL_ARGS[@]}" blade < /docker-entrypoint-initdb.d/database-seed.sql
        touch /var/lib/mysql/.initialized
    fi
fi

echo "Starting Nginx..."
service nginx start

echo "Starting SpringBlade..."
JAVA_OPTS=${JAVA_OPTS:-"-Xms256m -Xmx1024m -XX:MaxMetaspaceSize=256m -XX:+UseSerialGC"}
java --add-opens java.base/java.lang=ALL-UNNAMED \
     --add-opens java.base/java.lang.reflect=ALL-UNNAMED \
     ${JAVA_OPTS} \
     -Djava.security.egd=file:/dev/./urandom \
     -jar /app/app.jar --server.port=8800 --spring.profiles.active=test &
     
echo "All services started."
# Keep container running
wait -n
