FROM mirror.gcr.io/library/eclipse-temurin:8-jre-jammy AS runtime
FROM mall:1.0.3-base AS compiled
FROM mall:1.0.3-frontend AS frontend
FROM runtime

RUN printf '#!/bin/sh\nexit 101\n' > /usr/sbin/policy-rc.d \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      mariadb-server \
      redis-server \
      curl \
      ca-certificates \
    && rm -f /usr/sbin/policy-rc.d \
    && rm -rf /var/lib/apt/lists/*

COPY --from=compiled /build/mall-admin/target/mall-admin-1.0-SNAPSHOT.jar /opt/mall/mall-admin.jar
COPY source/mall-1.0.3/ /opt/mall/source/mall-1.0.3/
COPY source/mall-admin-web-1.0.0/ /opt/mall/source/mall-admin-web-1.0.0/
COPY resources/application-all-in-one.yml /opt/mall/config/application-all-in-one.yml
COPY --from=frontend /build/dist/ /opt/mall/web/
COPY resources/initial-data/database-seed.sql /opt/mall/database-seed.sql
COPY scripts/entrypoint.sh /usr/local/bin/mall-entrypoint

RUN mkdir -p /opt/mall/config /opt/mall/web /run/mysqld /var/log/mall \
    && chmod 755 /usr/local/bin/mall-entrypoint \
    && chown -R mysql:mysql /var/lib/mysql /run/mysqld \
    && chown -R redis:redis /var/lib/redis \
    && chown -R root:root /opt/mall

VOLUME ["/var/lib/mysql", "/var/lib/redis", "/var/log/mall"]
EXPOSE 80

HEALTHCHECK --interval=10s --timeout=5s --start-period=45s --retries=18 \
  CMD curl -fsS http://127.0.0.1/actuator/health >/dev/null || exit 1

ENTRYPOINT ["/usr/local/bin/mall-entrypoint"]
