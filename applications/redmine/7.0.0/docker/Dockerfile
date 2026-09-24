# syntax=docker/dockerfile:1.7

FROM redmine@sha256:8a07cc23db3cf833f3a7089ca2e64b609164f0472ba4f589bacd21a06a44879b AS base

ENV RAILS_ENV=production \
    RACK_ENV=production \
    RAILS_LOG_TO_STDOUT=true \
    BUNDLE_WITHOUT="development:test" \
    REDMINE_DB_HOST=127.0.0.1 \
    REDMINE_DB_NAME=redmine \
    REDMINE_DB_USER=redmine \
    REDMINE_DB_PASSWORD=redmine-local-db

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      build-essential ca-certificates curl default-libmysqlclient-dev \
      mariadb-client mariadb-server nginx pkg-config \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /run/mysqld /usr/src/redmine/files /usr/src/redmine/log /usr/src/redmine/tmp /usr/src/redmine/public/plugin_assets \
 && chown -R mysql:mysql /run/mysqld /var/lib/mysql \
 && chown -R redmine:redmine /usr/src/redmine

FROM base AS app

WORKDIR /usr/src/redmine
COPY source/redmine/ /usr/src/redmine/
COPY resources/config/database.yml /usr/src/redmine/config/database.yml
COPY resources/config/nginx.conf /etc/nginx/conf.d/default.conf

RUN printf '%s\n' "gem 'puma'" > /usr/src/redmine/Gemfile.local \
 && bundle check \
 && bundle exec rake generate_secret_token \
 && bundle exec rake assets:precompile \
 && test -s /usr/src/redmine/public/assets/.manifest.json \
 && find /usr/src/redmine/public/assets -type f -name '*.css' -print -quit | grep -q . \
 && find /usr/src/redmine/public/assets -type f -name '*.js' -print -quit | grep -q . \
 && chown -R redmine:redmine /usr/src/redmine

FROM app AS database-seed

RUN rm -rf /var/lib/mysql/* \
 && mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db \
 && mysqld --user=mysql --datadir=/var/lib/mysql --bind-address=127.0.0.1 --port=3306 --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid > /tmp/mariadb-bootstrap.log 2>&1 & \
    db_pid=$!; \
    for i in $(seq 1 60); do mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock ping >/dev/null 2>&1 && break; sleep 1; done; \
    mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock ping >/dev/null 2>&1; \
    mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot -e "CREATE DATABASE redmine CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; CREATE USER 'redmine'@'127.0.0.1' IDENTIFIED BY 'redmine-local-db'; CREATE USER 'redmine'@'localhost' IDENTIFIED BY 'redmine-local-db'; GRANT ALL PRIVILEGES ON redmine.* TO 'redmine'@'127.0.0.1'; GRANT ALL PRIVILEGES ON redmine.* TO 'redmine'@'localhost'; FLUSH PRIVILEGES;"; \
    bundle exec rake db:migrate RAILS_ENV=production; \
    kill "$db_pid"; wait "$db_pid" || true

RUN --mount=type=secret,id=admin_password,required=true \
    set -eu; \
    mysqld --user=mysql --datadir=/var/lib/mysql --bind-address=127.0.0.1 --port=3306 --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid > /tmp/mariadb-password.log 2>&1 & \
    db_pid=$!; \
    for i in $(seq 1 60); do mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock ping >/dev/null 2>&1 && break; sleep 1; done; \
    mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock ping >/dev/null 2>&1; \
    REDMINE_INITIAL_PASSWORD="$(cat /run/secrets/admin_password)" bundle exec rails runner 'u = User.find_by!(login: "admin"); p = ENV.fetch("REDMINE_INITIAL_PASSWORD"); u.password = p; u.password_confirmation = p; u.must_change_passwd = false; u.save!(validate: false)'; \
    mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot shutdown; \
    wait "$db_pid" || true; \
    rm -rf /usr/src/redmine/log/* /usr/src/redmine/tmp/* /tmp/mariadb-bootstrap.log /tmp/mariadb-password.log

FROM base AS final

WORKDIR /usr/src/redmine
COPY --from=app /usr/src/redmine /usr/src/redmine
COPY --from=database-seed /var/lib/mysql /usr/local/share/redmine-initial-db
COPY --from=app /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY scripts/entrypoint.sh /usr/local/bin/redmine-entrypoint

RUN chmod 0755 /usr/local/bin/redmine-entrypoint \
 && rm -f /etc/nginx/sites-enabled/default \
 && mkdir -p /var/lib/mysql /run/mysqld \
 && chown -R mysql:mysql /var/lib/mysql /run/mysqld \
 && chown -R redmine:redmine /usr/src/redmine \
 && chmod 1777 /usr/src/redmine/tmp

VOLUME ["/usr/src/redmine/files", "/usr/src/redmine/log", "/usr/src/redmine/tmp", "/var/lib/mysql"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=45s --retries=12 CMD curl -fsS http://127.0.0.1/ | grep -Eiq 'Redmine|Projects|My page'
ENTRYPOINT ["/usr/local/bin/redmine-entrypoint"]
