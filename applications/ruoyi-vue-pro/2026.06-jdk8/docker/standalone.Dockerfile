# syntax=docker/dockerfile:1.7

FROM eclipse-temurin@sha256:0aaabcd1e15dd4e360aff99b780d52388b774a3ddf31db4a3f10e96ebb2d9cb6 AS java-runtime

FROM mysql@sha256:fe968a89962f9d6bb594f7525bc1f61e0c61ff89500a41424899bcd7cf65a5c9
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH="/opt/java/openjdk/bin:${PATH}"
ENV TZ=Asia/Shanghai
ENV MYSQL_DATABASE=ruoyi-vue-pro
ENV MYSQL_ROOT_PASSWORD=123456
ENV JAVA_OPTS="-Xms512m -Xmx512m -Djava.security.egd=file:/dev/./urandom"

RUN rm -f /etc/apt/sources.list.d/mysql.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        nginx \
        redis-server \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /etc/nginx/sites-enabled/default

COPY --from=java-runtime /opt/java/openjdk /opt/java/openjdk
COPY resources/backend-app-runtime.jar /yudao-server/app.jar
COPY resources/frontend-dist/ /var/www/yudao-ui/
COPY resources/application-all-in-one.yaml /yudao-server/config/application-all-in-one.yaml
COPY resources/initial-data/database-seed.sql /docker-entrypoint-initdb.d/10-ruoyi-vue-pro.sql
COPY resources/nginx.conf /etc/nginx/conf.d/default.conf
COPY scripts/entrypoint.sh scripts/healthcheck.sh /usr/local/bin/

RUN chmod 0755 /usr/local/bin/entrypoint.sh /usr/local/bin/healthcheck.sh \
    && mkdir -p /var/lib/redis /var/lib/yudao/logs /var/www/yudao-ui \
    && chown -R redis:redis /var/lib/redis

VOLUME ["/var/lib/mysql", "/var/lib/redis", "/var/lib/yudao"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=10s --start-period=120s --retries=12 \
    CMD IN_CONTAINER=1 RUOYI_BASE_URL=http://127.0.0.1 /usr/local/bin/healthcheck.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
